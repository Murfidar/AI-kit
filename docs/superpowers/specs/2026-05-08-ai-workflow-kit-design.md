# AI Workflow Kit Design

## Goal

Create a reusable repo for project workflow skills that make Codex and Claude follow strict project-specific rules without repeating those rules in every prompt.

## Skill Design

`project-guard` is the small runtime skill. It triggers for source, config, test, build, dependency, script, generated-code, and CI edits. It does not trigger for documentation-only edits unless they accompany code/config/test work. It enforces reading project workflow files, checking branch and working tree state, creating or reusing a task branch, verifying changes, committing, pushing, and opening a draft PR.

`project-bootstrap` is the heavier setup skill. It triggers when starting or standardizing a project workflow. It inspects the stack, proposes a workflow, waits for approval, then creates or updates `AGENTS.md`, `CLAUDE.md`, PR templates, tooling, hooks, verification commands, commit rules, versioning, changelog rules, and architecture guidance.

## Project File Strategy

Each project should keep `AGENTS.md` as the canonical source of truth. `CLAUDE.md` should be a small adapter that imports or points to `AGENTS.md`.

## Installation

The repo provides a PowerShell installer that symlinks both skills into the local Codex skills directory, so editing this repo updates the active skills immediately.
