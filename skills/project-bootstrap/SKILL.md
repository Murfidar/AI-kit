---
name: project-bootstrap
description: Use when starting a project or standardizing an existing project's AI/developer workflow, tooling, conventions, branch/commit/PR rules, verification, architecture, or setup.
---

# Project Bootstrap

## Overview

Design and install a project-specific workflow so Codex and Claude can follow the same operational rules. This skill may modify project setup only after presenting a proposed workflow and receiving user approval.

## Bootstrap Gate

Do not create files, install dependencies, or modify setup until the user approves the proposed workflow. Direct user instructions can narrow scope, but do not assume approval for broad tooling changes.

## Discovery

Inspect the project before proposing changes:

1. Git status, remotes, current branch, and recent commit style.
2. Existing `AGENTS.md`, `CLAUDE.md`, `.github/pull_request_template.md`, issue templates, release docs, and contribution docs.
3. Language, framework, package manager, build tool, test runner, linting, formatting, CI, hooks, and release tooling.
4. Current folder architecture and naming conventions.
5. Public surfaces: APIs, CLI, config, environment variables, deployment, database migrations, and generated files.

Ask only the missing questions that affect workflow decisions.

## Proposed Workflow

Present a short plan before implementation:

1. Canonical instruction files: usually root `AGENTS.md` plus a small `CLAUDE.md` adapter.
2. Branch rules, protected branch names, branch naming, and whether task branches are automatic.
3. Commit message format and release/versioning rules.
4. Pull request template, draft PR default, and merge policy.
5. Required verification commands for each touched surface.
6. Documentation, changelog, and versioning triggers.
7. Tooling to add or change: linting, formatting, typechecking, tests, hooks, commit rules, CI, changelog, release scripts, and architecture utilities.
8. Risks, trade-offs, and migration steps.

Wait for user approval before implementation.

## Implementation Rules

After approval:

1. Follow `project-guard` for source, config, test, build, dependency, script, generated-code, and CI edits when available.
2. Create or update `AGENTS.md` as the canonical workflow file.
3. Create or update `CLAUDE.md` as a small adapter that imports or points to `AGENTS.md`.
4. Create or update the pull request template.
5. Configure linting, formatting, tests, hooks, commit message checks, changelog/versioning, release scripts, and CI only when they match the approved plan.
6. Prefer established project tooling over adding new packages.
7. Keep changes focused. Avoid unrelated refactors.
8. Run verification and report any failure before committing.

## References

Load only the reference that matches the current task:

- `references/agents-template.md` for a strict root `AGENTS.md` template.
- `references/claude-template.md` for a minimal Claude adapter.
- `references/typescript-backend.md` for TypeScript Express/Fastify backend setup guidance.

## Common Mistakes

| Mistake | Fix |
| --- | --- |
| Duplicating full rules in `CLAUDE.md` | Keep `AGENTS.md` canonical and make `CLAUDE.md` import or point to it. |
| Installing tooling before approval | Present the proposed workflow first. |
| Creating generic rules that do not match the stack | Inspect package scripts, config files, CI, and architecture first. |
| Treating changelog/versioning as mandatory for every edit | Require it only for public behavior or project release rules. |
| Leaving placeholders in templates | Fill project-specific commands and conventions before committing. |
