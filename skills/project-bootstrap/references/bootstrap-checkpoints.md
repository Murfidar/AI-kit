# Bootstrap Checkpoints

Use this as the question bank for the hybrid discovery interview. Inspect the repository first, then ask only the missing questions that affect the workflow. Prefer grouped questions when several unresolved choices belong together.

## Workflow Profile

Before writing files, present:

- **Confirmed:** facts directly provided by the user or existing docs.
- **Inferred:** defaults derived from package files, scripts, CI, git history, and repo layout.
- **Unresolved:** decisions that need user approval or safe defaults.

Ask for approval before creating or changing `AGENTS.md`, `CLAUDE.md`, pull request templates, hooks, CI, or scripts.

## Checkpoint Categories

### Project Shape

- What is the project type: app, library, CLI, service, plugin, template, docs, monorepo, or mixed?
- What languages, frameworks, runtimes, package managers, and build tools are canonical?
- What public surfaces matter: API, CLI, config, env vars, database schema, migrations, UI, generated code, packaging, docs, deployment, billing, security, or data handling?

### Local Environment

- Should agents prefer a local virtual environment, container, package-manager shim, version manager, or system tools?
- What setup commands are safe to run automatically?
- Which local directories must never be committed, such as `.venv/`, `target/`, `.pytest_cache/`, coverage, build, or generated artifacts?
- What should agents do when the expected environment is missing or broken?

### File And Folder Architecture

- What target tree should new code follow?
- Which folders own source, tests, docs, scripts, generated files, migrations, infrastructure, and assets?
- Are any legacy modules, flat files, names, import paths, or architecture patterns forbidden?
- Which files are public export surfaces, such as package `__init__` files, index modules, barrel files, type stubs, schemas, or OpenAPI specs?
- When should agents split files instead of adding more code to an existing module?

### Branching

- Which branches are protected?
- Should agents always create task branches from protected branches?
- What exact branch naming pattern and allowed types should be used?
- Are tool, agent, username, or workspace prefixes allowed or forbidden?

### Commits

- Should agents commit automatically after verification?
- What commit format is required: Conventional Commits, project-specific format, or no strict format?
- Should commits include only task-related files, and how should unrelated user changes be handled?

### Pull Requests

- Should agents push and open draft PRs automatically after committing?
- Which PR template should be used?
- What sections must be filled with verification evidence, risk, user impact, workflow impact, AI assistance, or screenshots?
- When may a PR be marked ready for review or merged?

### Verification Matrix

- What commands validate formatting, linting, typechecking, tests, builds, docs, packaging, migrations, generated code, and security?
- Which commands are required for every change?
- Which commands are required only for touched surfaces?
- What should agents do when verification fails?
- Are permission-only failures, such as symlink restrictions, reported differently from repository validation failures?

### Documentation, Changelog, And Versioning

- Which changes require README, docs, examples, templates, or references?
- Which changes require changelog entries?
- When should versions be updated, and which files must stay in sync?
- Which release docs or workflows govern releases?

### Coding Conventions

- What naming, module boundary, file size, test, import/export, error handling, logging, and configuration patterns should agents follow?
- Should new abstractions be avoided unless they reduce real duplication or complexity?
- What compatibility constraints must be preserved, such as public APIs, seeds, checkpoints, serialization, migrations, snapshots, or generated schemas?

### Standard Configuration

- Should bootstrap create or update `README.md`, `AGENTS.md`, `CLAUDE.md`, `.github/pull_request_template.md`, issue templates, CI, pre-commit hooks, editor config, formatter/linter config, release docs, changelog, or validation scripts?
- Which tools should be configured now, and which should only be documented as future work?

## Final Check

The proposed workflow should answer:

- What should an agent inspect before editing?
- Where should new code and tests go?
- Which branches and commits are allowed?
- Which verification commands prove a change is safe?
- What user-facing, maintainer-facing, release, and compatibility impacts must be documented?
- Which files should exist after bootstrap, and which placeholders must be removed before commit?
