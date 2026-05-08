# CLAUDE.md Template

Keep Claude-specific instructions small. `AGENTS.md` remains the project source of truth.

```md
@AGENTS.md

## Claude Code Notes

Follow `AGENTS.md` as the canonical project workflow.
```

If Claude cannot import files in the current environment, replace the import with:

```md
# CLAUDE.md

Read and follow `AGENTS.md` before source, config, test, build, dependency, script, generated-code, migration, infrastructure, or CI changes.
```
