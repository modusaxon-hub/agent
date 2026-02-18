# SCRIPT DE SINCRONIZACIÓN GLOBAL - ADSO
# Ejecuta este script para preparar un entorno nuevo según las reglas maestras.

# 1. Configurar Identidad Global
Write-Host "Configurando Git Global..." -ForegroundColor Cyan
git config --global user.name "modusaxon-hub"
git config --global user.email "modusaxon@gmail.com"
git config --global credential.helper manager

# 2. Configurar Directorios Seguros
Write-Host "Configurando Directorios Seguros..." -ForegroundColor Cyan
git config --global --add safe.directory "D:/Documentos/Proyectos ADSO/*"

# 3. Crear Enlaces Simbólicos para XAMPP
Write-Host "Configurando Enlaces Simbólicos para XAMPP..." -ForegroundColor Cyan
$projects = @("modus_axon", "manuel_pertuz", "despensa_inteligente")
foreach ($proj in $projects) {
    $linkPath = "C:\xampp\htdocs\$proj"
    $targetPath = "D:\Documentos\Proyectos ADSO\$proj"
    if (!(Test-Path $linkPath)) {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath -Force
        Write-Host "Enlace creado para $proj" -ForegroundColor Green
    } else {
        Write-Host "El enlace para $proj ya existe." -ForegroundColor Gray
    }
}

# 4. Verificar MySQL (Opcional)
Write-Host "Verificando acceso a MySQL..." -ForegroundColor Cyan
if (Get-Command mysql -ErrorAction SilentlyContinue) {
    mysql --version
} else {
    Write-Host "CUIDADO: MySQL no está en el PATH. Recuerda agregar C:\xampp\mysql\bin" -ForegroundColor Yellow
}

Write-Host "¡Entorno configurado con éxito!" -ForegroundColor Green
