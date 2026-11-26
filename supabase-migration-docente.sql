-- =====================================================================
-- LabFlow Uni · Migración Completa del MVP (Semana 17 - UGB)
-- Incluye: Aprobación docente, Anulación por plagio, Visual Git,
--          Kanban Sprint (Prioridad + Story Points) y Equipos (3 y 5)
-- Ejecutar en Supabase → SQL Editor → New query → Run
-- =====================================================================

-- 1. Columnas de anulación por plagio en "laboratorios"
ALTER TABLE public.laboratorios
    ADD COLUMN IF NOT EXISTS anulado_por TEXT,
    ADD COLUMN IF NOT EXISTS anulado_por_correo TEXT,
    ADD COLUMN IF NOT EXISTS fecha_anulacion TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS motivo_anulacion TEXT;

-- 2. Columnas de aprobación docente y rama en "validaciones_sandbox"
ALTER TABLE public.validaciones_sandbox
    ADD COLUMN IF NOT EXISTS aprobado BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS aprobado_por TEXT,
    ADD COLUMN IF NOT EXISTS aprobado_por_correo TEXT,
    ADD COLUMN IF NOT EXISTS fecha_aprobacion TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS rama TEXT NOT NULL DEFAULT 'main';

CREATE INDEX IF NOT EXISTS idx_validaciones_sandbox_lab_aprobado
    ON public.validaciones_sandbox (laboratorio_id, aprobado);

-- 3. Columnas de prioridad y story points en "tareas_kanban"
ALTER TABLE public.tareas_kanban
    ADD COLUMN IF NOT EXISTS prioridad TEXT NOT NULL DEFAULT 'Media',
    ADD COLUMN IF NOT EXISTS story_points INTEGER NOT NULL DEFAULT 3;

-- 4. Tabla de miembros colaborativos por laboratorio (equipos de 3 y 5 cuentas)
CREATE TABLE IF NOT EXISTS public.miembros_laboratorio (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    laboratorio_id BIGINT NOT NULL REFERENCES public.laboratorios(id) ON DELETE CASCADE,
    correo_miembro TEXT NOT NULL,
    nombre_miembro TEXT NOT NULL,
    rol_equipo TEXT NOT NULL DEFAULT 'Colaborador',
    agregado_en TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (laboratorio_id, correo_miembro)
);

-- 5. Tabla de archivos por laboratorio (Explorador estilo VS Code)
CREATE TABLE IF NOT EXISTS public.archivos_laboratorio (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    laboratorio_id BIGINT NOT NULL REFERENCES public.laboratorios(id) ON DELETE CASCADE,
    ruta_archivo TEXT NOT NULL,
    contenido TEXT NOT NULL DEFAULT '',
    actualizado_por TEXT,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (laboratorio_id, ruta_archivo)
);

CREATE INDEX IF NOT EXISTS idx_archivos_lab_id
    ON public.archivos_laboratorio (laboratorio_id);

ALTER TABLE public.archivos_laboratorio DISABLE ROW LEVEL SECURITY;

CREATE INDEX IF NOT EXISTS idx_miembros_lab_correo
    ON public.miembros_laboratorio (correo_miembro);

ALTER TABLE public.miembros_laboratorio DISABLE ROW LEVEL SECURITY;

-- Nota sobre RLS:
-- Este MVP académico usa autenticación simplificada con localStorage y
-- tablas sin RLS habilitado únicamente para fines de demostración.