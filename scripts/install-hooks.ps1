$repoRoot = Split-Path -Parent $PSScriptRoot
$hooksSource = Join-Path $repoRoot ".githooks"
$hooksTarget = Join-Path $repoRoot ".git\hooks"

if (-not (Test-Path $hooksSource)) {
    Write-Error ".githooks nao encontrado"
    exit 1
}

Get-ChildItem $hooksSource -File | ForEach-Object {
    $dest = Join-Path $hooksTarget $_.Name
    Copy-Item $_.FullName $dest -Force
    Write-Host "Hook instalado: $dest"
}

Write-Host ""
Write-Host "Hooks ativos. Apos commit ou merge, a skill sincroniza automaticamente."
