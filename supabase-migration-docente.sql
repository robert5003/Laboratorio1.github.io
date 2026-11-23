-- =====================================================================
-- LabFlow Uni · Migración para aprobación de commits por docentes
-- Ejecutar en Supabase → SQL Editor → New query → Run
-- =====================================================================

alter table public.validaciones_sandbox
    add column if not exists aprobado boolean not null default false,
    add column if not exists aprobado_por text,
    add column if not exists aprobado_por_correo text,
    add column if not exists fecha_aprobacion timestamptz;

create index if not exists idx_validaciones_sandbox_lab_aprobado
    on public.validaciones_sandbox (laboratorio_id, aprobado);

-- ---------------------------------------------------------------------
-- Nota sobre RLS:
-- Este MVP usa autenticación propia basada en localStorage, no Supabase
-- Auth. Por eso no se incluyen políticas con auth.uid(): la base no puede
-- distinguir de forma segura entre un docente y un estudiante.
--
-- Si más adelante migras a Supabase Auth, agrega políticas como:
--
--   create policy "docentes_aprueban_commits"
--   on public.validaciones_sandbox
--   for update
--   using (
--       exists (
--           select 1 from public.perfiles
--           where perfiles.id = auth.uid()
--             and perfiles.rol = 'Docente'
--       )
--   );
--
-- Mientras sigas con la autenticación actual, mantén la base como demo
-- y no almacenes contraseñas ni datos reales.
-- ---------------------------------------------------------------------
