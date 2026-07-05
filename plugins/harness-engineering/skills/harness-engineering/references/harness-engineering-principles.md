# Harness Engineering Principles

Source:
https://openai.com/index/harness-engineering/

## Principle 1: Humans steer, agents execute

Humans define goals, constraints, taste, and acceptance criteria. Codex performs implementation, review, documentation, testing, and cleanup.

## Principle 2: The repo is the system of record

Important knowledge should live in versioned repo artifacts:

- `AGENTS.md`
- `ARCHITECTURE.md`
- `docs/`
- `tests/`
- `scripts/`
- CI
- generated references
- executable plans

## Principle 3: AGENTS.md is a map, not a book

Keep `AGENTS.md` small. It should point to deeper docs.

## Principle 4: Plans are artifacts

Complex work should create an execution plan with progress logs and decisions.

## Principle 5: Make the app legible to Codex

Expose ways to inspect behavior:

- logs
- metrics
- traces
- screenshots
- DOM snapshots
- reproducible commands

## Principle 6: Enforce architecture mechanically

Prefer tests, lints, type checks, schemas, and CI over vague instructions.

## Principle 7: Turn feedback into system improvements

Repeated feedback should become a durable rule, test, doc, script, or lint.

## Principle 8: Garbage-collect entropy continuously

Clean up stale docs, duplicate helpers, weak boundaries, and poor patterns before they compound.
