# AGENTS.md

## Project Map

- `README.md` - install, usage, and publishing notes
- `.agents/plugins/marketplace.json` - repo marketplace entry for Codex
- `plugins/codex-pilot/.codex-plugin/plugin.json` - plugin manifest
- `plugins/codex-pilot/skills/codex-pilot/SKILL.md` - main reusable workflow
- `plugins/codex-pilot/skills/codex-pilot/references/` - focused supporting guidance
- `plugins/codex-pilot/skills/codex-pilot/assets/` - templates copied into target repos
- `plugins/codex-pilot/skills/codex-pilot/scripts/` - target-repo bootstrap and validation helpers
- `scripts/validate-plugin.sh` - repo validation check

## Standard Workflow

1. Read the relevant manifest, skill, template, or script before editing.
2. Keep the skill focused on making repos easier for Codex to work in, not general Codex advice.
3. Prefer short reference docs and templates over one giant `SKILL.md`.
4. Run `./scripts/validate-plugin.sh` before finishing changes.
5. Update `CHANGELOG.md` for behavior, manifest, template, or script changes.

## Publishing Rules

- Keep `plugin.json` valid strict JSON.
- Keep skill frontmatter valid and concise.
- Do not copy the OpenAI article into this repo; link to it and summarize.
- Keep publishing URLs aligned with `https://github.com/Salman-719/codex-pilot-codex-plugin`.
- Keep plugin assets present when referenced by `plugin.json`.

## Verification

Use:

```bash
./scripts/validate-plugin.sh
```
