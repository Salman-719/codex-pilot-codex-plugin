#!/usr/bin/env python3
"""Validate active CodexPilot execution plans."""

from __future__ import annotations

import re
import sys
from pathlib import Path


REQUIRED_SECTIONS = (
    "## Goal",
    "## Acceptance Criteria",
    "## Steps",
    "## Verification",
    "## Progress Log",
)


def main() -> int:
    root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
    active_dir = root / "docs" / "exec-plans" / "active"

    if not active_dir.exists():
        print("No active execution-plan directory found.")
        return 0

    failures: list[str] = []
    plans = sorted(active_dir.glob("*.md"))

    for plan in plans:
        text = plan.read_text(encoding="utf-8")
        for section in REQUIRED_SECTIONS:
            if section not in text:
                failures.append(f"{plan.relative_to(root)} missing {section}")
        if re.search(r"^- \[[ xX]\] ", text, flags=re.MULTILINE) is None:
            failures.append(f"{plan.relative_to(root)} has no checklist steps")

    if failures:
        print("Execution plan validation failed:")
        for failure in failures:
            print(f"- {failure}")
        return 1

    print(f"Execution plans look valid ({len(plans)} active).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
