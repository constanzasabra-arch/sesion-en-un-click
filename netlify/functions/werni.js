const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_KEY;
const ANTHROPIC_KEY = process.env.ANTHROPIC_API_KEY;

const WERNI_BASE = `Eres Werni, asistente clínico experto de la fonoaudióloga Constanza Sabra (Fono Aprende). Copiloto clínico 24/7 basado en evidencia científica.

IDENTIDAD: Técnico, empático, breve, directo. Máximo 150 palabras. Siempre en español.

PRIORIDADES: 1. Inteligibilidad sobre perfección articulatoria. 2. Evidencia Susanibar, Bishop, ASHA. 3. Si hay inconsistencia evolutiva: lanza ⚠️ Alerta Clínica.

ROLES:
- mejorar_logros: lenguaje técnico-clínico para informe
- mejorar_obs: lenguaje clínico formal
- mejorar_tareas: simple, para familia, con ejemplos concretos
- mensaje_familia: empático, sin jerga, max 3 párrafos
- auditar: compara con hitos para la edad, alerta si no corresponde
- anamnesis: identifica señales de alerta, sugiere evaluaciones`;

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 200, headers: { 'Access-Control-Allow-Origin': '*', 'Access-Control-Allow-Headers': 'Content-Type', 'Access-Control-Allow-Methods': 'POST, OPTIONS' }, body: '' };
  }
  if (event.httpMethod !== 'POST') return { statusCode: 405, body: 'Method Not Allowed' };
  if (!ANTHROPIC_KEY) return { statusCode: 500, headers: { 'Access-Control-Allow-Origin': '*' }, body: JSON.stringify({ error: 'API key no configurada' }) };

  const { mensaje, tipo, paciente } = JSON.parse(event.body || '{}');

  let contextoConocimiento = '';
  if (SUPABASE_URL && SUPABASE_KEY) {
    try {
      const sb = createClient(SUPABASE_URL, SUPABASE_KEY);
      const categoriasMap = {
        'logros': ['habla_fonologia', 'planificacion'],
        'observaciones': ['habla_fonologia', 'evaluacion'],
        'tareas': ['planificacion', 'hitos_desarrollo'],
        'familia': ['hitos_desarrollo', 'desarrollo_comunicacion'],
        'anamnesis': ['hitos_desarrollo', 'condiciones_especiales', 'tea_autismo', 'mof_deglucion'],
        'auditar': ['habla_fonologia', 'hitos_desarrollo'],
        'mof': ['mof_deglucion']
      };
      const categorias = categoriasMap[tipo] || ['habla_fonologia', 'lenguaje', 'hitos_desarrollo'];
      const { data: conocimiento } = await sb.from('werni_conocimiento').select('titulo, contenido').in('categoria', categorias).limit(4);
      if (conocimiento && conocimiento.length > 0) {
        contextoConocimiento = '\n\nCONOCIMIENTO CLÍNICO RELEVANTE:\n' + conocimiento.map(k => `${k.titulo}:\n${k.contenido.slice(0, 500)}`).join('\n\n');
      }
    } catch (e) { console.log('KB error:', e.message); }
  }

  let contextoPaciente = '';
  if (paciente) {
    contextoPaciente = `\n\nPACIENTE: ${paciente.nombre || ''}, ${paciente.edad || ''}, Dx: ${paciente.diagnostico || ''}`;
  }

  try {
    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-api-key': ANTHROPIC_KEY, 'anthropic-version': '2023-06-01' },
      body: JSON.stringify({
        model: 'claude-haiku-4-5-20251001',
        max_tokens: 500,
        system: WERNI_BASE + contextoPaciente + contextoConocimiento,
        messages: [{ role: 'user', content: mensaje }]
      })
    });
    const data = await response.json();
    if (!response.ok) return { statusCode: response.status, headers: { 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json' }, body: JSON.stringify({ error: data.error?.message }) };
    return { statusCode: 200, headers: { 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json' }, body: JSON.stringify({ respuesta: data.content[0].text }) };
  } catch (err) {
    return { statusCode: 500, headers: { 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json' }, body: JSON.stringify({ error: err.message }) };
  }
};
