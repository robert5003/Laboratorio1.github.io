# Laboratorio1.github.io

## LabFlow Uni · Dashboard Docente Evaluador

Para habilitar la aprobación de commits por parte de los docentes:

1. Abre tu proyecto en Supabase → **SQL Editor**.
2. Ejecuta el archivo [`supabase-migration-docente.sql`](supabase-migration-docente.sql).
3. Inicia sesión con una cuenta cuyo rol sea `Docente`.
4. El dashboard mostrará:
   - Banner y badge de **Modo Docente Evaluador**.
   - Lista de **Proyectos de Estudiantes** con el nombre del dueño.
   - Código en modo solo lectura.
   - Historial de commits con estado **Aprobado / Pendiente**.
   - Botón **Aprobar commit** para los commits que pasaron el sandbox.

> El mensaje del commit es obligatorio para registrar una validación desde el dashboard del estudiante.

## Nota

Este proyecto es un prototipo académico. No procesa pagos reales ni debe usarse con contraseñas o datos personales reales mientras mantenga la autenticación basada en localStorage.
