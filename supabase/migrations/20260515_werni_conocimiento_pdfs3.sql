-- ══════════════════════════════════════════════════════════════════
-- CONOCIMIENTO EXTRAÍDO DE PDFs — LOTE 3
-- Fuentes: TDL (TL asociado a X, comorbilidades, edad diagnóstica), MINSAL TEA (Tabla 8)
-- ══════════════════════════════════════════════════════════════════

-- ── TDL vs TL ASOCIADO A X ────────────────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('hitos_desarrollo', 'TL asociado a X vs TDL: tabla de condiciones biomédicas', 'Bishop/Catalise / MINEDUC Chile',
'Cuando el trastorno del lenguaje COEXISTE con condición biomédica → NO es TDL, sino TL asociado a:
• TEA → TL asociado a Trastorno del Espectro Autista
• Discapacidad intelectual → TL asociado a Discapacidad Intelectual
• Hipoacusia neurosensorial → TL asociado a Hipoacusia Neurosensorial
• Parálisis cerebral → TL asociado a Parálisis Cerebral
• Síndrome de Down → TL asociado a Síndrome de Down
• Daño cerebral adquirido → TL asociado a Daño Cerebral Adquirido
• Síndrome genético → TL asociado a Síndrome X
⚡ Werni activa: Si en anamnesis aparece diagnóstico médico previo + dificultades de lenguaje → hipótesis = TL asociado a X, no TDL puro. Registrar condición biomédica siempre en anamnesis.'),

-- ── COMORBILIDADES TDL ────────────────────────────────────────────

('hitos_desarrollo', 'TDL: comorbilidades frecuentes y su perfil clínico', 'Bishop / evidencia revisada',
'TDL es trastorno del neurodesarrollo que coexiste frecuentemente con:
TDL + TSH (50–70%): errores fonológicos persistentes + lenguaje comprometido.
TDL + TDA-H (frecuente): déficit atencional + memoria de trabajo + procesamiento auditivo lento.
TDL + TEA (posible → TL asociado a TEA): pragmática muy afectada + lenguaje repetitivo/ecolálico.
TDL + Dislexia (muy frecuente): base fonológica compartida + riesgo lector desde preescolar.
TDL + DI (posible → TL asociado a DI): lenguaje afectado + cognición.
TDL + Discalculia (asociación observada): dificultad conceptos numéricos + vocabulario matemático.
⚡ Werni activa: "habla mal + le va mal en el colegio + se distrae mucho" → hipótesis TDL + TDA-H comórbido → evaluar ambos dominios + derivar neuropediatría si no tiene diagnóstico previo.'),

-- ── EDAD DIAGNÓSTICA TDL ──────────────────────────────────────────

('hitos_desarrollo', 'TDL: edad diagnóstica y qué decir según la edad del niño', 'Bishop/Catalise / DSM-5-TR / CIE-11',
'Guía clínica por edad:
< 2 años: Señal de alerta / riesgo. NO diagnosticar TDL aún. Acción: monitorear + estimular + citar en 3 meses.
2–3 años: "Hablante tardío" (Late Talker). Caracterización cualitativa. NO es diagnóstico DSM/CIE. NO es TDL confirmado. SÍ es indicación de intervención.
3–4 años: "Trastorno del lenguaje en estudio" o "Retraso del lenguaje en estudio". Evaluación + seguimiento cada 3 meses. Respuesta a intervención como dato diagnóstico.
≥ 4–5 años: TDL puede confirmarse si: persiste tras intervención + impacta funcionamiento escolar/social + múltiples dominios afectados.
5 años en adelante: Diagnóstico TDL más sólido. Confirmación con reevaluación.
💡 Werni no diagnostica. Usa estas franjas para orientar qué hipótesis plantear según la edad del paciente en la anamnesis.');

-- ── SEÑALES DE ALERTA TEA MINSAL ─────────────────────────────────
insert into werni_conocimiento (categoria, titulo, fuente, contenido) values

('tea_autismo', 'Señales de alerta temprana TEA 12–24 meses (Tabla MINSAL)', 'MINSAL Chile / Mesa expertos TEA, Metodología Delphi 2018',
'EDAD 12 MESES — señales de alerta TEA:
• Preocupación de los padres por déficit en habilidades sociales
• Falta de respuesta al nombre cuando es llamado
• Falta de contacto ocular
• Ausencia de vocalizaciones con fines comunicativos
• Aumento de comportamiento repetitivo y uso atípico de objetos durante exploración
• Pérdida de lenguaje o habilidades sociales

EDAD 18 MESES — suma señales anteriores más:
• No apunta con el dedo (señalar protodeclarativo ausente)
• Baja respuesta al refuerzo social
• No busca captar atención de otro sobre objeto de su interés (atención conjunta ausente)

EDAD 24 MESES — suma señales anteriores más:
• Ausencia de juego simbólico
• Falta de interés en otros niños y hermanos
• No repite gestos o acciones de otros (imitación ausente)

⚠️ Las señales de cada edad INCLUYEN las de edades anteriores. CUALQUIER pérdida de lenguaje o habilidades sociales a cualquier edad → derivación URGENTE. Fuente: MINSAL Chile, Mesa de expertos TEA, 2018.'),

('tea_autismo', 'Contextos de detección de TEA y cómo Werni activa sospecha', 'MINSAL Chile / GPC TEA',
'La sospecha de TEA puede surgir en 5 contextos:
A. Clínico identifica señales de alerta en control de salud rutinario.
B. Padres/cuidadores consultan por preocupaciones sobre desarrollo social o comunicativo.
C. Pesquisa en establecimientos educacionales (educadoras, profesores).
D. Niño presenta rezago social y/o lingüístico detectado en EEDP o TEPSI.
E. Niño dentro de grupos de riesgo específicos (hermano con TEA, prematuridad, síndrome genético).
⚡ Werni activa sospecha de TEA cuando en anamnesis aparecen: no señala, no mira, juega solo, perdió palabras, ecolalia, no responde al nombre, no imita. Con 3 o más señales → sugerir derivación urgente a equipo multidisciplinario + M-CHAT si <30 meses.');
