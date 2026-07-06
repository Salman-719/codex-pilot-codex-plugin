#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skill_dir="$(cd "$script_dir/.." && pwd)"
asset_dir="$skill_dir/assets"

copy_if_missing() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ]; then
    echo "Keeping existing $target"
    return
  fi

  mkdir -p "$(dirname "$target")"
  cp "$source" "$target"
  echo "Created $target"
}

mkdir -p docs/product
mkdir -p docs/engineering
mkdir -p docs/exec-plans/active
mkdir -p docs/exec-plans/completed
mkdir -p docs/references
mkdir -p docs/generated

copy_if_missing "$asset_dir/AGENTS.template.md" "AGENTS.md"
copy_if_missing "$asset_dir/ARCHITECTURE.template.md" "ARCHITECTURE.md"
copy_if_missing "$asset_dir/QUALITY.template.md" "docs/engineering/QUALITY.md"
copy_if_missing "$asset_dir/RELIABILITY.template.md" "docs/engineering/RELIABILITY.md"
copy_if_missing "$asset_dir/SECURITY.template.md" "docs/engineering/SECURITY.md"
copy_if_missing "$asset_dir/TECH_DEBT_TRACKER.template.md" "docs/exec-plans/tech-debt-tracker.md"

if [ ! -f docs/exec-plans/active/example.md ]; then
  cp "$asset_dir/EXEC_PLAN.template.md" docs/exec-plans/active/example.md
  echo "Created docs/exec-plans/active/example.md"
fi

echo "CodexPilot repo structure created."
