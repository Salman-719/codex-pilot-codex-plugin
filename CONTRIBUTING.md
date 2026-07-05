# Contributing

Thanks for improving this plugin.

## Local Checks

Run:

```bash
./scripts/validate-plugin.sh
```

## Guidelines

- Keep `SKILL.md` concise enough to load quickly.
- Put deeper guidance in `references/`.
- Put reusable starter files in `assets/`.
- Put deterministic setup or validation work in `scripts/`.
- Do not copy OpenAI's Harness Engineering article into this repository.
- Update `CHANGELOG.md` for user-visible changes.

## Release Checklist

- `plugin.json` has the right repository URLs.
- `marketplace.json` points to `./plugins/harness-engineering`.
- `SKILL.md` has `name` and `description` frontmatter.
- Scripts are executable.
- `./scripts/validate-plugin.sh` passes.
- The plugin installs from a fresh checkout.
