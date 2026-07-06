# CodexPilot

CodexPilot is an installable Codex workflow plugin for developers working inside software repositories.

Its job is to help Codex make a repo easier to understand, edit, verify, and maintain.

It does not serve normal app users. It serves developers using Codex inside a repo.

CodexPilot packages a repeatable repo-improvement workflow inspired by OpenAI's Harness Engineering article. It helps Codex inspect repo structure, create missing guidance, use execution plans, improve verification, diagnose repeated failures, and turn implicit engineering knowledge into durable repo artifacts such as docs, tests, scripts, lint rules, schemas, and CI checks.

One-line summary:

```text
CodexPilot helps Codex understand your repo, plan safely, verify changes, and improve the codebase over time.
```

Inspired by OpenAI's Harness Engineering article:
https://openai.com/index/harness-engineering/

CodexPilot is an independent plugin for Codex. It is not created, sponsored, or endorsed by OpenAI.

## Who This Is For

Use this plugin if:

- Codex keeps asking the same setup questions
- Codex edits files before understanding the repo
- your repo does not have a useful `AGENTS.md`
- verification commands are unclear or missing
- architecture rules live in people's heads
- repeated mistakes never become tests, docs, or scripts

This is not a website, SaaS product, API, or background service. It is an installable Codex workflow.

## What It Does

After installation, Codex can use CodexPilot implicitly when the task matches repo setup, repo guidance, planning, verification, or repeated-failure diagnosis.

Codex can then help you:

- inspect your repo and find what makes it hard for agents to work in
- create or improve `AGENTS.md`
- add starter architecture, quality, reliability, and security docs
- create execution-plan templates for complex work
- identify missing tests, lint commands, build checks, and CI checks
- turn repeated failures into durable repo guidance
- keep future Codex runs from rediscovering the same context

When installed, it exposes the CodexPilot plugin and one bundled skill.

Users can invoke the plugin as:

```text
@codex-pilot
```

Where supported, users can also select or mention the underlying skill through Codex skill controls such as `/skills` or `$codex-pilot`. Codex can also invoke it implicitly when the task matches the skill description.

## Automatic Use

CodexPilot is meant to become automatic in two ways.

First, after installation, Codex can choose the `codex-pilot` skill implicitly when your request is about repo readiness, `AGENTS.md`, missing verification, unclear architecture, or repeated Codex failures. You do not need to type `@codex-pilot` every time.

Second, and more importantly, CodexPilot writes durable repo guidance. Once it creates or improves `AGENTS.md`, future Codex runs in that repo automatically read those instructions even if you do not mention CodexPilot.

The explicit prompts below are only setup shortcuts and fallback examples. They are not the intended day-to-day interface.

## Quick Install

Install the marketplace:

```bash
codex plugin marketplace add Salman-719/codex-pilot-codex-plugin
```

Then open Codex:

```bash
codex
/plugins
```

Choose **CodexPilot Plugins**, install **CodexPilot**, then start a new thread.

## One-Time Setup

In a repo you want CodexPilot to prepare, ask once:

```text
@codex-pilot set up this repo so future Codex runs have durable guidance.
```

If Codex is already choosing the plugin implicitly, this also works:

```text
Set up this repo so future Codex runs have durable guidance.
```

## What It May Add To Your Repo

When you ask it to set up a CodexPilot structure, Codex may create files like:

- `AGENTS.md`
- `ARCHITECTURE.md`
- `docs/engineering/QUALITY.md`
- `docs/engineering/RELIABILITY.md`
- `docs/engineering/SECURITY.md`
- `docs/exec-plans/active/`
- `docs/exec-plans/completed/`
- `docs/exec-plans/tech-debt-tracker.md`

Codex should explain changes before and after making them, and you should review any generated files before committing.

## Are The Scripts Needed?

Yes, but users do not need to think about them first.

The scripts are small helper tools bundled with the plugin so Codex can do concrete work instead of only giving advice:

- `bootstrap-codex-pilot.sh` creates the starter repo structure when requested.
- `validate-codex-pilot.sh` checks whether the basic structure exists.
- `check-doc-links.py` checks local Markdown links.
- `check-plan-status.py` checks active execution plans.

They are intentionally lightweight. They do not run in the background, call external services, or collect data. They only run if Codex or a user invokes them.

The scripts are worth keeping because they turn CodexPilot from advice-only guidance into something Codex can execute when setting up or checking a repo.

## Implementation Links

- [plugin.json](plugins/codex-pilot/.codex-plugin/plugin.json)
- [SKILL.md](plugins/codex-pilot/skills/codex-pilot/SKILL.md)
- [bootstrap-codex-pilot.sh](plugins/codex-pilot/skills/codex-pilot/scripts/bootstrap-codex-pilot.sh)
- [validate-codex-pilot.sh](plugins/codex-pilot/skills/codex-pilot/scripts/validate-codex-pilot.sh)
- [check-doc-links.py](plugins/codex-pilot/skills/codex-pilot/scripts/check-doc-links.py)
- [check-plan-status.py](plugins/codex-pilot/skills/codex-pilot/scripts/check-plan-status.py)

## Local Development

From this repository root:

```bash
./scripts/validate-plugin.sh
codex plugin marketplace add .
```

Then open Codex, go to `/plugins`, choose **CodexPilot Plugins**, and install **CodexPilot**.

## Repository Layout

```text
.agents/plugins/marketplace.json
plugins/codex-pilot/
  .codex-plugin/plugin.json
  assets/
  skills/codex-pilot/
    SKILL.md
    assets/
    references/
    scripts/
scripts/validate-plugin.sh
.github/workflows/validate.yml
```

Only `plugin.json` lives inside `.codex-plugin/`. Skills, assets, scripts, references, and optional integration files live at the plugin root or inside the skill folder.

## License

MIT
