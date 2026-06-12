# AI Kit

Personal AI workflow skills and templates for keeping Codex and Claude aligned across projects.

## Skills

- `project-bootstrap`: setup assistant for creating project workflow rules, tooling, templates, and conventions.

## Install

Run from this repository:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-skills.ps1
```

Use `-Force` only to replace existing symlinked installs:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-skills.ps1 -Force
```

The installer creates symlinks into `C:\Users\<you>\.codex\skills` unless `CODEX_HOME` is set.

## Validate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-skills.ps1
python C:\Users\DELL\.codex\skills\.system\skill-creator\scripts\quick_validate.py .\skills\project-bootstrap
```
