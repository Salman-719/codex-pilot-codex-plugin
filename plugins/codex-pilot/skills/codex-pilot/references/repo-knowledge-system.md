# Repository Knowledge System

The repository should be the durable source of truth for future agents.

## What Belongs In The Repo

- setup commands
- verification commands
- architecture boundaries
- product behavior
- generated API or schema references
- decision logs
- execution plans
- common failure modes
- quality, reliability, and security expectations

## Recommended Structure

```text
AGENTS.md
ARCHITECTURE.md
docs/
  product/
  engineering/
  exec-plans/
    active/
    completed/
  references/
  generated/
tests/
scripts/
```

## AGENTS.md As Router

Use `AGENTS.md` to route Codex to the right place. Avoid turning it into a giant manual.

Good `AGENTS.md` content:

- where to start
- which checks to run
- where plans live
- which architecture rules are non-negotiable
- when docs, tests, or scripts must be updated

Move detailed explanations into focused docs under `docs/`.

## Generated References

Generated docs are useful when they are:

- reproducible
- clearly marked as generated
- tied to a command
- updated in CI or by a known script

Do not let generated docs become untrusted stale text.
