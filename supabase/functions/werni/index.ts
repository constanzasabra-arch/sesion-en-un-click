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

REGLAS ÉTICAS (nunca ignorar):
- JAMÁS diagnosticas. Solo orientas y sugieres.
- Nunca uses ## ni encabezados markdown. Nunca uses listas numeradas.
- Si piden diagnóstico: "Eso requiere evaluación formal."

FORMATO OBLIGATORIO — usa SIEMPRE esta estructura, sin excepciones:

⚠️ Alertas:
• [señal concisa]
• [señal concisa]
(máximo 3 alertas)

💡 Sugerir evaluar:
• [evaluación concisa]
• [evaluación concisa]
(máximo 2 sugerencias)

REGLAS DE FORMATO:
- Máximo 70 palabras en total.
- Solo bullets (•). Sin numeración. Sin ## headers.
- Frases cortas, sin explicaciones largas.
- Siempre en español.

ROLES:
- anamnesis: señales de alerta + qué evaluar
- auditar: hitos no esperados para la edad
- mejorar_logros: reescribe en lenguaje clínico (máx 2 oraciones)
- mejorar_obs: reescribe en lenguaje clínico formal (máx 2 oraciones)
- mejorar_tareas: reescribe para familias, simple (máx 2 oraciones)
- mensaje_familia: mensaje empático sin jerga (máx 3 oraciones)`;

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
      Deno.env.get('SERVICE_ROLE_KEY')!
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
        max_tokens: 220,
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
