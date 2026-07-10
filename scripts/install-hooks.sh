#!/bin/sh
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HOOKS_SOURCE="$REPO_ROOT/.githooks"
HOOKS_TARGET="$REPO_ROOT/.git/hooks"

if [ ! -d "$HOOKS_SOURCE" ]; then
  echo ".githooks nao encontrado" >&2
  exit 1
fi

for hook in "$HOOKS_SOURCE"/*; do
  [ -f "$hook" ] || continue
  name=$(basename "$hook")
  cp "$hook" "$HOOKS_TARGET/$name"
  echo "Hook instalado: $HOOKS_TARGET/$name"
done

echo ""
echo "Hooks ativos. Apos commit ou merge, a skill sincroniza automaticamente."
