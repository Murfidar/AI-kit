param(
  [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
  [string]$CodexSkillsRoot = $(if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME 'skills' } else { Join-Path $HOME '.codex/skills' }),
  [switch]$Force
)

$ErrorActionPreference = 'Stop'

$skills = @('project-guard', 'project-bootstrap')
$sourceRoot = Join-Path $RepoRoot 'skills'

if (-not (Test-Path -LiteralPath $sourceRoot)) {
  throw "Missing source skills directory: $sourceRoot"
}

New-Item -ItemType Directory -Path $CodexSkillsRoot -Force | Out-Null

foreach ($skill in $skills) {
  $source = Join-Path $sourceRoot $skill
  $target = Join-Path $CodexSkillsRoot $skill

  if (-not (Test-Path -LiteralPath $source)) {
    throw "Missing skill source: $source"
  }

  if (Test-Path -LiteralPath $target) {
    $item = Get-Item -LiteralPath $target -Force
    if (-not $Force) {
      throw "Target already exists: $target. Re-run with -Force to replace an existing symlink."
    }

    if (-not ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
      throw "Refusing to remove non-symlink target: $target"
    }

    Remove-Item -LiteralPath $target -Force
  }

  try {
    New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
    Write-Host "Linked $target -> $source"
  }
  catch {
    Write-Host "Failed to create symlink for $skill."
    Write-Host "Enable Windows Developer Mode or run PowerShell as Administrator, then retry."
    throw
  }
}

Write-Host "Installed skills into $CodexSkillsRoot"
