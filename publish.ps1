Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Set-Location $PSScriptRoot

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error 'GitHub CLI (gh) nao encontrado. Instale: https://cli.github.com/'
}

gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host 'Faca login no GitHub como Yanslv:'
    gh auth login
}

if (git remote get-url origin 2>$null) {
    git remote set-url origin https://github.com/Yanslv/romario11.git
} else {
    git remote add origin https://github.com/Yanslv/romario11.git
}

git push -u origin main

Write-Host ''
Write-Host 'Publicado: https://github.com/Yanslv/romario11'
Write-Host ''
Write-Host 'Instalar:'
Write-Host '  curl -sL skill.sh | sh -s -- Yanslv/romario11 -g -a cursor -y'
Write-Host '  npx skills add Yanslv/romario11 -g -a cursor -y'
