# Project Bootstrap Hybrid Discovery Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Improve `project-bootstrap` so it gathers project-specific architecture, workflow, tooling, and convention rules before generating `AGENTS.md` and related setup files.

**Architecture:** Keep `SKILL.md` concise and procedural. Put the richer question/checkpoint bank in a new `references/bootstrap-checkpoints.md` file, then expand AGENTS templates so the gathered answers have clear destinations.

**Tech Stack:** Markdown skill files, PowerShell repository validation, Codex skill validation.

---

### Task 1: Add Hybrid Discovery Guidance

**Files:**
- Modify: `skills/project-bootstrap/SKILL.md`
- Create: `skills/project-bootstrap/references/bootstrap-checkpoints.md`
- Modify: `scripts/validate-skills.ps1`

- [x] Add a hybrid inspect/interview/checkpoint flow to `SKILL.md`.
- [x] Add checkpoint categories for project shape, architecture, environment, branching, commits, PRs, verification, docs, generated files, coding conventions, and standard config.
- [x] Update validation so the checkpoint reference is required.

### Task 2: Expand AGENTS Templates

**Files:**
- Modify: `skills/project-bootstrap/references/agents-template.md`
- Modify: `templates/AGENTS.md`

- [x] Add optional sections for project shape, local environment, target architecture, verification matrix, generated files, compatibility, and coding conventions.
- [x] Keep placeholders explicit so bootstrapped projects replace them before committing.

### Task 3: Verify

**Files:**
- Validate all changed files.

- [x] Run `powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-skills.ps1`.
- [x] Run `python C:\Users\Admin\.codex\skills\.system\skill-creator\scripts\quick_validate.py .\skills\project-bootstrap`.
- [x] Run the required parser check for `scripts\install-skills.ps1`.
- [x] Review the diff for accidental unrelated changes.
