#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$SKILL_DIR/workspace/vendor"
mkdir -p "$TARGET"

if [[ -n "${OPENCLAW_TRANSCRIPTION_BOOTSTRAP_PYTHON:-}" ]]; then
  PIP_CMD=("$OPENCLAW_TRANSCRIPTION_BOOTSTRAP_PYTHON" -m pip)
elif python3 -m pip --version >/dev/null 2>&1; then
  PIP_CMD=(python3 -m pip)
elif command -v pip3 >/dev/null 2>&1; then
  PIP_CMD=(pip3)
else
  echo "pip nao encontrado. Instale as dependencias em workspace/vendor ou informe OPENCLAW_TRANSCRIPTION_BOOTSTRAP_PYTHON." >&2
  exit 2
fi

"${PIP_CMD[@]}" install --target "$TARGET" -r "$SKILL_DIR/requirements.txt"
echo "Dependencias instaladas em $TARGET"
