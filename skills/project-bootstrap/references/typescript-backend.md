# TypeScript Backend Workflow Guidance

Use for TypeScript backend projects using Express, Fastify, or similar frameworks.

## Discovery

Inspect these files first when present:

- `package.json`
- `tsconfig.json`
- `eslint.config.*`, `.eslintrc*`
- `prettier.config.*`, `.prettierrc*`
- `vitest.config.*`, `jest.config.*`
- `.husky/`, `.lintstagedrc*`, `commitlint.config.*`
- `.github/workflows/*`
- `src/`, `test/`, `tests/`

## Recommended Defaults

| Area | Recommendation |
| --- | --- |
| Runtime | Node LTS documented in `.nvmrc`, `.node-version`, or `package.json#engines` |
| Package manager | Use the existing lockfile: `pnpm-lock.yaml`, `yarn.lock`, `package-lock.json`, or `bun.lockb` |
| Formatting | Prettier |
| Linting | ESLint with TypeScript support |
| Typecheck | `tsc --noEmit` |
| Testing | Vitest by default; Jest if already present |
| Hooks | Husky plus lint-staged |
| Commit rules | commitlint with Conventional Commits unless project uses another format |
| Logger | Pino for Fastify or structured service logging; avoid console logging in app code |
| Config | Validate environment variables with a schema library when the project already has or accepts one |
| Architecture | Modular by domain for non-trivial apps; keep route, service, repository, and schema boundaries clear |

## Useful Scripts

Prefer these names unless the project already has a convention:

```json
{
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsc -p tsconfig.json",
    "typecheck": "tsc --noEmit",
    "lint": "eslint .",
    "format": "prettier --write .",
    "format:check": "prettier --check .",
    "test": "vitest run",
    "test:watch": "vitest"
  }
}
```

## Folder Architecture

For small services, keep the structure boring:

```text
src/
  index.ts
  app.ts
  config/
  routes/
  services/
  repositories/
  schemas/
  utils/
tests/
```

For larger services, prefer modular domains:

```text
src/
  modules/
    users/
      users.routes.ts
      users.service.ts
      users.repository.ts
      users.schema.ts
      users.test.ts
  shared/
    config/
    logger/
    errors/
```

Document the chosen architecture in `AGENTS.md`.
