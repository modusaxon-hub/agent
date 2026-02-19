[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Tarea,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$RutaProyecto
)

# --- Lógica de Enrutamiento (El Cerebro) ---
# Aquí es donde decides qué agente llamar según la tarea.

$AgenteSeleccionado = "gemini" # Agente por defecto
$InstruccionParaAgente = $Tarea # La tarea original como instrucción base

# Leemos el contenido de los skills para pasárselo al agente
$SkillPathBase = "d:\Documentos\Proyectos ADSO\agent\skills"

if ($Tarea -like "*idea*" -or $Tarea -like "*concepto*" -or $Tarea -like "*brainstorming*") {
    Write-Host "Tarea reconocida: Brainstorming. Asignando a 'brainstorming-pro'." -ForegroundColor Green
    $InstruccionParaAgente = (Get-Content "$SkillPathBase\brainstorming-pro\SKILL.md") + "`n`nTAREA DEL USUARIO: `"$Tarea`" EN EL PROYECTO: `"$RutaProyecto`""

} elseif ($Tarea -like "*plan*" -or $Tarea -like "*hoja de ruta*" -or $Tarea -like "*roadmap*") {
    Write-Host "Tarea reconocida: Planificación. Asignando a 'planificacion-pro'." -ForegroundColor Green
    $InstruccionParaAgente = (Get-Content "$SkillPathBase\planificacion-pro\SKILL.md") + "`n`nTAREA DEL USUARIO: `"$Tarea`" EN EL PROYECTO: `"$RutaProyecto`""

} elseif ($Tarea -like "*documento a app*" -or $Tarea -like "*convertir doc*") {
    Write-Host "Tarea reconocida: Doc to App. Asignando a 'doc-to-app'." -ForegroundColor Green
    $InstruccionParaAgente = (Get-Content "$SkillPathBase\doc-to-app\SKILL.md") + "`n`nTAREA DEL USUARIO: `"$Tarea`" EN EL PROYECTO: `"$RutaProyecto`""

} elseif ($Tarea -like "*revisa*" -or $Tarea -like "*calidad*" -or $Tarea -like "*pulir*") {
    Write-Host "Tarea reconocida: QA. Asignando a 'modo-produccion'." -ForegroundColor Green
    $InstruccionParaAgente = (Get-Content "$SkillPathBase\modo-produccion\SKILL.md") + "`n`nTAREA DEL USUARIO: `"$Tarea`" EN EL PROYECTO: `"$RutaProyecto`""

} else {
    Write-Host "No se reconoció una tarea específica. Usando agente general." -ForegroundColor Yellow
}


# --- Salida Final ---
# El script copia la instrucción completa al portapapeles para que tú solo la pegues.

Write-Host "`nInstrucción completa para el agente ha sido copiada a tu portapapeles." -ForegroundColor Cyan
Write-Host "Pégala en el chat de Gemini para ejecutar la tarea."
$InstruccionParaAgente | Set-Clipboard

# Opcional: Imprime la instrucción para que la veas
# Write-Output $InstruccionParaAgente
