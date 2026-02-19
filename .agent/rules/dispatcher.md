---
trigger: on_command(agent)
---

## Skill: Dispatcher

Este skill enruta las tareas al agente apropiado basándose en palabras clave en la solicitud del usuario.

### Reglas de Enrutamiento:

- Si la tarea contiene "idea", "concepto", o "brainstorming", usa el skill `brainstorming-pro`.
- Si la tarea contiene "plan", "hoja de ruta", o "roadmap", usa el skill `planificacion-pro`.
- Si la tarea contiene "documento a app" o "convertir doc", usa el skill `doc-to-app`.
- Si la tarea contiene "revisa", "calidad", o "pulir", usa el skill `modo-produccion`.
- De lo contrario, usa el agente por defecto.

### Instrucciones:

1. Recibe la tarea del usuario.
2. Compara la tarea con las reglas de enrutamiento.
3. Si una regla coincide, obtén el contenido del archivo `SKILL.md` correspondiente del directorio `skills`.
4. Construye el prompt final combinando el contenido del skill con la tarea original del usuario y el contexto del proyecto.
5. Ejecuta la tarea como el agente seleccionado.
