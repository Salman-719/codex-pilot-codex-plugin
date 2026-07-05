#!/usr/bin/env bash
set -euo pipefail

plugin_root="plugins/harness-engineering"
skill_root="$plugin_root/skills/harness-engineering"

required_files=(
  ".agents/plugins/marketplace.json"
  "$plugin_root/.codex-plugin/plugin.json"
  "$skill_root/SKILL.md"
  "$skill_root/references/harness-engineering-principles.md"
  "$skill_root/assets/AGENTS.template.md"
  "$skill_root/assets/ARCHITECTURE.template.md"
  "$skill_root/assets/EXEC_PLAN.template.md"
  "$skill_root/scripts/bootstrap-harness.sh"
  "$skill_root/scripts/validate-harness.sh"
  "$skill_root/scripts/check-doc-links.py"
  "$skill_root/scripts/check-plan-status.py"
  "$plugin_root/assets/icon.png"
  "$plugin_root/assets/logo.png"
  "$plugin_root/assets/screenshot-1.png"
  "README.md"
  "LICENSE"
  "PRIVACY.md"
  "TERMS.md"
)

for path in "${required_files[@]}"; do
  test -f "$path" || {
    echo "Missing required file: $path"
    exit 1
  }
done

python3 -m json.tool .agents/plugins/marketplace.json > /dev/null
python3 -m json.tool "$plugin_root/.codex-plugin/plugin.json" > /dev/null

python3 - <<'PY'
import json
from pathlib import Path

manifest = json.loads(Path("plugins/harness-engineering/.codex-plugin/plugin.json").read_text())
marketplace = json.loads(Path(".agents/plugins/marketplace.json").read_text())
skill = Path("plugins/harness-engineering/skills/harness-engineering/SKILL.md").read_text()

assert manifest["name"] == "harness-engineering"
assert manifest["version"].count(".") == 2
assert manifest["skills"] == "./skills/"
assert manifest["interface"]["displayName"] == "Harness Engineering"
assert len(manifest["interface"]["defaultPrompt"]) <= 3
assert marketplace["name"] == "harness-engineering-marketplace"
assert marketplace["plugins"][0]["source"]["path"] == "./plugins/harness-engineering"
assert skill.startswith("---\n")
assert "\nname: harness-engineering\n" in skill
assert "description:" in skill
PY

grep -q "https://openai.com/index/harness-engineering/" README.md
grep -q "https://openai.com/index/harness-engineering/" "$skill_root/SKILL.md"
grep -q "https://openai.com/index/harness-engineering/" "$skill_root/references/harness-engineering-principles.md"

bash -n "$skill_root/scripts/bootstrap-harness.sh"
bash -n "$skill_root/scripts/validate-harness.sh"
python3 -m py_compile "$skill_root/scripts/check-doc-links.py"
python3 -m py_compile "$skill_root/scripts/check-plan-status.py"

test -x "$skill_root/scripts/bootstrap-harness.sh"
test -x "$skill_root/scripts/validate-harness.sh"
test -x "$skill_root/scripts/check-doc-links.py"
test -x "$skill_root/scripts/check-plan-status.py"

echo "Plugin validation passed."
