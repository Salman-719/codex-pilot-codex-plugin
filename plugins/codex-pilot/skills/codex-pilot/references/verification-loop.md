# Verification Loop

Every meaningful change needs a way to prove it works.

## First Pass

1. Identify the behavior being changed.
2. Find the closest existing check.
3. Prefer the narrowest reliable check.
4. Add a check when behavior changes and no check exists.
5. Run the check and report the result.

## Frontend Verification

Prefer:

- unit tests for pure logic
- component tests for rendering states
- browser tests for workflows
- screenshots for visual regressions
- DOM snapshots for state transitions
- console and network logs for runtime failures

For visual work, verify at least one desktop and one mobile viewport when layout risk exists.

## Backend Verification

Prefer:

- unit tests for pure logic
- integration tests for storage and service boundaries
- contract tests for APIs
- schema validation for external inputs
- logs and traces for runtime diagnosis

## Tooling Verification

Prefer:

- `--help` or dry-run behavior for scripts
- fixture-based tests for code generators
- link checks for docs
- JSON/YAML validation for manifests

## Failure Response

When verification fails, do not only fix the immediate symptom. Ask what the repo lacked:

- a doc
- a test
- a script
- a schema
- a fixture
- a rule
- an architecture boundary
- a better error message
