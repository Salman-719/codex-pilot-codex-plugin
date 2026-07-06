# AGENTS.md

## Project Map

Start here:

- `ARCHITECTURE.md` - top-level architecture and boundaries
- `docs/product/` - product behavior and specs
- `docs/engineering/` - engineering rules and workflows
- `docs/exec-plans/active/` - current complex work
- `docs/exec-plans/completed/` - completed plans and decisions
- `docs/references/` - generated or external references
- `docs/generated/` - generated schema/API docs
- `tests/` - verification examples

## Standard Workflow

1. Restate the task and acceptance criteria.
2. Read the relevant docs and code.
3. Make the smallest safe change.
4. Add or update tests when behavior changes.
5. Run relevant checks.
6. Update docs if behavior, setup, architecture, or workflow changes.
7. Summarize changes, verification, risks, and follow-ups.

## Verification Commands

Replace these with this repo's real commands:

```bash
npm run lint
npm run typecheck
npm test
npm run build
```

## Planning

Use an execution plan for complex, risky, or multi-file work.

Active plans:

```text
docs/exec-plans/active/
```

Completed plans:

```text
docs/exec-plans/completed/
```

## Feedback Loop

When the same issue happens twice, update one of:

- `AGENTS.md`
- docs
- tests
- lint rules
- scripts
- CI
- architecture notes
