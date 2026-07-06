# CodexPilot

CodexPilot is a Codex plugin for developers who want Codex to work more reliably inside their projects.

It helps Codex turn a messy or under-documented repository into a project with clearer instructions, better planning habits, and repeatable verification checks.

Inspired by OpenAI's Harness Engineering article:
https://openai.com/index/harness-engineering/

This is an independent community plugin. It is not an official OpenAI plugin.

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

After installation, you can ask Codex to use `@codex-pilot`.

Codex can then help you:

- inspect your repo and find what makes it hard for agents to work in
- create or improve `AGENTS.md`
- add starter architecture, quality, reliability, and security docs
- create execution-plan templates for complex work
- identify missing tests, lint commands, build checks, and CI checks
- turn repeated failures into durable repo guidance
- keep future Codex runs from rediscovering the same context

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

## Start Here

In a repo you want to improve, ask:

```text
@codex-pilot make this repo easier for Codex to work in.
```

Other useful prompts:

```text
@codex-pilot analyze this repo and tell me what is missing for reliable Codex work.
```

```text
@codex-pilot create a starter AGENTS.md, architecture doc, execution-plan template, and verification checklist.
```

```text
@codex-pilot Codex keeps failing on this repo. Diagnose what it cannot see or verify, then propose durable fixes.
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

## License

MIT
