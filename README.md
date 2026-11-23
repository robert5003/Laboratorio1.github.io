# LabFlow Uni — MVP SaaS Colaborativo (UGB)

> **«Tu código fluye, tu equipo avanza.»**

Plataforma SaaS educativa en la nube diseñada para estudiantes y docentes de Ingeniería en Sistemas y Redes Informáticas de la **Universidad Gerardo Barrios (UGB)**. Permite colaborar en proyectos de laboratorio con control de versiones visual, validación automática Pre-Merge, planificación de sprints (Kanban) y trazabilidad certificada de aportes.

## Arquitectura del Proyecto
* `index.html` — Landing page oficial del embudo de ventas (8 secciones AIDA).
* `auth.html` — Registro e inicio de sesión institucional (`@ugb.edu.sv`) con detección automática de rol (Estudiante / Docente).
* `checkout.html` — Pasarela de pago simulada (5 marcas de tarjeta, cupones `UGB10` / `LABFLOW`) con activación real del plan en Supabase.
* `dashboard.html` — Panel operativo dual:
  * **Modo Estudiante:** Límites reales por plan (`Freemium`, `Estudiante Pro`, `Pack Grupo 5`), equipos compartidos (3 y 5 cuentas), Motor Visual Git, Validador Pre-Merge, Asistente «Mentor Colega», Kanban Sprint (prioridades + Story Points), 3 Bonus, Certificado/Reporte PDF y Soporte Prioritario.
  * **Modo Docente Evaluador:** Acceso gratuito de solo lectura, aprobación de commits, reporte de trazabilidad por integrante y anulación/reactivación de proyectos por plagio.
* `supabase-config.js` — Configuración del cliente Supabase (PostgreSQL).
* `supabase-migration-docente.sql` — Script SQL consolidado de migración del esquema.

## Tecnologías
* **Frontend:** HTML5, Tailwind CSS, JavaScript (ES6+), Font Awesome.
* **Backend / Persistencia:** Supabase (PostgreSQL + Data API REST).
* **Despliegue:** GitHub Pages / Vercel.

## Equipo Emprendedor (UGB — Emprendimiento)
* Kilmar Vladimir Bonilla Alfallo
* Andromeda Dayanara Morales Pereira
* Roberto Carlos Orellana Sorto
* Carlos Arístides Larín Cañas
* Josué Roberto Villegas Durán
* **Docente:** Ing. David Eduardo Márquez Chávez

## Nota Académica
Este proyecto es un Producto Mínimo Viable (MVP) de carácter académico. Los pagos son simulados en modo de prueba y no debe utilizarse con contraseñas ni datos bancarios reales.