---
name: codex-pilot
description: "Automatically use when a repo needs better Codex support: missing AGENTS.md, unclear setup or verification, repeated Codex failures, repo onboarding, execution plans, architecture guardrails, durable docs, tests, scripts, CI, or cleanup loops."
---

# CodexPilot

Inspired by OpenAI's Harness Engineering article:
https://openai.com/index/harness-engineering/

## Purpose

Use this skill to pilot Codex through a repository so it can understand, modify, verify, and maintain the project more reliably.

The goal is not only to complete the current coding task. The goal is to improve the repository so future Codex runs can automatically understand, verify, modify, review, and maintain it more reliably.

Core principle:

```text
Humans steer. Agents execute.
```

## When To Use

Use this skill automatically when the user asks to:

- improve Codex performance on a repo
- create or improve `AGENTS.md`
- make a repo more agent-legible
- create project docs for Codex
- create execution plans
- improve tests, linting, CI, or verification
- diagnose repeated Codex failures
- turn review feedback into durable rules
- create architecture constraints
- reduce codebase entropy
- build reusable agent workflows
- onboard Codex into an unfamiliar repo
- make a complex change where setup, tests, or architecture rules are unclear

Do not use this skill for tiny one-line edits unless the user explicitly asks for repo readiness, agent readiness, or agent-first engineering.

## Automatic Use Model

CodexPilot has two levels of automatic behavior:

1. Skill-level automatic use: after the plugin is installed, Codex may select this skill implicitly when the user's task matches the description above. The user does not have to type `@codex-pilot` every time.
2. Repo-level automatic use: when CodexPilot creates or improves `AGENTS.md`, future Codex runs in that repo automatically read the repo guidance without needing the plugin to be invoked explicitly.

The durable repo-level guidance is the more reliable automation path. Prefer updating `AGENTS.md`, docs, scripts, tests, and CI so the repository itself teaches future Codex runs how to work.

## References

Read these only when relevant:

- `references/codex-pilot-principles.md` - short principle summary
- `references/repo-knowledge-system.md` - repo-as-system-of-record guidance
- `references/verification-loop.md` - verification strategy by change type
- `references/architecture-and-taste.md` - turning taste into enforceable rules
- `references/entropy-garbage-collection.md` - cleanup loops and recurring maintenance

## Core Workflow

1. Understand the user's goal.
2. Identify acceptance criteria.
3. Read the repo map:
   - `AGENTS.md`
   - `ARCHITECTURE.md`
   - `docs/`
   - `tests/`
   - package scripts
   - CI configuration
4. If the repo lacks a map, propose or create a CodexPilot structure.
5. For non-trivial work, write an execution plan before editing.
6. Implement in small, reviewable steps.
7. Run relevant verification:
   - tests
   - lint
   - typecheck
   - build
   - app-specific checks
8. Review the changes.
9. If failure occurs, diagnose the missing capability:
   - missing docs
   - missing tests
   - missing scripts
   - missing architecture rules
   - missing observability
   - missing product spec
   - missing setup instructions
10. Convert recurring feedback into durable repo artifacts:
    - docs
    - tests
    - linters
    - scripts
    - schemas
    - `AGENTS.md` guidance
11. Final response should include:
    - what changed
    - how it was verified
    - remaining risks
    - recommended CodexPilot or repo-guidance improvements

## Repository Knowledge System

Treat the repo as the system of record.

Prefer versioned, local, inspectable artifacts:

- markdown docs
- architecture notes
- execution plans
- generated schema references
- tests
- scripts
- CI checks
- examples
- lint rules

Avoid relying only on chat context, private memory, Slack messages, Google Docs, or human memory.

## AGENTS.md Rule

Do not create a giant `AGENTS.md`.

Use `AGENTS.md` as a table of contents and routing layer. It should point Codex to the right docs, scripts, tests, and rules.

Recommended `AGENTS.md` sections:

- Project map
- Standard workflow
- Verification commands
- Architecture rules
- Documentation rules
- Planning rules
- Review rules
- When to update docs, tests, or tooling

## Planning Rule

For complex work, create an execution plan.

Use:

```text
docs/exec-plans/active/
```

When complete, move it to:

```text
docs/exec-plans/completed/
```

Execution plans should include:

- Goal
- Acceptance criteria
- Current findings
- Files likely involved
- Steps
- Verification
- Risks
- Progress log
- Decisions

## Agent Legibility Rule

Make the system legible to future agents.

When Codex struggles, do not simply retry. Ask:

- What could Codex not see?
- What could Codex not verify?
- What rule was implicit instead of explicit?
- What repeated pattern should become a test, lint, doc, or script?

## Architecture And Taste Rule

Prefer mechanical enforcement over vague preference.

When possible, encode important rules as:

- type checks
- schema validation
- structural tests
- custom lints
- dependency boundary checks
- naming checks
- file-size checks
- CI gates

Focus on invariants, not micromanagement.

## Verification Loop

Every meaningful change should have a verification path.

For UI work, prefer:

- browser-driven checks
- screenshots
- DOM snapshots
- app logs
- app metrics
- smoke tests

For backend work, prefer:

- unit tests
- integration tests
- contract tests
- schema validation
- logs and traces

## Review Loop

Before finishing:

1. Review your own diff.
2. Identify likely failure modes.
3. Run checks.
4. Fix failures.
5. Summarize the final state.

For PR workflows, recommend agent review plus human review when judgment is needed.

## Entropy And Garbage Collection

When repeated problems appear, propose recurring cleanup tasks.

Examples:

- stale docs scan
- broken links scan
- test flake tracker
- tech debt tracker update
- architecture boundary check
- duplicate helper detection
- quality score update

## Done Definition

A task is complete only when:

- the requested work is done
- relevant checks were run or limitations are explained
- docs, tests, or tooling were updated if needed
- the final answer reports changes, verification, risks, and harness improvements
