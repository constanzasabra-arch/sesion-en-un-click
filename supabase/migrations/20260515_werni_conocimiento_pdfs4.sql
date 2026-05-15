-- ══════════════════════════════════════════════════════════════════
-- CONOCIMIENTO EXTRAÍDO DE PDFs — LOTE 4
-- Fuentes: MINSAL Chile GPC TEA, DSM-5, CDC / revisión de expertos
-- ══════════════════════════════════════════════════════════════════

-- ── GRUPOS DE RIESGO TEA ──────────────────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('tea_autismo', 'Grupos de riesgo para TEA: genético, prenatal y postnatal (Tabla 11 MINSAL)', 'MINSAL Chile / Zwaigenbaum et al. 2019',
'RIESGO GENÉTICO/FAMILIAR:
• Hermano/a, gemelo o hijo/a de persona autista
• Síndrome de Down, Síndrome X Frágil, Neurofibromatosis 1, Esclerosis Tuberosa, Encefalopatías Epilépticas precoces
RIESGO PRENATAL:
• Edad del padre >50 años o madre >40 años o madre adolescente <18 años
• Uso de Ácido Valproico en período prenatal
RIESGO POSTNATAL:
• Prematuridad menor a 32 semanas
⚡ Werni activa: Si en anamnesis aparece hermano con TEA, síndrome genético específico, prematuridad <32 semanas o padre/madre en rangos de riesgo → incluir exploración de señales TEA aunque no sea el motivo de consulta principal.'),

-- ── ANAMNESIS ORIENTADA A TEA ─────────────────────────────────────

('tea_autismo', 'Datos clave a recoger en anamnesis cuando se sospecha TEA', 'MINSAL Chile / GPC TEA',
'ANTECEDENTES FAMILIARES: dificultades similares en familia nuclear/extensa; alteraciones del neurodesarrollo; edad de los padres; hermanos/as.
DATOS PRE/PERINATALES: embarazo y parto; fármacos durante embarazo; peso, talla y CC al nacer; puntaje APGAR; screening perinatal de hipoacusia, trastornos hormonales/metabólicos.
HISTORIA EVOLUTIVA: hitos motriz, comunicativo y social; sueño, alimentación, control esfínteres; primeros comportamientos extraños observados por cuidadores; estrategias de adaptación familiar.
ANTECEDENTES MÉDICOS: enfermedades médicas/genéticas; dificultades auditivas, visuales o sensoriales; problemas neurológicos.
DATOS FAMILIARES Y PSICOSOCIALES: participación en entorno familiar/escolar/social; desafíos y apoyos; estructura y estilos de crianza.
CONSULTAS ANTERIORES: resultados de evaluaciones previas; intervenciones de recursos sociales, sanitarios o educativos.'),

-- ── SEÑALES TEA POR HITO DE EDAD (CDC / DSM-5) ───────────────────

('tea_autismo', 'Señales TEA por hito evolutivo: 9 meses a 5 años', 'CDC / DSM-5 / revisión expertos',
'9 meses: no responde al nombre; no muestra expresiones faciales (alegría, tristeza, enojo, sorpresa).
12 meses: no participa en juegos interactivos simples (palmaditas); usa pocos o ningún gesto; no dice adiós con la mano.
15 meses: no comparte intereses (no muestra objetos que le gustan).
18 meses: no apunta para mostrar algo interesante.
24 meses (2 años): no nota cuando otros están lastimados o molestos.
36 meses (3 años): no nota ni juega con otros niños.
48 meses (4 años): no juega a ser otra cosa (juego simbólico ausente, ej. ser maestro o superhéroe).
60 meses (5 años): no canta, baila ni actúa para otros.
⚠️ Cualquier pérdida de habilidades ya adquiridas a cualquier edad → señal MÁXIMA ALERTA → derivar urgente.'),

-- ── BANDERAS ROJAS POR PERÍODO ────────────────────────────────────

('tea_autismo', 'Banderas rojas TEA por período: 6 meses a 24 meses', 'GPC / revisión expertos',
'6–12 MESES:
• Atención y seguimiento visual atípico
• Preferencia por mirar hacia estímulos en lugar de caras
• Deterioro en retirar la mirada; miran lejos de caras de padres
• Menor sonrisa social
12–18 MESES:
• No responden al nombre
• Ausencia/disminución de expresión de afectos positivos
• Disminución de atención conjunta (no comparte objeto con el otro)
• Contacto visual anormal; poco seguimiento visual
• Imitación y gestos comunicativos disminuidos
• Irritabilidad intensa; respuesta sensorial exagerada
• Pobre regulación de emociones negativas
18–24 MESES:
• Retraso del lenguaje expresivo y hablado
• Ausencia o disminución del juego simbólico
• Intereses restrictivos evidentes
⚠️ Estas señales son ACUMULATIVAS: las de cada franja suman a las anteriores.'),

-- ── CHECKLIST CLÍNICO TEA (SEÑALES COMUNICATIVAS) ────────────────

('tea_autismo', 'Checklist clínico TEA: señales de comunicación e interacción social', 'MINSAL Chile / DSM-5',
'Señales de comunicación e interacción social (frecuentes vs nunca/rara vez):
• Se comunica con pocas palabras para su edad
• No responde al nombre cuando se le llama
• Repite palabras o frases de inmediato o con retraso (ecolalia)
• Responde con frases que no tienen relación con la pregunta
• Se refiere a sí mismo en tercera persona ("Benjamín quiere pan")
• Usa pocos gestos comunicativos (saludar, pedir, rechazar, despedirse)
• Toma la mano del adulto y la lleva al objeto deseado SIN mirar ni hablar
• Escaso o ningún contacto visual
• Se aísla; juega solo/a; aparenta independencia
• No sigue con la mirada un objeto para mostrarlo (atención conjunta ausente)
• Baja respuesta en interacción social (sonrisa social, reciprocidad)
• Juega clasificando/ordenando objetos repetitivamente, sin uso simbólico
• Movimientos repetitivos: aleteo de manos, balanceos, giros, saltos'),

('tea_autismo', 'Checklist clínico TEA: señales conductuales y sensoriales', 'MINSAL Chile / DSM-5',
'Señales conductuales (frecuentes vs nunca/rara vez):
• Se interesa más por objetos que por personas
• Explora solo partes de objetos (ruedas de juguetes)
• No atiende cuando se le llama (actúa como si no escuchara)
• Contacto visual inexistente, escaso o persistente de forma inusual
• En recreo permanece solo/a o necesita estructura del adulto para participar
• Dificultad para relacionarse con pares y ajustarse al contexto socioeducativo
• Entiende de forma muy literal; no entiende bromas, dobles sentidos, metáforas
• Vocabulario elevado pero intonación o tono de voz particular
• Movimientos repetitivos: balanceo, giros, movimiento de dedos/manos/saltos
• Dificultad para adaptarse a cambios (muebles, profesor, rutinas)
Señales sensoriales (Tabla 17 MINSAL):
• Desagrado por bañarse, corte de uñas, peinado, cepillado de dientes
• Intolerancia a calcetines, etiquetas, ropa de manga corta
• Incomodidad con texturas de alimentos; selectividad alimentaria extrema
• Babeo frecuente; desordenado durante comida'),

-- ── CRITERIOS DSM-5 RESUMIDOS ─────────────────────────────────────

('tea_autismo', 'Criterios DSM-5 para TEA: resumen clínico operativo', 'DSM-5 / APA',
'CRITERIO A — Deficiencias PERSISTENTES en comunicación e interacción social (las 3 áreas):
1. Reciprocidad emocional alterada (acercamiento social anormal; no inicia ni responde interacciones)
2. Conductas comunicativas no verbales alteradas (contacto visual, gestos, expresión facial)
3. Desarrollo/mantenimiento de relaciones alterado (no ajusta comportamiento según contexto social; no juego imaginativo con pares)
CRITERIO B — Patrones RESTRICTIVOS Y REPETITIVOS (≥2 de 4):
1. Movimientos, uso de objetos o habla estereotipados (ecolalia, alinear objetos)
2. Insistencia en monotonía; inflexibilidad ante cambios mínimos
3. Intereses muy restringidos e intensos
4. Hiper/hiporreactividad sensorial (dolor, sonidos, texturas, luces)
CRITERIO C: Síntomas presentes desde primeras fases del desarrollo.
CRITERIO D: Causan deterioro clínicamente significativo.
CRITERIO E: No se explican mejor por otra discapacidad.
⚠️ Werni NO diagnostica TEA. Si en anamnesis aparecen señales de criterio A + criterio B → sugerir derivación urgente a equipo multidisciplinario (neuropediatría + psicología + fonoaudiología).'),

-- ── PERFIL LINGÜÍSTICO EN TEA ─────────────────────────────────────

('tea_autismo', 'Perfil lingüístico en TEA: cómo suena el habla y lenguaje de un niño con TEA', 'DSM-5 / evidencia revisada',
'Características del habla y lenguaje frecuentes en TEA:
• No habla o tiene retraso significativo en habla → puede haber regresión
• Habla con tono o ritmo poco común: voz cantarina, robótica, monótona
• Repite palabras/frases sin saber cómo usarlas (ecolalia funcional e inmediata)
• No puede comenzar ni mantener conversación; habla solo para pedir o señalar
• No comprende preguntas simples ni instrucciones básicas
• No muestra emociones ni parece consciente de las emociones de otros
• Lenguaje muy literal; no entiende metáforas, ironía, dobles sentidos
• Puede tener vocabulario elevado pero comunicación social deficiente
• Inversión pronominal: "tú quieres agua" cuando quiere decir "yo quiero agua"
💡 En TEA el NIVEL FORMAL del lenguaje (fonología, morfosintaxis) puede estar intacto o incluso avanzado, pero la FUNCIÓN COMUNICATIVA y la PRAGMÁTICA están primariamente afectadas. Esto lo diferencia del TDL.');
