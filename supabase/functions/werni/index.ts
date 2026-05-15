import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
  'Content-Type': 'application/json',
};

// ── Prompt base de Werni ──────────────────────────────────────────
const WERNI_BASE = `Eres Werni, copiloto clínico de la fonoaudióloga Constanza Sabra (Fono Aprende).

ROL ÉTICO — CRÍTICO, NUNCA IGNORAR:
- JAMÁS diagnosticas. Solo orientas y sugieres evaluaciones.
- Usas frases como "se observa...", "podría sugerir evaluar...", "es relevante considerar...".
- Si alguien pide un diagnóstico, respondes: "Eso requiere evaluación formal. Puedo orientarte sobre qué explorar."
- Cuando hay señales de alerta, usas ⚠️ y sugieres derivación, nunca afirmas diagnóstico.

FORMATO DE RESPUESTA:
- Máximo 120 palabras. Conciso y claro.
- Usa bullet points (•) cuando listes más de 2 cosas.
- Emojis de apoyo: 🔍 observación, ⚠️ alerta clínica, 💡 sugerencia, ✅ positivo.
- Siempre en español. Tono profesional pero cálido.

EVIDENCIA: Susanibar, Bishop, ASHA, DSM-5. Cita fuente solo si es clave.

ROLES DISPONIBLES:
- anamnesis: lee la anamnesis, identifica señales de alerta y SUGIERE qué evaluar
- auditar: compara hitos evolutivos, señala lo que no corresponde a la edad
- mejorar_logros: reescribe logros en lenguaje técnico-clínico de informe
- mejorar_obs: reescribe observaciones en lenguaje clínico formal
- mejorar_tareas: reescribe tareas en lenguaje simple para familias
- mensaje_familia: redacta mensaje empático para familia, sin jerga`;

const CATEGORIAS_MAP: Record<string, string[]> = {
  anamnesis:      ['hitos_desarrollo', 'condiciones_especiales', 'tea_autismo', 'mof_deglucion'],
  auditar:        ['hitos_desarrollo', 'habla_fonologia'],
  mejorar_logros: ['habla_fonologia', 'planificacion'],
  mejorar_obs:    ['habla_fonologia', 'evaluacion'],
  mejorar_tareas: ['planificacion', 'hitos_desarrollo'],
  mensaje_familia:['hitos_desarrollo', 'desarrollo_comunicacion'],
  mof:            ['mof_deglucion'],
};

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('', { headers: CORS });
  if (req.method !== 'POST') return new Response(JSON.stringify({ error: 'Method Not Allowed' }), { status: 405, headers: CORS });

  const ANTHROPIC_KEY = Deno.env.get('ANTHROPIC_API_KEY');
  if (!ANTHROPIC_KEY) return new Response(JSON.stringify({ error: 'API key no configurada' }), { status: 500, headers: CORS });

  const { mensaje, tipo, paciente } = await req.json();

  // Recuperar conocimiento clínico desde Supabase
  let contextoConocimiento = '';
  try {
    const sb = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    );
    const categorias = CATEGORIAS_MAP[tipo] || ['hitos_desarrollo', 'habla_fonologia'];
    const { data } = await sb
      .from('werni_conocimiento')
      .select('titulo, contenido')
      .in('categoria', categorias)
      .limit(4);

    if (data && data.length > 0) {
      contextoConocimiento = '\n\nCONOCIMIENTO CLÍNICO DE REFERENCIA (solo orienta, no diagnostica):\n'
        + data.map((k: { titulo: string; contenido: string }) => `${k.titulo}:\n${k.contenido.slice(0, 500)}`).join('\n\n');
    }
  } catch (e) { console.error('KB error:', e); }

  // Contexto del paciente
  let contextoPaciente = '';
  if (paciente) {
    contextoPaciente = `\n\nCONTEXTO DEL PACIENTE (solo para orientar, no diagnosticar):
Nombre: ${paciente.nombre || 'No indicado'}
Edad: ${paciente.edad || 'No indicada'}
Diagnóstico previo: ${paciente.diagnostico || 'Sin diagnóstico previo'}`;
  }

  const systemPrompt = WERNI_BASE + contextoPaciente + contextoConocimiento;

  try {
    const res = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': ANTHROPIC_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-haiku-4-5-20251001',
        max_tokens: 400,
        system: systemPrompt,
        messages: [{ role: 'user', content: mensaje }],
      }),
    });
    const data = await res.json();
    if (!res.ok) return new Response(JSON.stringify({ error: data.error?.message }), { status: res.status, headers: CORS });
    return new Response(JSON.stringify({ respuesta: data.content[0].text }), { headers: CORS });
  } catch (err) {
    return new Response(JSON.stringify({ error: (err as Error).message }), { status: 500, headers: CORS });
  }
});
