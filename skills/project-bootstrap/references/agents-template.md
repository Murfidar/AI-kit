# AGENTS.md Template

Use this as the canonical project workflow file. Replace bracketed values before committing.

```md
# AGENTS.md

## Instruction Priority

Follow these instructions strictly for source, config, test, build, dependency, script, generated-code, migration, infrastructure, and CI changes.

Priority order:

1. Direct user instructions in the current prompt.
2. More specific nested `AGENTS.md` files.
3. This root `AGENTS.md`.
4. Existing project conventions.

If the user explicitly skips a workflow step, obey the user and mention the skipped step in the final response.

## Branch Workflow

Before editing code:

1. Check `git status --short --branch`.
2. If on `[protected branches]`, create a task branch.
3. If already on a task branch, continue there unless the user asks for a new branch.
4. Inspect uncommitted changes and avoid staging or overwriting unrelated user work.

Default branch naming:

```text
<type>/<short-kebab-description>
```

Allowed types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`, `build`, `perf`.

## Commit Workflow

After verification passes, commit automatically with the project format:

```text
[commit format]
```

If no project-specific format is required, use Conventional Commits.

Do not commit unrelated user changes.

## Pull Request Workflow

After committing:

1. Push the task branch.
2. Open a draft PR.
3. Use `.github/pull_request_template.md` when present.
4. Fill all relevant sections and remove placeholders.
5. Include verification commands and results.
6. Do not mark ready for review or merge unless the user explicitly asks.

## Verification

Run the relevant commands before committing:

```bash
[format command]
[lint command]
[typecheck command]
[test command]
[build command]
```

If verification fails, stop. Do not commit, push, or open a PR. Report the failing command, relevant error summary, and likely files involved.

## Documentation, Changelog, and Versioning

Update docs, changelog, and versioning only when the change affects public APIs, CLI usage, configuration, environment variables, user-facing behavior, setup, deployment, dependencies, security, permissions, billing, data handling, or project release rules.

## Coding Conventions

- Follow existing architecture and naming.
- Prefer local helpers and patterns over new abstractions.
- Keep changes scoped to the task.
- Add or update tests for behavior changes.
```
