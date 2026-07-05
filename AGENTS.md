# AGENTS.md

## Project Map

- `README.md` - install, usage, and publishing notes
- `.agents/plugins/marketplace.json` - repo marketplace entry for Codex
- `plugins/harness-engineering/.codex-plugin/plugin.json` - plugin manifest
- `plugins/harness-engineering/skills/harness-engineering/SKILL.md` - main reusable workflow
- `plugins/harness-engineering/skills/harness-engineering/references/` - focused supporting guidance
- `plugins/harness-engineering/skills/harness-engineering/assets/` - templates copied into target repos
- `plugins/harness-engineering/skills/harness-engineering/scripts/` - target-repo bootstrap and validation helpers
- `scripts/validate-plugin.sh` - repo validation check

## Standard Workflow

1. Read the relevant manifest, skill, template, or script before editing.
2. Keep the skill focused on Harness Engineering, not general Codex advice.
3. Prefer short reference docs and templates over one giant `SKILL.md`.
4. Run `./scripts/validate-plugin.sh` before finishing changes.
5. Update `CHANGELOG.md` for behavior, manifest, template, or script changes.

## Publishing Rules

- Keep `plugin.json` valid strict JSON.
- Keep skill frontmatter valid and concise.
- Do not copy the OpenAI article into this repo; link to it and summarize.
- Keep publishing URLs aligned with `https://github.com/Salman-719/harness-engineering-codex-plugin`.
- Keep plugin assets present when referenced by `plugin.json`.

## Verification

Use:

```bash
./scripts/validate-plugin.sh
```
