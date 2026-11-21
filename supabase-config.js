const SUPABASE_URL = 'https://jciwfaxpjbjcqcibktwk.supabase.co';
const SUPABASE_KEY = 'sb_publishable_oaCxKFcDiG84SWfZpfV3Kw_sxV1K2fx';

const db = window.supabase
    ? window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY)
    : null;

function detectarRolUGB(correo) {
    const email = (correo || '').trim().toLowerCase();
    const parteLocal = email.split('@')[0] || '';
    if (email.endsWith('@ugb.edu.sv')) {
        return /\d/.test(parteLocal) ? 'Estudiante' : 'Docente';
    }
    return 'Estudiante';
}

function guardarSesion(usuario) {
    localStorage.setItem('labflow_user', JSON.stringify(usuario));
}

function obtenerSesion() {
    try {
        const raw = localStorage.getItem('labflow_user');
        return raw ? JSON.parse(raw) : null;
    } catch {
        return null;
    }
}

function cerrarSesion() {
    localStorage.removeItem('labflow_user');
    window.location.href = 'auth.html';
}