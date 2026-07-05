# Harness Engineering Codex Plugin

A public Codex plugin that turns OpenAI's Harness Engineering article into a reusable agent-first software engineering workflow.

Source article:
https://openai.com/index/harness-engineering/

This is an independent community plugin. It is not an official OpenAI plugin.

## What It Does

This plugin packages a single Codex skill, `harness-engineering`, that helps Codex:

- analyze a repository for agent-readiness
- create or improve `AGENTS.md`
- create architecture, quality, reliability, and security docs
- write execution plans for complex work
- design verification loops
- propose tests, lints, scripts, and CI checks
- turn repeated failures into durable repo rules
- reduce documentation and codebase entropy over time

The core idea is simple:

```text
Humans steer. Agents execute.
```

## Quick Install

After publishing this repository to GitHub, install the marketplace:

```bash
codex plugin marketplace add Salman-719/harness-engineering-codex-plugin
```

Then open Codex:

```bash
codex
/plugins
```

Choose **Harness Engineering Plugins**, install **Harness Engineering**, then start a new thread and invoke it with `@harness-engineering`.

## Local Development

From this repository root:

```bash
./scripts/validate-plugin.sh
codex plugin marketplace add .
```

Then open Codex, go to `/plugins`, choose **Harness Engineering Plugins**, and install **Harness Engineering**.

## Example Prompts

```text
@harness-engineering analyze this repo and create a harness improvement plan.
```

```text
Use Harness Engineering to create AGENTS.md, ARCHITECTURE.md, execution-plan templates, and verification scripts for this repo.
```

```text
Use Harness Engineering to diagnose why Codex keeps failing on this repo and turn the missing guidance into docs, tests, or lint rules.
```

## Repository Layout

```text
.agents/plugins/marketplace.json
plugins/harness-engineering/
  .codex-plugin/plugin.json
  assets/
  skills/harness-engineering/
    SKILL.md
    assets/
    references/
    scripts/
scripts/validate-plugin.sh
.github/workflows/validate.yml
```

## Before Publishing

Confirm the publishing URLs in:

- `plugins/harness-engineering/.codex-plugin/plugin.json`
- this `README.md`

Then run:

```bash
./scripts/validate-plugin.sh
git status --short
```

Recommended first release tag:

```bash
git tag v0.1.0
```

## What This Plugin Is Not

This plugin does not copy the OpenAI article into the repo. It links to the article, summarizes the workflow, and turns the ideas into reusable instructions, templates, and checks.

## License

MIT
