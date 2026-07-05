# Security

## Security Boundaries

- Authentication:
- Authorization:
- Data access:
- Secrets:
- External services:

## Required Practices

- Validate external input at boundaries.
- Keep secrets out of source control and logs.
- Review dependency and supply-chain risk.
- Treat generated code as code that still needs review.

## Review Triggers

Require focused review for:

- auth changes
- permission changes
- secret handling
- payment or billing flows
- user data export or deletion
- new external integrations

## Known Risks

Track risks here until they become fixes, tests, docs, or accepted exceptions.
