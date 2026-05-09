// ════════════════════════════════════════════════════════════════
// SISTEMA DE CONFIRMACIÓN DE SESIONES
// ════════════════════════════════════════════════════════════════

// Configuración
const CONFIRMACION_CONFIG = {
  SUPABASE_URL: 'TU_SUPABASE_URL',
  SUPABASE_KEY: 'TU_SUPABASE_KEY',
  WHATSAPP_NUMERO: 'TU_NUMERO_WHATSAPP_BUSINESS' // +56912345678
};

// Inicializar Supabase (ya tienes esto)
const { createClient } = window.supabase;
const supabaseUrl = CONFIRMACION_CONFIG.SUPABASE_URL;
const supabaseKey = CONFIRMACION_CONFIG.SUPABASE_KEY;
const supabaseClient = createClient(supabaseUrl, supabaseKey);

// ════════════════════════════════════════════════════════════════
// 1. CREAR CITA CON LINK DE CONFIRMACIÓN
// ════════════════════════════════════════════════════════════════
async function crearCitaConConfirmacion(dataCita) {
  try {
    // Generar link único
    const linkConfirmacion = generarLinkUnico();
    
    // Guardar en Supabase
    const { data, error } = await supabaseClient
      .from('citas')
      .insert([
        {
          fonoaudiologa_id: dataCita.fonoaudiologa_id,
          paciente_id: dataCita.paciente_id,
          paciente_nombre: dataCita.paciente_nombre,
          fecha_hora: dataCita.fecha_hora,
          estado: 'pendiente',
          numero_whatsapp: dataCita.numero_whatsapp,
          link_confirmacion: linkConfirmacion,
          link_rechazo: generarLinkUnico(),
          fecha_creacion: new Date().toISOString(),
          color_calendario: dataCita.color_calendario || '#6BC5D2'
        }
      ]);

    if (error) throw error;

    console.log('✅ Cita creada:', data);
    return data[0];
  } catch (error) {
    console.error('❌ Error creando cita:', error);
    return null;
  }
}

// ════════════════════════════════════════════════════════════════
// 2. ENVIAR POR WHATSAPP CON BOTONES
// ════════════════════════════════════════════════════════════════
async function enviarConfirmacionWhatsApp(cita) {
  try {
    const mensaje = `
🔔 *Recordatorio de Sesión* 

Hola ${cita.paciente_nombre},

Tienes una sesión de fonoaudiología:
📅 *Fecha:* ${formatearFecha(cita.fecha_hora)}
🕐 *Hora:* ${formatearHora(cita.fecha_hora)}

¿Puedes confirmar tu asistencia?

✅ Confirmar: ${window.location.origin}/confirmar/${cita.link_confirmacion}
❌ Cancelar: ${window.location.origin}/cancelar/${cita.link_rechazo}

Saludos,
${localStorage.getItem('fonoaudiologa_nombre') || 'Tu Fonoaudióloga'}
    `;

    // Aquí se integra con Twilio o WhatsApp Business API
    // Por ahora, mostrar el mensaje a copiar
    mostrarMensajeWhatsApp(cita.numero_whatsapp, mensaje);
    
    return true;
  } catch (error) {
    console.error('❌ Error enviando WhatsApp:', error);
    return false;
  }
}

// ════════════════════════════════════════════════════════════════
// 3. PROCESAR CONFIRMACIÓN
// ════════════════════════════════════════════════════════════════
async function procesarConfirmacion(linkConfirmacion, estado) {
  try {
    // Buscar cita por link
    const { data: cita, error: errorBusqueda } = await supabaseClient
      .from('citas')
      .select('*')
      .eq('link_confirmacion', linkConfirmacion)
      .single();

    if (errorBusqueda) throw errorBusqueda;

    // Actualizar estado
    const { data: actualizado, error: errorActualizacion } = await supabaseClient
      .from('citas')
      .update({
        estado: estado, // 'confirmado' o 'cancelado'
        fecha_confirmacion: new Date().toISOString()
      })
      .eq('id', cita.id);

    if (errorActualizacion) throw errorActualizacion;

    // Actualizar en Google Calendar
    await actualizarGoogleCalendar(cita, estado);

    return { success: true, cita };
  } catch (error) {
    console.error('❌ Error procesando confirmación:', error);
    return { success: false, error };
  }
}

// ════════════════════════════════════════════════════════════════
// 4. ACTUALIZAR GOOGLE CALENDAR CON COLORES
// ════════════════════════════════════════════════════════════════
async function actualizarGoogleCalendar(cita, estado) {
  try {
    const colores = {
      confirmado: '#2ecc71', // Verde
      cancelado: '#e74c3c', // Rojo
      pendiente: '#f39c12'   // Naranja
    };

    // Obtener token de Google del localStorage
    const googleToken = localStorage.getItem('google_auth_token');
    
    const eventoActualizado = {
      summary: `${cita.paciente_nombre} - ${estado.toUpperCase()}`,
      description: `Sesión ${estado}. Link de confirmación: ${cita.link_confirmacion}`,
      start: { dateTime: cita.fecha_hora },
      end: { dateTime: new Date(new Date(cita.fecha_hora).getTime() + 60*60000).toISOString() },
      colorId: colores[estado] === '#2ecc71' ? '2' : colores[estado] === '#e74c3c' ? '11' : '5'
    };

    // Llamar a Google Calendar API
    const response = await fetch(`https://www.googleapis.com/calendar/v3/calendars/primary/events`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${googleToken}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(eventoActualizado)
    });

    if (!response.ok) throw new Error('Error actualizando Google Calendar');

    console.log('✅ Google Calendar actualizado');
    return true;
  } catch (error) {
    console.error('❌ Error con Google Calendar:', error);
    return false;
  }
}

// ════════════════════════════════════════════════════════════════
// FUNCIONES AUXILIARES
// ════════════════════════════════════════════════════════════════

function generarLinkUnico() {
  return 'link_' + Math.random().toString(36).substr(2, 9) + Date.now();
}

function formatearFecha(fecha) {
  const date = new Date(fecha);
  return date.toLocaleDateString('es-CL', { 
    weekday: 'long', 
    year: 'numeric', 
    month: 'long', 
    day: 'numeric' 
  });
}

function formatearHora(fecha) {
  const date = new Date(fecha);
  return date.toLocaleTimeString('es-CL', { 
    hour: '2-digit', 
    minute: '2-digit' 
  });
}

function mostrarMensajeWhatsApp(numero, mensaje) {
  // Generar link de WhatsApp
  const linkWhatsApp = `https://wa.me/${numero}?text=${encodeURIComponent(mensaje)}`;
  
  // Mostrar modal con opción de copiar
  mostrarModalConfirmacion(numero, linkWhatsApp, mensaje);
}

function mostrarModalConfirmacion(numero, linkWhatsApp, mensaje) {
  const modal = document.createElement('div');
  modal.className = 'modal-confirmacion';
  modal.innerHTML = `
    <div class="modal-confirmacion-contenido">
      <div class="modal-header">
        <h3>📱 Enviar por WhatsApp</h3>
        <button class="modal-close" onclick="this.closest('.modal-confirmacion').remove()">✕</button>
      </div>
      <div class="modal-body">
        <p class="modal-numero">Número: ${numero}</p>
        <div class="modal-mensaje">
          <p>Mensaje preview:</p>
          <pre>${mensaje}</pre>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-copiar" onclick="copiarMensaje(\`${mensaje}\`)">
          📋 Copiar Mensaje
        </button>
        <a href="${linkWhatsApp}" target="_blank" class="btn-whatsapp">
          💬 Abrir WhatsApp
        </a>
      </div>
    </div>
  `;
  
  document.body.appendChild(modal);
}

function copiarMensaje(texto) {
  navigator.clipboard.writeText(texto).then(() => {
    alert('✅ Mensaje copiado al portapapeles');
  });
}

// ════════════════════════════════════════════════════════════════
// CARGAR CITAS PENDIENTES
// ════════════════════════════════════════════════════════════════
async function cargarCitasPendientes() {
  try {
    const fonoaudiologa_id = localStorage.getItem('user_id');
    
    const { data: citas, error } = await supabaseClient
      .from('citas')
      .select('*')
      .eq('fonoaudiologa_id', fonoaudiologa_id)
      .eq('estado', 'pendiente')
      .order('fecha_hora', { ascending: true });

    if (error) throw error;

    renderizarCitasPendientes(citas);
    return citas;
  } catch (error) {
    console.error('❌ Error cargando citas:', error);
    return [];
  }
}

function renderizarCitasPendientes(citas) {
  const contenedor = document.getElementById('citas-pendientes-list');
  if (!contenedor) return;

  contenedor.innerHTML = citas.map(cita => `
    <div class="cita-card" style="border-left: 4px solid ${cita.color_calendario}">
      <div class="cita-header">
        <div class="cita-info">
          <h4>${cita.paciente_nombre}</h4>
          <p class="cita-fecha">📅 ${formatearFecha(cita.fecha_hora)}</p>
          <p class="cita-hora">🕐 ${formatearHora(cita.fecha_hora)}</p>
        </div>
        <span class="cita-estado ${cita.estado}">${cita.estado}</span>
      </div>
      <div class="cita-footer">
        <button class="btn-cita-whatsapp" onclick="enviarConfirmacionWhatsApp(${JSON.stringify(cita).replace(/"/g, '&quot;')})">
          💬 Enviar WhatsApp
        </button>
        <button class="btn-cita-confirmar" onclick="mostrarQR('${cita.link_confirmacion}')">
          📲 Generar QR
        </button>
      </div>
    </div>
  `).join('');
}

function mostrarQR(link) {
  // Implementar generador de QR (librería: qrcode.js)
  alert('QR para: ' + link);
}

// Exportar para usar en HTML
window.confirmacionSesiones = {
  crearCitaConConfirmacion,
  enviarConfirmacionWhatsApp,
  procesarConfirmacion,
  cargarCitasPendientes
};
