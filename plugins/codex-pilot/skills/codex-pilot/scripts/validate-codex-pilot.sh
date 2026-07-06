#!/usr/bin/env bash
set -euo pipefail

missing=0

required_paths=(
  "AGENTS.md"
  "ARCHITECTURE.md"
  "docs"
  "docs/engineering"
  "docs/exec-plans"
  "docs/exec-plans/active"
  "docs/exec-plans/completed"
)

for path in "${required_paths[@]}"; do
  if [ ! -e "$path" ]; then
    echo "Missing required CodexPilot repo path: $path"
    missing=1
  fi
done

if [ -f AGENTS.md ]; then
  grep -qi "Project Map" AGENTS.md || {
    echo "AGENTS.md should include a Project Map section"
    missing=1
  }
  grep -qi "Verification" AGENTS.md || {
    echo "AGENTS.md should include verification guidance"
    missing=1
  }
fi

if [ "$missing" -eq 1 ]; then
  exit 1
fi

echo "CodexPilot repo structure looks valid."
