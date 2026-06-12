# AGENTS.md

## Instruction Priority

Follow these instructions strictly for source, config, test, script, skill, template, CI, and generated-code changes.

Priority order:

1. Direct user instructions in the current prompt.
2. More specific nested `AGENTS.md` files.
3. This root `AGENTS.md`.
4. Existing project conventions.

If the user explicitly skips a workflow step, obey the user and mention the skipped step in the final response.

## Branch Workflow

Before editing code or skill files:

1. Check `git status --short --branch`.
2. If on `main`, create a task branch unless this is the initial repository commit.
3. If already on a task branch, continue there unless the user asks for a new branch.
4. Inspect uncommitted changes and avoid staging or overwriting unrelated user work.

Default branch naming:

```text
<type>/<short-kebab-description>
```

Allowed types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`, `build`, `perf`.

## Commit Workflow

After verification passes, commit automatically using Conventional Commits.

Do not commit unrelated user changes.

## Pull Request Workflow

After committing on a task branch:

1. Push the task branch.
2. Open a draft PR.
3. Use `.github/pull_request_template.md`.
4. Include verification commands and results.
5. Do not mark ready for review or merge unless the user explicitly asks.

For the first commit to an empty remote, push `main` directly so future PRs have a base branch.

## Verification

Run these commands before committing:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-skills.ps1
python C:\Users\DELL\.codex\skills\.system\skill-creator\scripts\quick_validate.py .\skills\project-bootstrap
$tokens=$null; $errors=$null; [System.Management.Automation.Language.Parser]::ParseFile((Resolve-Path '.\scripts\install-skills.ps1'), [ref]$tokens, [ref]$errors) | Out-Null; if ($errors.Count -gt 0) { $errors | Format-List *; exit 1 }
```

The installer creates Windows symlinks and may require Developer Mode or an elevated shell. If symlink creation fails only because of permissions, report it separately from repository validation.

## Documentation, Changelog, and Versioning

Update docs, templates, or references when skill behavior, install behavior, validation rules, or public workflow guidance changes.

No changelog or version file is required until the repo adopts a release process.

## Coding Conventions

- Keep skill files concise and operational.
- Put reusable details in references, not in overloaded skill bodies.
- Keep `AGENTS.md` canonical and `CLAUDE.md` small.
- Prefer PowerShell scripts for Windows-first local setup.
- Validate every skill before committing.
