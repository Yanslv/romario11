function Get-SkillVersion {
    param([string]$path)

    if (-not (Test-Path $path)) {
        return $null
    }

    $content = Get-Content $path -Raw
    if ($content -match '(?m)^version:\s*(.+)$') {
        return $matches[1].Trim()
    }

    return "0.0.0"
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$repoSkill = Join-Path $repoRoot "SKILL.md"
$projectSkill = Join-Path $repoRoot ".cursor\skills\romario11\SKILL.md"
$globalSkill = Join-Path $env:USERPROFILE ".cursor\skills\romario11\SKILL.md"

$repoVersion = Get-SkillVersion $repoSkill
$projectVersion = Get-SkillVersion $projectSkill
$globalVersion = Get-SkillVersion $globalSkill

Write-Host "romario11 - versoes instaladas"
Write-Host "  Repo (fonte):  v$repoVersion  -> $repoSkill"
Write-Host "  Projeto:       v$(if ($projectVersion) { $projectVersion } else { 'nao instalada' })"
Write-Host "  Global:        v$(if ($globalVersion) { $globalVersion } else { 'nao instalada' })"
Write-Host ""

$outdated = @()

if ($projectVersion -and $projectVersion -ne $repoVersion) {
    $outdated += "projeto (.cursor/skills/romario11)"
}

if ($globalVersion -and $globalVersion -ne $repoVersion) {
    $outdated += "global (~/.cursor/skills/romario11)"
}

if (-not $globalVersion) {
    Write-Host "AVISO: skill global nao encontrada. Rode: .\scripts\sync-skill.ps1" -ForegroundColor Yellow
}

if ($outdated.Count -gt 0) {
    Write-Host "DESATUALIZADA: $($outdated -join ', ')" -ForegroundColor Yellow
    Write-Host "Rode: .\scripts\sync-skill.ps1" -ForegroundColor Yellow
    exit 1
}

if ($repoVersion -eq $projectVersion -and $repoVersion -eq $globalVersion) {
    Write-Host "Tudo sincronizado na v$repoVersion." -ForegroundColor Green
    exit 0
}

Write-Host "Sincronizacao parcial. Rode: .\scripts\sync-skill.ps1" -ForegroundColor Yellow
exit 1
