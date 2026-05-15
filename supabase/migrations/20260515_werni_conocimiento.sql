-- Crear tabla si no existe
create table if not exists werni_conocimiento (
  id uuid primary key default gen_random_uuid(),
  categoria text not null,
  titulo text not null,
  contenido text not null,
  fuente text,
  created_at timestamptz default now()
);

-- Índice para búsqueda rápida por categoría
create index if not exists idx_werni_categoria on werni_conocimiento(categoria);

-- ══════════════════════════════════════════════════════════════════
-- HITOS DEL DESARROLLO
-- ══════════════════════════════════════════════════════════════════
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'Hitos comunicativos 0-12 meses', 'Susanibar et al.',
'0-3 meses: gorjeo, reacciona al sonido, sonrisa social.
3-6 meses: balbuceo reduplicado (ba-ba, ma-ma), gira hacia la voz.
6-9 meses: balbuceo variado, imitación de sonidos, comprende "no".
9-12 meses: jerga entonada, 1-3 palabras funcionales, señalar protodeclarativo, juego de causa-efecto.
⚠️ Señales de alerta: sin balbuceo a los 9 meses, sin palabras a los 12 meses, sin señalar ni hacer gestos.'),

('hitos_desarrollo', 'Hitos comunicativos 12-24 meses', 'Susanibar et al.',
'12-18 meses: 10-50 palabras, jerga con palabras reales, señalar para pedir.
18-24 meses: explosión del vocabulario, primeras combinaciones de 2 palabras, vocabulario mínimo 50 palabras.
24 meses: frases de 2-3 palabras, usa pronombres yo/tú, 50% inteligible para extraños.
⚠️ Señales de alerta: menos de 10 palabras a los 18 meses, sin combinaciones a los 24 meses, pérdida de habilidades ya adquiridas (regresión).'),

('hitos_desarrollo', 'Hitos comunicativos 2-4 años', 'ASHA / Bishop',
'2-3 años: frases de 3-4 palabras, pregunta ¿qué? y ¿dónde?, 75% inteligible.
3-4 años: oraciones complejas, narra experiencias, usa plurales y verbos en pasado, 100% inteligible para extraños.
4-5 años: comprende conceptos temporales (antes/después), usa oraciones subordinadas, vocabulario ~1500 palabras.
⚠️ Señales de alerta: no forma frases a los 3 años, no responde preguntas simples, ininteligible para extraños después de los 3 años.');

-- ══════════════════════════════════════════════════════════════════
-- MOF Y DEGLUCIÓN
-- ══════════════════════════════════════════════════════════════════
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('mof_deglucion', 'Deglución: fases y normalidad por edad', 'Susanibar — Motricidad Orofacial',
'Fase oral: preparación (masticación, mezcla con saliva) + propulsión del bolo hacia faringe.
Fase faríngea: reflejo de deglución, cierre velofaríngeo, protección de vía aérea.
Fase esofágica: peristaltismo hasta estómago.
Normalidad evolutiva: deglución infantil (lengua entre dientes) es normal hasta los 3 años. Después de los 3 años persistente = deglución atípica.
⚠️ Señales de alerta: tos/atragantamiento frecuente, regurgitación nasal, voz húmeda post-deglución, infecciones respiratorias recurrentes.'),

('mof_deglucion', 'Hábitos de succión no nutritiva', 'Susanibar / Marchesan',
'Chupete: impacto menor si se retira antes de los 3 años. Después: puede generar mordida abierta anterior, deglución atípica, respiración oral.
Dedo: impacto mayor por presión constante. Asociado a retrognatia y paladar ojival.
Mamadera prolongada: más allá de los 2 años asociada a hábito de succión y dificultades de masticación.
Estrategia clínica: primero registrar el hábito, evaluar impacto dental y de deglución, derivar a odontología si hay maloclusion, trabajar el hábito en paralelo al tratamiento fonoaudiológico.'),

('mof_deglucion', 'Respiración oral: evaluación e impacto', 'Marchesan',
'Causas: obstrucción nasal (adenoides, rinitis), hábito instaurado.
Impacto: paladar ojival, protrusión lingual, tono muscular facial bajo, postura de cabeza adelantada, alteraciones del sueño.
Evaluación: test del espejo, observación del sello labial en reposo, examen de cornetes.
Rol fonoaudiológico: trabajo de musculatura labial, ejercicios de sello labial, coordinación nariz-boca.
⚠️ Derivar ORL antes de iniciar tratamiento fonoaudiológico si hay obstrucción anatómica.');

-- ══════════════════════════════════════════════════════════════════
-- HABLA Y FONOLOGÍA
-- ══════════════════════════════════════════════════════════════════
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('habla_fonologia', 'Adquisición fonológica del español chileno', 'Susanibar / AFA',
'3 años: /p, b, m, n, t, d, k, g, f, l, j, ch/
4 años: /s, ñ, y/
5 años: /r/ (vibrante simple)
6 años: /rr/ (vibrante múltiple), grupos consonánticos (tr, pl, gr...)
Procesos fonológicos NORMALES hasta los 3-4 años: reducción de grupos, asimilación, metátesis.
Procesos que deben estar eliminados antes de los 4 años: sustituciones sistemáticas, omisión de consonantes finales.
⚠️ Señal de alerta: proceso fonológico persistente fuera del rango etario esperado.'),

('habla_fonologia', 'Criterios de inteligibilidad por edad', 'ASHA',
'18 meses: 25% inteligible para extraños.
24 meses: 50% inteligible para extraños.
36 meses: 75% inteligible para extraños.
48 meses: 100% inteligible para extraños.
PCC (Porcentaje de Consonantes Correctas): >85% normal, 65-85% leve, 50-65% moderado, <50% severo.
Nota clínica: la inteligibilidad depende del contexto. Siempre contrastar con comprensión del cuidador vs extraños.');

-- ══════════════════════════════════════════════════════════════════
-- TEA Y CONDICIONES ESPECIALES
-- ══════════════════════════════════════════════════════════════════
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('tea_autismo', 'Señales de alerta TEA en anamnesis', 'DSM-5 / ASHA',
'Señales tempranas (antes de los 2 años): no señala con el índice, no responde a su nombre, no hace juego de imitación (peek-a-boo), no hay atención conjunta, pérdida de lenguaje ya adquirido.
Señales en lenguaje: ecolalia inmediata o retardada, inversión pronominal (dice "tú" por "yo"), lenguaje muy literal, dificultad para conversación recíproca.
Señales conductuales que orientan: intereses restrictivos, rutinas inflexibles, sensibilidades sensoriales marcadas.
⚠️ Werni no diagnostica TEA. Si hay 3 o más señales presentes, sugerir derivación a equipo multidisciplinario (neuropediatría + psicología + fonoaudiología).'),

('condiciones_especiales', 'Hipoacusia: señales de alerta e impacto comunicativo', 'ASHA',
'Señales en lactante: no reacciona a sonidos fuertes, no localiza la fuente sonora a los 6 meses.
Señales en niño mayor: voz muy alta o muy baja, dificultad en ruido, pide repetición frecuente, rendimiento escolar bajo en dictados/lectura.
Impacto fonoaudiológico: retraso fonológico secundario, léxico reducido, morfosintaxis simplificada.
⚠️ Siempre sugerir evaluación audiológica (audiometría tonal + logoaudiometría + impedanciometría) ante cualquier sospecha. No iniciar terapia de habla sin descartar hipoacusia.'),

('condiciones_especiales', 'Síndrome de Down: perfil comunicativo', 'Susanibar / evidencia revisada',
'Perfil típico: mayor competencia en comprensión que en expresión, vocabulario en desarrollo pero morfosintaxis más reducida, alteraciones de habla por hipotonía orofacial y macroglosia.
Hitos más tardíos pero secuencia similar al desarrollo típico.
Áreas fonoaudiológicas: MOF (tono, deglución), habla (inteligibilidad), lenguaje (vocabulario, frases), comunicación aumentativa si necesario.
⚠️ Evaluar siempre hipoacusia conductiva (otitis serosa frecuente en SD). Coordinar con kinesiólogo para tono global.');

-- ══════════════════════════════════════════════════════════════════
-- PLANIFICACIÓN
-- ══════════════════════════════════════════════════════════════════
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('planificacion', 'Objetivos bien formulados en fonoaudiología', 'Modelo SMART clínico',
'Un objetivo clínico bien formulado incluye: conducta observable + condición + criterio de logro + plazo.
Ejemplo correcto: "El paciente producirá /r/ en posición inicial de sílaba con 80% de precisión en 3 de 4 intentos en contexto de conversación espontánea, en 8 semanas."
Ejemplo incorrecto: "Mejorar la pronunciación de la r."
Logros se redactan en pasado: "Produjo /s/ con 85% de precisión en palabras bisílabas."
Observaciones se redactan en presente descriptivo: "Se observa omisión de coda consonántica en posición final."');
