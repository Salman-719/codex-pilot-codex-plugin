# Architecture And Taste

Good taste becomes more reliable when it is encoded as concrete constraints.

## Prefer Invariants

Examples:

- API input is validated at boundaries.
- UI cannot import database repositories.
- Services do not import UI modules.
- Environment variables are parsed once.
- Generated files are marked and reproducible.
- Shared helpers have owners and tests.

## Mechanical Enforcement

When possible, use:

- type checks
- schema validation
- structural tests
- dependency boundary checks
- custom lint rules
- file-size checks
- naming checks
- CI gates

## Human Judgment

Escalate to humans when the decision is mostly about:

- product taste
- user trust
- security risk acceptance
- migration timing
- architecture tradeoffs with no clear local precedent

## Useful Architecture Docs

An effective `ARCHITECTURE.md` should explain:

- system purpose
- main domains
- layers
- dependency rules
- boundary validation
- observability
- known risks
