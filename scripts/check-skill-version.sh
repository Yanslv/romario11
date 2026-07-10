#!/bin/sh
get_version() {
  path="$1"
  if [ ! -f "$path" ]; then
    echo ""
    return
  fi
  version=$(grep -m1 '^version:' "$path" | sed 's/^version:[[:space:]]*//')
  if [ -z "$version" ]; then
    echo "0.0.0"
  else
    echo "$version"
  fi
}

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO_SKILL="$REPO_ROOT/SKILL.md"
PROJECT_SKILL="$REPO_ROOT/.cursor/skills/romario11/SKILL.md"
GLOBAL_SKILL="$HOME/.cursor/skills/romario11/SKILL.md"

REPO_VERSION=$(get_version "$REPO_SKILL")
PROJECT_VERSION=$(get_version "$PROJECT_SKILL")
GLOBAL_VERSION=$(get_version "$GLOBAL_SKILL")

echo "romario11 - versoes instaladas"
echo "  Repo (fonte):  v$REPO_VERSION  -> $REPO_SKILL"
if [ -n "$PROJECT_VERSION" ]; then
  echo "  Projeto:       v$PROJECT_VERSION"
else
  echo "  Projeto:       nao instalada"
fi
if [ -n "$GLOBAL_VERSION" ]; then
  echo "  Global:        v$GLOBAL_VERSION"
else
  echo "  Global:        nao instalada"
fi
echo ""

OUTDATED=0

if [ -n "$PROJECT_VERSION" ] && [ "$PROJECT_VERSION" != "$REPO_VERSION" ]; then
  echo "DESATUALIZADA: projeto (.cursor/skills/romario11)"
  OUTDATED=1
fi

if [ -n "$GLOBAL_VERSION" ] && [ "$GLOBAL_VERSION" != "$REPO_VERSION" ]; then
  echo "DESATUALIZADA: global (~/.cursor/skills/romario11)"
  OUTDATED=1
fi

if [ -z "$GLOBAL_VERSION" ]; then
  echo "AVISO: skill global nao encontrada. Rode: ./scripts/sync-skill"
fi

if [ "$OUTDATED" -eq 1 ]; then
  echo "Rode: ./scripts/sync-skill"
  exit 1
fi

if [ "$REPO_VERSION" = "$PROJECT_VERSION" ] && [ "$REPO_VERSION" = "$GLOBAL_VERSION" ]; then
  echo "Tudo sincronizado na v$REPO_VERSION."
  exit 0
fi

echo "Sincronizacao parcial. Rode: ./scripts/sync-skill"
exit 1
