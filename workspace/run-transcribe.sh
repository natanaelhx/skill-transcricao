#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PYTHONPATH="$SKILL_DIR/workspace/vendor${PYTHONPATH:+:$PYTHONPATH}"

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  exec python3 "$SKILL_DIR/workspace/transcribe.py" "$@"
fi

if ! python3 - <<'PY' >/dev/null 2>&1
import faster_whisper
PY
then
  "$SKILL_DIR/workspace/bootstrap.sh"
fi

exec python3 "$SKILL_DIR/workspace/transcribe.py" "$@"
