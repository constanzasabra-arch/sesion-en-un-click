-- ══════════════════════════════════════════════════════════════════
-- CONOCIMIENTO EXTRAÍDO DE PDFs DE CONSTANZA SABRA — FONO APRENDE
-- Fuentes: Bishop et al. (2016), ASHA (2024-2026), Susanibar-Dioses-Huamaní (2013)
-- ══════════════════════════════════════════════════════════════════

-- ── SEÑALES DE ALERTA POR EDAD (Bishop et al., 2016) ─────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'Señales de alerta por edad para familias', 'Bishop et al., 2016',
'1–2 años: sin vocalizaciones/balbuceo · poca respuesta al habla · poca interacción · no comprende palabras comunes · no usa palabras.
2–3 años: interacción mínima · sin intención comunicativa · sin oraciones de 2–3 elementos · reacción mínima al lenguaje · REGRESIÓN o estancamiento.
3–4 años: solo 2 palabras máximo · no entiende órdenes simples · familia no entiende gran parte de lo que dice.
4–5 años: solo 3 palabras máximo · escasa comprensión · ininteligible para desconocidos · familiares no entienden >50%.
Más de 5 años: dificultad para narrar con coherencia · no sigue instrucciones verbales · habla mucho pero sin reciprocidad · interpretaciones literales.
⚠️ SEÑALES GLOBALES que requieren derivación URGENTE: sin palabras a los 12m · sin combinación de 2 palabras a los 24m · habla ininteligible para extraños después de los 4 años · PSF persistentes después de los 6 años · REGRESIÓN o pérdida de habilidades adquiridas (cualquier edad → descartar TEA, epilepsia).'),

('hitos_desarrollo', 'TDL en contexto escolar: señales por área', 'Bishop et al. / ASHA',
'Fonético-fonológico: dificultades conciencia fonológica, grafema-fonema, decodificación lectora, lectura lenta.
Morfosintáctico: no comprende instrucciones complejas; omite palabras función; errores concordancia; dificultad con pronombres.
Léxico-semántico: vocabulario académico pobre; dificultad campos semánticos; palabras polisémicas y abstractas.
Pragmático: no mantiene conversación; comprensión literal; dificultad inferencial.
Narrativo: discurso poco fluido; baja LME; baja cohesión; omisión de información crucial.
Lectoescritura: mecánica lectora lenta; disortografía; composiciones gramaticalmente pobres.
Atención/memoria: déficit atencional sostenido; memoria de trabajo deficitaria; ritmo lento.
Relaciones sociales: aislamiento; juego solitario; vulnerabilidad al acoso; dificultad en normas implícitas.
💡 Sugiere derivación PIE + evaluación fonoaudiológica completa.');

-- ── MAPEO MOTIVO DE CONSULTA → ÁREA (específico para anamnesis) ──
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'Mapeo motivo de consulta real → área a evaluar', 'Fono Aprende / ASHA',
'Lo que dice la familia → Área que activa evaluación:
"no habla" / "dice pocas palabras" / "no combina" → Léxico-semántico + morfosintaxis + señal de alerta por edad.
"nadie le entiende" / "habla raro" / "le cuesta la R" → Fonético-fonológico → PSF → edad de adquisición.
"tartamudea" / "se traba" / "repite" → Disfluencias → evaluación tartamudez (ADL).
"se atraganta" / "no mastica" / "babea" → Alimentación y deglución → hitos por edad.
"no señala" / "no mira" / "juega solo" / "perdió palabras" → Señal de alerta TEA → derivación urgente.
"le cuesta leer" / "confunde letras" / "no escribe" → TDL escolar → conciencia fonológica → derivación PIE.
"no entiende instrucciones" / "se distrae" / "memoria" → Morfosintaxis comprensiva + atención + memoria de trabajo.
"habla pero no se comunica" / "repite lo que digo" → Pragmática → ecolalia → sospecha TEA.
"voz nasal" / "habla por la nariz" → Resonancia → sospecha fisura velopalatina o insuficiencia velofaríngea.
"nació prematuro" → Cronología prematuros → riesgo disfagia + desarrollo.
"tiene frenillo" → MOF + fonética → evaluación anquiloglosia + derivación si corresponde.'),

('hitos_desarrollo', 'Frases reales de padres y su significado clínico', 'Fono Aprende',
'Lenguaje expresivo: "no habla", "solo hace ruidos", "tiene 2 años y solo dice mamá y papá", "dice palabras sueltas pero no las junta", "tiene 3 años y no hace frases", "el pediatra dijo que estaba atrasado en el habla".
Inteligibilidad: "solo yo le entiendo", "los extraños no le entienden nada", "habla muy enredado", "mezcla letras", "tiene 5 años y no se entiende bien".
Comprensión: "no entiende lo que le digo", "no responde a su nombre", "parece que no oyera", "le hicieron audiometría y está bien pero igual no entiende".
Señales TEA: "no señala con el dedo", "juega solo", "repite lo que digo (ecolalia)", "habla en tercera persona", "perdió palabras que decía", "regresó en el desarrollo".
Deglución: "se atraganta seguido", "solo come papilla", "tiene 2 años y no ha progresado en texturas", "babea más de lo normal para su edad", "tose al tomar agua".
Escolar: "no aprende a leer", "confunde letras", "invierte letras (b/d, p/q)", "repitió de curso", "se distrae mucho en clases".
⚠️ Señales que requieren derivación URGENTE: "perdió palabras", "dejó de hablar", "regresó", "se pone morado comiendo", "tos crónica al comer".');

-- ── HITOS ALIMENTACIÓN Y DEGLUCIÓN (ASHA) ────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('mof_deglucion', 'Cronología prenatal y neonatal de la deglución', 'ASHA / Susanibar',
'Semana 11: inicia la deglución (esbozo).
Semana 15–17: inicia la succión.
Semana 34: SD coordinada (succión-deglución). Puede alimentarse sin apnea.
Semana 36: SDR coordinada (succión-deglución-respiración). Continúa perfeccionándose.
Semana 37–41: RN de término — SDR coordinada. Solo LM o fórmula.
Clasificación prematuros:
• <28 sg = Prematuro extremo (alto riesgo alimentario)
• 28–31 sg = Prematuro severo
• 32–33 sg = Prematuro moderado
• 34–36 sg = Prematuro tardío
• <37 sg = Pretérmino
⚠️ Prematuros <34 sg no tienen SDR coordinada → no pueden alimentarse por vía oral sin riesgo → evaluar siempre alimentación en prematuros.'),

('mof_deglucion', 'Hitos posnatales ASHA: alimentación por edad', 'ASHA (2024-2026)',
'0–3 meses: se engancha al pezón; chupa y traga; LM o fórmula (IDDSI 0).
4–6 meses: abre boca para cuchara; lengua mueve comida hacia posterior; IDDSI 0 + cereal mezclado (IDDSI 3).
6–9 meses: comienza a beber de taza; babea menos; purés suaves sin grumos (IDDSI 4).
⭐ 6–9 meses: PERÍODO CRÍTICO DE MASTICACIÓN — deben introducirse alimentos con grumos/sólidos ANTES de los 10 meses.
9–12 meses: masticación rotatoria (ambos lados); cierra labios al tragar; IDDSI 5–6.
12–18 meses: bebe con pajita; lengua mueve comida de lado a lado; consistencias mixtas (IDDSI 7).
18–24 meses: mastica con ambos lados de forma constante; deglución de sólidos consolidada; alimentos que requieren masticación.
2–3 años: come solo con tenedor y cuchara; mastica todos los alimentos incluidos los duros, sin arcadas ni atragantarse.
⭐ 24 meses: elevación lingual muy consistente. Sin pérdida de líquido. Labios cerrados. Patrón masticatorio maduro.
⭐ 36 meses: dentición temporal completa. Patrón bilateral alternado eficiente.'),

('mof_deglucion', 'Señales de alerta alimentación y deglución por edad', 'ASHA / Fono Aprende',
'⚠️ Sin incorporar sólidos/grumos antes de los 10 meses → riesgo de rechazo tardío de texturas.
⚠️ No mastica alimentos blandos a los 18 meses → evaluar deglución.
⚠️ Babeo excesivo más allá de los 24 meses → señal de alerta MOF.
⚠️ Atragantamientos frecuentes a cualquier edad → evaluar deglución.
⚠️ Tos crónica al comer o beber → sospecha aspiración → derivar URGENTE.
⚠️ Sin coordinación SDR en prematuros tardíos (>36 sg) → evaluar alimentación neonatal.
⚠️ Rechazo alimentario severo o selectividad extrema → evaluar alimentación + integración sensorial.
⚠️ No progresa en texturas con la edad → evaluar deglución + motricidad oral.
⚠️ Se pone morado comiendo, cianosis → emergencia, derivar.
⚠️ Vomita con frecuencia al comer → descartar reflujo + disfagia.
Período crítico: 6–9 meses es la ventana para introducir texturas. Si no se introduce antes de los 10 meses, aumenta significativamente el riesgo de rechazo y neofobia alimentaria.'),

('condiciones_especiales', 'Síndrome de Down: hitos alimentación específicos', 'Susanibar / ASHA',
'4–6 meses: reflejo de arcada se posterioriza → favorece inicio de alimentación complementaria.
6 meses: papillas y licuados → aumentar consistencia progresivamente hasta semisólido.
9 meses: picados extrafinos; favorecer finger food (desarrollo de pinza y autonomía).
12 meses: incorporar pan; picado fino.
24 meses: primera comida que requiere masticación; picado normal; deberían comer lo mismo que la familia.
30 meses: primeras frutas duras.
4 años: 30% logra movimientos de lateralización en masticación.
5 años: 70% logra movimientos de lateralización en masticación.
💡 En SD los hitos son MÁS TARDÍOS pero la secuencia es similar al desarrollo típico. No omitir texturas, solo ajustar el timing. Siempre evaluar hipoacusia conductiva (otitis serosa frecuente en SD).'),

('condiciones_especiales', 'Fisura velopalatina: cronología de intervenciones y rol fono', 'ASHA',
'3 meses: cirugía de fisuras de labios y alveolos.
6 meses: compromiso velar.
10 meses: compromiso velar + paladar duro.
Preescolar: retoque labio y nariz.
Fin del crecimiento: rinoplastia y ortognática.
Rol fonoaudiológico: evaluación de resonancia (hipernasalidad), evaluación de deglución post-cirugía, estimulación del lenguaje, trabajo articulatorio una vez cerrado el paladar.
⚠️ Si los padres describen "habla por la nariz" o "voz nasal" sin antecedente conocido de fisura → sospecha insuficiencia velofaríngea → derivar a ORL + cirugía maxilofacial antes de iniciar terapia fonoaudiológica.');

-- ── SEÑALES ALERTA TEA Y DISFLUENCIAS ────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('tea_autismo', 'Señales de alerta TEA: frases reales de familias', 'DSM-5 / Bishop / ASHA',
'Señales de comunicación social:
• "no señala con el dedo" (alerta si >12 meses)
• "no mira a los ojos" / "evita el contacto visual"
• "juega solo" / "no juega con otros niños"
• "habla pero no conversa" / "habla pero no se comunica"
• "repite lo que digo" (ecolalia) / "repite frases de la televisión"
• "habla en tercera persona" / "no entiende las bromas" / "toma todo literal"
Señales de regresión (MÁXIMA ALERTA):
• "perdió palabras que decía" / "antes decía cosas y dejó de decirlas"
• "regresó en el desarrollo" / "se estancó"
⚠️ La REGRESIÓN del lenguaje a cualquier edad es señal de alerta MÁXIMA → derivar URGENTE a neuropediatría + psicología + fonoaudiología. Descartar TEA y epilepsia.
💡 Werni no diagnostica TEA. Si aparecen 3 o más de estas señales, orientar a la familia hacia evaluación multidisciplinaria con M-CHAT (si <30 meses) o ADOS-2.'),

('hitos_desarrollo', 'Disfluencias: normal vs patológico y señales de alerta', 'ASHA',
'Lo que describe la familia: "tartamudea", "se traba hablando", "repite sílabas", "repite palabras", "se queda pegado en una palabra", "hace mucho esfuerzo para hablar".
Disfluencia NORMAL (evolutiva): ocurre entre 2–5 años. Repeticiones de palabras completas, frases, interjecciones. Sin tensión visible. Sin ansiedad.
Señales que orientan hacia disfluencia PATOLÓGICA:
• Repeticiones de partes de palabras (sí-sí-sílabas)
• Prolongaciones de sonidos
• Bloqueos con tensión visible (cara, cuello)
• Conciencia del problema + evitación
• Más de 12 meses de disfluencias
• Historia familiar de tartamudez
💡 Sugiere evaluación con ADL (Análisis de la Disfluencia del Lenguaje). No hacer que el niño "hable más lento" ni llamar la atención sobre el habla. Derivar a fono especialista en fluencia.');

-- ── VOZ Y RESONANCIA ──────────────────────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('habla_fonologia', 'Voz y resonancia: señales de alerta', 'ASHA / RASATI',
'Lo que describe la familia:
• "habla por la nariz" / "voz nasal" / "suena gangoso" → sospecha hipernasalidad → fisura velopalatina o insuficiencia velofaríngea → derivar ORL.
• "voz ronca" / "voz entrecortada" / "se le cansa la voz" → disfonía → evaluar uso vocal, higiene vocal, derivar ORL para nasofibroscopía si persiste.
• "habla muy bajito" / "voz débil" → evaluar tono muscular + voz.
• "habla muy fuerte siempre" → uso vocal incorrecto → higiene vocal.
Evaluación vocal: RASATI (escala perceptual). En niños, la disfonía es frecuente por uso vocal inadecuado (gritos, deportes). Antes de iniciar terapia vocal, descartar patología orgánica (nódulos, pólipos) con ORL.
⚠️ Hipernasalidad sin diagnóstico previo de fisura → derivar siempre antes de terapia fonoaudiológica.');

-- ── ANAMNESIS: ANTECEDENTES DE RIESGO ───────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'Antecedentes de riesgo en anamnesis fonoaudiológica', 'ASHA / Fono Aprende',
'Factores de riesgo neonatales que aumentan probabilidad de dificultades comunicativas:
• Prematurez (<37 sg) → riesgo deglución + desarrollo lenguaje más lento
• Hipoxia perinatal / asfixia neonatal → riesgo neurológico
• UCI neonatal prolongada → riesgo deglución + desarrollo global
• Meningitis → riesgo hipoacusia + lenguaje
• Bajo peso al nacer (<2500 g) → factor de riesgo general
• Gemelar → mayor prevalencia retraso del lenguaje
Factores médicos asociados:
• Otitis repetidas / adenoides grandes → riesgo hipoacusia conductiva → impacto en fonología y lenguaje
• Reflujo gastroesofágico → impacto en deglución y voz
• Hipotonía / retraso psicomotor → impacto en MOF, habla, deglución
• Anquiloglosia (frenillo corto) → evaluar grado + impacto funcional; no toda anquiloglosia requiere cirugía
💡 Ante cualquier antecedente de riesgo, la evaluación debe ser más comprehensiva. El antecedente solo orienta, no determina el diagnóstico.');
