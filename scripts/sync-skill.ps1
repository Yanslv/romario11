$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot "SKILL.md"

if (-not (Test-Path $source)) {
    Write-Error "SKILL.md nao encontrado em $repoRoot"
    exit 1
}

$targets = @(
    (Join-Path $repoRoot ".cursor\skills\romario11\SKILL.md"),
    (Join-Path $env:USERPROFILE ".cursor\skills\romario11\SKILL.md")
)

foreach ($target in $targets) {
    $dir = Split-Path -Parent $target
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    Copy-Item -Path $source -Destination $target -Force
    Write-Host "Sincronizado: $target"
}
