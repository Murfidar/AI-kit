param(
  [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
$failures = New-Object System.Collections.Generic.List[string]

function Assert-Exists {
  param([string]$Path, [string]$Message)
  if (-not (Test-Path -LiteralPath $Path)) {
    $failures.Add($Message)
  }
}

function Assert-Contains {
  param([string]$Path, [string]$Pattern, [string]$Message)
  if (-not (Test-Path -LiteralPath $Path)) {
    $failures.Add("Missing file for content check: $Path")
    return
  }

  $content = Get-Content -LiteralPath $Path -Raw
  if ($content -notmatch $Pattern) {
    $failures.Add($Message)
  }
}

function Assert-Skill {
  param(
    [string]$Name,
    [string[]]$RequiredPatterns
  )

  $skillDir = Join-Path $Root "skills/$Name"
  $skillPath = Join-Path $skillDir 'SKILL.md'
  $agentPath = Join-Path $skillDir 'agents/openai.yaml'

  Assert-Exists $skillPath "Missing $Name SKILL.md"
  Assert-Exists $agentPath "Missing $Name agents/openai.yaml"

  if (Test-Path -LiteralPath $skillPath) {
    $content = Get-Content -LiteralPath $skillPath -Raw
    $escapedName = [regex]::Escape($Name)
    if ($content -notmatch "(?s)^---\s*\r?\nname:\s*$escapedName\s*\r?\ndescription:\s*Use when .+?\r?\n---") {
      $failures.Add("$Name frontmatter must contain name and a description that starts with 'Use when'")
    }
    foreach ($pattern in $RequiredPatterns) {
      if ($content -notmatch $pattern) {
        $failures.Add("$Name is missing required guidance matching: $pattern")
      }
    }
  }

  if (Test-Path -LiteralPath $agentPath) {
    $agentContent = Get-Content -LiteralPath $agentPath -Raw
    if ($agentContent -notmatch "\`$$Name") {
      $failures.Add("$Name openai.yaml default_prompt must mention `$$Name")
    }
  }
}

Assert-Skill 'project-guard' @(
  'source, config, test',
  'documentation-only',
  'AGENTS\.md',
  'CLAUDE\.md',
  'current branch',
  'working tree',
  'draft PR',
  'Do not commit',
  'verification fails'
)

Assert-Skill 'project-bootstrap' @(
  'approval',
  'AGENTS\.md',
  'CLAUDE\.md',
  'pull request template',
  'linting',
  'formatting',
  'commit',
  'hooks',
  'versioning',
  'architecture'
)

@(
  'references/agents-template.md',
  'references/claude-template.md',
  'references/typescript-backend.md'
) | ForEach-Object {
  Assert-Exists (Join-Path $Root "skills/project-bootstrap/$_") "Missing project-bootstrap $_"
}

@(
  'AGENTS.md',
  'CLAUDE.md',
  '.github/pull_request_template.md',
  'templates/AGENTS.md',
  'templates/CLAUDE.md',
  'templates/pull_request_template.md',
  'scripts/install-skills.ps1'
) | ForEach-Object {
  Assert-Exists (Join-Path $Root $_) "Missing $_"
}

if ($failures.Count -gt 0) {
  Write-Host 'Skill validation failed:'
  foreach ($failure in $failures) {
    Write-Host " - $failure"
  }
  exit 1
}

Write-Host 'Skill validation passed.'
