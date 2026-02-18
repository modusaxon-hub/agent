# REGLAS MAESTRAS DE CONFIGURACIÓN - ANTIGRAVITY

Este documento contiene las reglas globales de configuración técnica para todos los proyectos en el entorno de desarrollo del usuario. El asistente DEBE leer y aplicar estas reglas al iniciar cualquier interacción o proyecto nuevo.

## 1. Identidad de Git y GitHub
Siempre utilizar la siguiente configuración de identidad por defecto (preferiblemente de forma local por proyecto para evitar conflictos, o global si el usuario lo solicita):
- **User Name:** modusaxon-hub
- **User Email:** modusaxon@gmail.com
- **Auth Method:** Git Credential Manager (configurar `git config --global credential.helper manager`).
- **Commits:** Realizar commits locales libres de autenticación siempre que sea posible.

## 2. Integración con XAMPP (Sin Duplicidad de Carpetas)
Para evitar tener que copiar archivos a `C:\xampp\htdocs\`, se deben utilizar **Enlaces Simbólicos**:
- **Regla:** Los archivos reales SIEMPRE viven en `D:\Documentos\Proyectos ADSO\`.
- **Estrategia:** Crear un enlace en `C:\xampp\htdocs\nombre-proyecto` que apunte a la carpeta en `D:`.
- **Comando:** `New-Item -ItemType SymbolicLink -Path "C:\xampp\htdocs\nombre-proyecto" -Target "D:\Documentos\Proyectos ADSO\nombre-proyecto"`.
- **Beneficio:** Un solo lugar para editar código, un solo lugar para Git, y acceso inmediato vía `localhost/nombre-proyecto`.

## 3. Carpeta de Agentes Única (Centralizada)
- **Regla:** NO copiar la carpeta `agent` dentro de cada proyecto.
- **Configuración:** Mantener una única carpeta `D:\Documentos\Proyectos ADSO\agent\` abierta siempre en el Workspace de VS Code.
- **Interacción:** El asistente debe ser capaz de saltar entre proyectos referenciando la carpeta central de agentes para leer skills y configuraciones, pero aplicando los cambios en el proyecto activo del usuario.

## 4. Túneles con zrok (Enlaces Permanentes)
Para compartir proyectos o probar en móviles, se usará zrok (`C:\zrok_1.1.10\zrok.exe`):
- **Estrategia:** Preferir túneles reservados (permanentes) para evitar cambios de URL.
- **Comando de Reserva:** `zrok reserve public localhost:80/nombre-proyecto --backend-mode web` (para XAMPP).
- **Comando de Activación:** `zrok share <token_de_reserva>`.
- **Vite:** Si se usa Vite, configurar el túnel al puerto de Vite (ej. 5173) y asegurar que el `preview` o `dev` permita acceso externo (`--host`).

## 5. Gestión de Seguridad y Directorios
- **Safe Directory:** Marcar automáticamente los directorios de trabajo como seguros para evitar el error de "dubious ownership".
- **Comando Global:** `git config --global --add safe.directory "D:/Documentos/Proyectos ADSO/*"`

## 3. Stack Tecnológico Preferente
- **Base de Datos:** MySQL (MariaDB vía XAMPP).
- **Entorno Local:** Host: `127.0.0.1`, Port: `3306`, User: `root`, Pass: `""`.
- **Estrategia:** Diseño y pruebas en MySQL local. Migración a servicios tipo Supabase (Cloud) solo en etapas de producción o escalamiento.

## 4. Estándares de Proyecto
- **Estructura Técnica OBLIGATORIA**: Todo proyecto DEBE tener una carpeta `technical/` en la raíz.
- **Archivos Base**: Garantizar la existencia de:
    - `technical/Repositorio.md`: Datos de Git (URL, estado, instrucciones).
    - `technical/ERROR_LOG.html`: Bitácora de errores.
    - `technical/DOC_TECNICO.html`: Manual técnico.
    - `technical/MANUAL_USUARIO.html`: Guía de usuario.
- **SQL:** Mantener siempre un archivo de respaldo del esquema en cada proyecto (ej. `database/schema.sql`).

## 5. Idioma y Estilo
- **Idioma del Asistente:** Español (preferencia absoluta).
- **Estilo de Código:** Modular, limpio y documentado.

## 6. Entregable Obligatorio: TASK.md
Después de **cada instrucción completada** (sin excepción), el asistente DEBE entregar o actualizar el archivo `TASK.md` del proyecto activo con el siguiente formato:

```markdown
# 📋 TASK: [Nombre del Objetivo Principal]

| Acción / Requerimiento | Estado | Nota del Usuario |
| :--- | :---: | :--- |
| **[Descripción de la tarea]** | ⏳ / ✅ / ❌ | [Observaciones relevantes] |
```

### Reglas del TASK.md:
- **Siempre visible**: El TASK.md se presenta al usuario al final de cada interacción.
- **Acumulativo**: No se borra el progreso anterior, se AÑADEN las nuevas tareas.
- **Estados permitidos**: `⏳ Pendiente`, `✅ Hecho`, `❌ Bloqueado`.
- **Columna "Nota"**: Para observaciones del usuario o del asistente sobre decisiones técnicas.
- **Ubicación**: Raíz del proyecto activo (ej: `D:\Documentos\Proyectos ADSO\despensa_inteligente\TASK.md`).

---
*Cualquier desviación de estas reglas debe ser consultada previamente con el usuario.*
