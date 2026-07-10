#!/bin/sh
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$REPO_ROOT/SKILL.md"

if [ ! -f "$SOURCE" ]; then
  echo "SKILL.md nao encontrado em $REPO_ROOT" >&2
  exit 1
fi

sync_target() {
  target="$1"
  mkdir -p "$(dirname "$target")"
  cp "$SOURCE" "$target"
  echo "Sincronizado: $target"
}

sync_target "$REPO_ROOT/.cursor/skills/romario11/SKILL.md"
sync_target "$HOME/.cursor/skills/romario11/SKILL.md"
