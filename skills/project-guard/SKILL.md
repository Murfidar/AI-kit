---
name: project-guard
description: Use when changing source, config, test, build, dependency, script, generated-code, or CI files in a codebase. Do not use for documentation-only edits unless they accompany those changes.
---

# Project Guard

## Overview

Enforce the project's operational workflow before, during, and after source/config/test edits. Direct user instructions in the current prompt override this skill, but otherwise follow the project rules strictly.

## Trigger Decision

Use this skill for edits to source, config, test, build, dependency, script, generated-code, migration, infrastructure, or CI files.

Do not use this skill for documentation-only edits such as README, docs, changelog, or prose-only files unless they accompany source/config/test work.

## Instruction Priority

1. Direct user instructions in the current prompt.
2. More specific nested `AGENTS.md` files.
3. Root `AGENTS.md`.
4. `CLAUDE.md` when it adds non-duplicated project instructions.
5. Existing project conventions inferred from code, tests, commits, and PRs.

If the user explicitly skips a workflow step, obey the user and mention the skipped step in the final response.

## Required Workflow

1. Confirm the current directory is inside a git repository. If not, explain that branch, commit, push, and PR workflow cannot apply.
2. Read the nearest applicable `AGENTS.md`; check parent directories for broader rules when needed.
3. If `CLAUDE.md` exists, check whether it imports `AGENTS.md` or adds Claude-specific workflow rules.
4. Check `git status --short --branch` before editing. Note the current branch and working tree state.
5. If on a protected branch such as `main`, `master`, `develop`, `dev`, `trunk`, or a release branch, create a task branch before editing.
6. If already on a task branch, continue there unless the user asks for a new branch.
7. If the working tree has uncommitted changes, inspect them and avoid staging, overwriting, or reverting unrelated user work.
8. Make the requested changes following project coding conventions, formatting, architecture, and local helper patterns.
9. Update docs, changelog, or versioning only when the change affects public behavior, API contracts, CLI usage, config, dependencies, security, operations, or user-facing behavior.
10. Run the project's required verification commands for the touched surface: formatting, linting, typechecking, tests, builds, or custom checks.
11. If verification fails, stop. Do not commit. Do not push. Do not open a PR. Report the failing command, relevant error summary, and likely files involved.
12. If verification passes, review the diff and commit only task-related files with the documented commit message format.
13. Push the task branch.
14. Open a draft PR using the project pull request template. Include summary, verification commands/results, related issues when known, and limitations. Do not mark ready for review or merge unless the user explicitly asks.

## Defaults When Project Rules Are Missing

Use these defaults only when `AGENTS.md`, `CLAUDE.md`, or local conventions do not define a rule.

| Area | Default |
| --- | --- |
| Branch name | `<type>/<short-kebab-description>` |
| Branch types | `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`, `build`, `perf` |
| Commit style | Conventional Commits: `<type>(optional-scope): <summary>` |
| PR state | Draft PR |
| PR body | Summary, Verification, Notes |
| Failed verification | Stop and report; no commit, push, or PR |

## Red Flags

Stop and reassess when any of these happen:

- Editing before reading project workflow files.
- Making source/config/test changes on a protected branch.
- Staging unrelated user changes.
- Committing after failing verification.
- Opening a PR without checking for a pull request template.
- Updating docs/changelog/version for internal-only changes without a project rule requiring it.
