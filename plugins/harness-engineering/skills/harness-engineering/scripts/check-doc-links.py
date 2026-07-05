#!/usr/bin/env python3
"""Check local Markdown links in a repository."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse


LINK_RE = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")
SKIP_SCHEMES = {"http", "https", "mailto", "tel"}


def iter_markdown_files(root: Path) -> list[Path]:
    ignored_parts = {".git", "node_modules", ".venv", "__pycache__"}
    files: list[Path] = []
    for path in root.rglob("*.md"):
        if ignored_parts.intersection(path.parts):
            continue
        files.append(path)
    return files


def is_local_link(raw_link: str) -> bool:
    target = raw_link.strip().split()[0]
    parsed = urlparse(target)
    return parsed.scheme not in SKIP_SCHEMES and not target.startswith("#")


def resolve_link(markdown_file: Path, raw_link: str) -> Path:
    target = raw_link.strip().split()[0]
    target = target.split("#", 1)[0]
    target = unquote(target)
    if not target:
        return markdown_file
    candidate = Path(target)
    if candidate.is_absolute():
        return candidate
    return (markdown_file.parent / candidate).resolve()


def main() -> int:
    root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
    failures: list[str] = []

    for markdown_file in iter_markdown_files(root):
        text = markdown_file.read_text(encoding="utf-8")
        for match in LINK_RE.finditer(text):
            raw_link = match.group(1)
            if not is_local_link(raw_link):
                continue
            target = resolve_link(markdown_file, raw_link)
            if not target.exists():
                failures.append(f"{markdown_file.relative_to(root)} -> {raw_link}")

    if failures:
        print("Broken local Markdown links:")
        for failure in failures:
            print(f"- {failure}")
        return 1

    print("Markdown local links look valid.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
