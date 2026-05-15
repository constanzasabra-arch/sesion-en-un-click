-- ══════════════════════════════════════════════════════════════════
-- CONOCIMIENTO EXTRAÍDO DE PDFs — LOTE 2
-- Fuentes: Susanibar (ATM/DMO), Bishop/Catalise (TDL), Castilla-Earls (morfosintaxis), ASHA (TSH/AHI)
-- ══════════════════════════════════════════════════════════════════

-- ── EVALUACIÓN MORFOFUNCIONAL Y ATM ──────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('mof_deglucion', 'ATM: evaluación rangos de movimiento mandibular', 'Susanibar',
'Apertura bucal normal: 40–55 mm en adultos.
⚠️ <30 mm = hipomóvil → evaluar ATM antes de terapia fonoaudiológica.
⚠️ >55 mm = hipermóvil → riesgo de luxación.
Lateralidades: mínimo 8 mm derecha e izquierda.
Protrusión: mínimo 6 mm.
Ruidos articulares (clic, crepitación): registrar y derivar a odontología/kinesiólogo si limitan función.
💡 La estabilidad mandibular es prerequisito para producción de /s/, /t/, /l/, /r/. Sin jaw stability adecuada, no iniciar terapia articulatoria de esos fonemas.'),

('mof_deglucion', 'DMO: definición, áreas y orden de intervención', 'ASHA 1992 / Susanibar',
'Definición DMO (ASHA 1992): área de la fonoaudiología que evalúa y trata las funciones del sistema estomatognático.
5 áreas: reposo, respiración, masticación, deglución, habla.
Orden de intervención (de base a cima):
1° Reposo (postura labial y lingual en reposo)
2° Respiración (modo nasal vs oral)
3° Masticación (bilateral alternada, eficiencia)
4° Deglución (patrón maduro)
5° Habla (articulación, resonancia)
⚠️ No iniciar trabajo de habla si hay alteración en funciones base (reposo, respiración). Primero estabilizar la base.'),

('mof_deglucion', 'Estructuras anatómicas y su impacto en habla', 'Susanibar — Tabla 4 EAH',
'Frenillo lingual corto (anquiloglosia) → distorsión o sustitución de /r/, /l/; dificultad elevación lingual.
Paladar alto/ojival → fonemas palatales alterados (/ch/, /ll/, /ñ/); resonancia modificada.
Fisura submucosa del paladar → hipernasalidad; insuficiencia velofaríngea sin fisura visible.
Anquiloglosia severa → omisión de /r/; habla imprecisa.
Amígdalas grado 3-4 → obstrucción vía aérea; resonancia oral disminuida → derivar ORL.
Adenoides hipertrofiadas → respiración oral; voz hiponasal; derivar ORL antes de terapia.
💡 La evaluación EAH (Estructuras Anatómicas del Habla) precede a cualquier diagnóstico de TSH.'),

('mof_deglucion', 'Deglución madura vs infantil: diferencias clave', 'Susanibar',
'Deglución infantil (normal hasta 3 años):
• Lengua entre incisivos o contra labio inferior
• Maxilares separados durante deglución
• Actividad muscular perioral visible (V par trigeminal)
• Normal hasta los 3 años

Deglución madura (esperada desde 3 años):
• Lengua en papila retroincisiva (rugas palatinas)
• Maxilares en oclusión
• Sin actividad muscular facial visible
• VII par facial no activo
• Labios en contacto sin tensión

⚠️ Deglución atípica persistente >3 años → evaluar hábitos de succión, respiración oral y oclusión dental. Coordinar con ortodoncia.'),

('mof_deglucion', 'Independencia linguomandibular: evaluación e importancia', 'Susanibar',
'La independencia linguomandibular (ILM) es la capacidad de mover la lengua sin que se mueva la mandíbula.
Importancia clínica: necesaria para producción de /t/, /d/, /n/, /l/, /r/, /s/.
Evaluación: pedir elevación de ápice lingual con boca abierta a 20 mm. Si la mandíbula sube junto con la lengua → ILM deficiente.
Tratamiento previo: estabilizar mandíbula antes de trabajar movilidad lingual.
💡 Muchos niños diagnosticados con "dislalia de /r/" tienen déficit de ILM como causa subyacente. Evaluar siempre antes de terapia articulatoria.');

-- ── TDL: TRASTORNO DEL DESARROLLO DEL LENGUAJE ───────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'TDL: definición y criterios diagnósticos (Catalise/Bishop)', 'Bishop et al. (Catalise) / MINEDUC Chile 2025',
'TDL = Trastorno del Desarrollo del Lenguaje (reemplaza TEL).
Definición Catalise/Bishop 2016: dificultad significativa en lenguaje oral SIN causa médica identificada, SEVERO y PERSISTENTE.
Algoritmo Catalise:
• ¿Hay condición biomédica? (SD, TEA, hipoacusia, lesión neurológica) → "TL asociado a X"
• ¿Sin condición biomédica? → TDL
Criterio MINEDUC Chile 2025: TEL → TL (Trastorno del Lenguaje) para uso en PIE/FUDEI; TDL en informes clínicos especializados.
Edad diagnóstica: <2a señal de riesgo; 2–3a hablante tardío; 3–4a en estudio; ≥4–5a TDL confirmable.
Prevalencia: ~7% en población escolar.'),

('hitos_desarrollo', 'TDL: factores de riesgo y mitos a derribar', 'Bishop / evidencia revisada',
'Factores de riesgo con mayor evidencia:
• Antecedentes familiares de TDL (riesgo x4)
• Sexo masculino (1.5:1 vs femenino)
• Prematuridad
• Nivel socioeconómico bajo (factor ambiental modulador)

Mitos clínicos (FALSO):
❌ "Se le va a pasar solo" → FALSO: TDL es persistente sin intervención.
❌ "Los niños varones hablan más tarde" → FALSO: es factor de riesgo, no normalidad.
❌ "Hay que esperar a los 5 años para diagnosticar" → FALSO: se puede orientar desde los 3–4 años.
❌ "Es un retraso simple, se pondrá al día" → FALSO: retraso simple es transitorio; TDL no.
💡 Intervención temprana mejora pronóstico académico significativamente.'),

('hitos_desarrollo', 'TDL: diagnóstico diferencial con TEA, retraso simple y TSH', 'Catalise / DSM-5 / ASHA',
'TDL vs Retraso simple del lenguaje:
• Retraso simple: transitorio, se normaliza antes de los 5 años, sin compromiso morfosintáctico severo.
• TDL: persistente, afecta morfosintaxis, léxico, procesamiento. No se normaliza solo.

TDL vs TEA:
• TEA: compromiso pragmático y social primario; intención comunicativa reducida.
• TDL: intención comunicativa PRESERVADA; dificultad en forma y contenido, no en uso social primario.

TDL vs TSH puro (Trastorno del Sonido del Habla):
• TSH: lenguaje comprensivo NORMAL; solo afecta producción de fonemas.
• TDL: compromete comprensión, morfosintaxis, léxico.
⚠️ Pueden coexistir TSH + TDL; evaluar ambas dimensiones siempre.');

-- ── MORFOSINTAXIS ─────────────────────────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'Hitos morfosintácticos por edad', 'Susanibar / ASHA / Castilla-Earls',
'1 año: holofrases (1 palabra = enunciado completo).
2 años: combinaciones de 2 palabras ("agua más", "mamá ven"); LME ~2 palabras.
3 años: frases SVO de 3–4 palabras; plurales; verbos en presente; LME ~3–4 palabras.
4 años: oraciones compuestas; preguntas ¿qué? ¿dónde? ¿quién?; pasado irregular; LME ~4–5 palabras.
5 años: conjunciones (porque, pero, cuando); oraciones subordinadas; futuro; LME ~5–6 palabras.
6 años: voz pasiva emergente; condicionales; pronombres relativos; LME >6 palabras.
⚠️ LME por debajo del rango esperado para la edad → evaluar morfosintaxis comprensiva y expresiva.'),

('hitos_desarrollo', 'Errores morfosintácticos marcadores clínicos de TDL', 'Castilla-Earls 2020 / Leonard',
'Errores altamente específicos de TDL en español:
• Omisión del artículo: "es _ tren" en vez de "es el tren"
• Omisión de preposición átona: "viene _ Barcelona" en vez de "viene de Barcelona"
• Omisión de clítico: "mira, tira_" en vez de "mira, lo tira"
• Uso excesivo de infinitivo: "niños dormir" en vez de "los niños duermen"
• Errores de concordancia género: "la niño", "los mesa"
• Errores de concordancia número: "los niña corre"
Hipótesis de superficie (Leonard): las preposiciones átonas monosilábicas se omiten por bajo peso fonológico → marcador sensible y específico de TDL.
💡 Los clíticos y verbos son los marcadores más discriminativos (Castilla-Earls 2020).');

-- ── FONÉTICA, FONOLOGÍA Y TSH ─────────────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('habla_fonologia', 'Fonética vs fonología: distinción clínica clave', 'ASHA / Susanibar',
'Error FONÉTICO: el niño no puede producir el fonema en ningún contexto (ni en aislado). Causa: articulatoria/motora.
Error FONOLÓGICO: el niño PUEDE producir el fonema en aislado pero falla en palabras o en contraste. Causa: representación mental del sistema fonológico.
Importancia clínica:
• Error fonético → objetivo: aprender el gesto motor del fonema
• Error fonológico → objetivo: consolidar el contraste en el sistema (pares mínimos, conciencia fonológica)
⚠️ Distinguir si es fonético o fonológico antes de planificar tratamiento — la terapia es diferente para cada caso.'),

('habla_fonologia', 'Adquisición fonemas español chileno con edades límite', 'Susanibar / tabla adquisición',
'3 años (consolidados): /p, b, m, n, t, d, k, g, f, l, j, ch, ñ, y/
4 años: /r/ percusiva simple (ISIP), /s/, grupos laterales (pl, bl, fl, cl, gl)
5 años: /r̄/ vibrante múltiple, grupos centrales (pr, br, tr, dr, cr, gr, fr)
6 años: consolidación de todos los grupos consonánticos.
Procesos fonológicos NORMALES hasta 3–4 años: reducción de grupos consonánticos, asimilación, metátesis.
⚠️ Todo proceso fonológico persistente después de la edad límite → evaluar con PEFF u otro protocolo estandarizado.
Nota: /rr/ antes llamado "vibrante múltiple" — actualmente denominado percusiva múltiple o /r̄/.'),

('habla_fonologia', 'TSH: subtipos y clasificación actualizada', 'ASHA / Dodd / Shriberg',
'TSH = Trastorno del Sonido del Habla (reemplaza "dislalia").
Clasificación:
• TSH idiopático fonético: solo articulación, sin causa orgánica.
• TSH idiopático fonológico: sistema fonológico alterado, sin causa orgánica.
• TSH idiopático mixto: fonético + fonológico.
• TSH orgánico/estructural: causa anatómica (frenillo, fisura, maloclusión).
• TSH neuromotor — Disartria: causa neurológica con debilidad/incoordinación muscular.
• TSH neuromotor — AHI (Apraxia del Habla Infantil): causa neuromotora planificación/programación.
• TSH sensorial: hipoacusia como causa.
Nomenclatura actualizada: dislalia→TSH; TEL→TDL; dispraxia verbal→AHI.'),

('habla_fonologia', 'AHI: criterios diagnósticos ASHA 2007 (Apraxia Habla Infantil)', 'ASHA 2007',
'AHI = Apraxia del Habla Infantil. Trastorno neuromotor de planificación/programación motora del habla.
3 criterios ASHA 2007 (deben estar los 3):
1. Inconsistencia fonémica ≥40% en producción de palabras (el mismo error no se repite igual).
2. Transiciones coarticulatorias alteradas entre sonidos y sílabas (groping: búsqueda articulatoria visible).
3. Prosodia inapropiada (ritmo, acento, entonación).
Característica adicional: rendimiento PEOR en imitación que en producción espontánea.
💡 Werni no diagnostica AHI. Si aparecen los 3 criterios, sugerir evaluación con fono especialista en motor speech. La terapia AHI es específica (principios motores de aprendizaje, alta intensidad).'),

('habla_fonologia', 'Procesos fonológicos patológicos: PSF con edades límite', 'Susanibar / PEFF',
'Procesos fonológicos de simplificación (PSF) y su edad límite de eliminación:
Frontalización (k→t, g→d): eliminar antes de los 3 años.
Posteriorización (t→k): antes de los 3 años.
Ceceo anterior (s→z): antes de los 3–4 años.
Lateralización rótica (r→l): antes de los 4 años.
Ausencia de vibrante /r̄/: antes de los 5 años.
Reducción de grupos consonánticos: antes de los 4–5 años.
Omisión de consonante final: antes de los 3–4 años.
Omisión de sílaba átona: antes de los 3 años.
⚠️ PSF presente más allá de la edad límite → confirmar con PEFF (Protocolo Evaluación Fonológico-Fonético) + audiometría para descartar causa sensorial.');
