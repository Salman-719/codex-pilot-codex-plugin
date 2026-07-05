# Architecture

## System Overview

Describe what the system does and who uses it.

## Main Domains

- Domain 1:
- Domain 2:
- Domain 3:

## Layers

Recommended pattern:

```text
Types -> Config -> Repository -> Service -> Runtime -> UI
```

## Dependency Rules

Allowed dependencies:

- Types can be used everywhere.
- Config can depend on Types.
- Repository can depend on Config and Types.
- Service can depend on Repository, Config, and Types.
- Runtime can depend on Service.
- UI can depend on Runtime and Service APIs.

Forbidden dependencies:

- UI must not directly access database repositories.
- Services must not import UI code.
- Cross-domain dependencies must go through explicit interfaces.

## Boundary Validation

All external data must be validated at system boundaries.

Examples:

- API requests
- database rows
- third-party SDK responses
- environment variables
- user input
- generated files

## Observability

Every important workflow should expose enough information for Codex to debug:

- logs
- errors
- traces
- metrics
- screenshots for UI flows
- reproducible commands

## Known Risks

Track risks here until they become tests, docs, or lint rules.
