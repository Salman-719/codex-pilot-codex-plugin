# Entropy And Garbage Collection

Agent-first development can increase throughput. Without cleanup loops, it can also increase entropy.

## Watch For

- stale docs
- duplicated helpers
- unclear ownership
- weak boundaries
- brittle tests
- ignored warnings
- TODOs without owners
- generated files with no generator
- repeated review comments

## Cleanup Loop

1. Identify a repeated issue.
2. Decide the durable home:
   - doc
   - test
   - script
   - lint
   - CI check
   - architecture rule
3. Add the smallest useful enforcement.
4. Verify it.
5. Record the decision.

## Suggested Recurring Tasks

- scan docs for broken links
- review active execution plans
- update the tech debt tracker
- check architecture boundary drift
- remove stale generated references
- review flaky tests
- promote repeated review feedback into rules
