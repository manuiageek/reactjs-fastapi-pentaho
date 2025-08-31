#!/usr/bin/env bash
# wrapper carte
set -euo pipefail

CFG="/opt/pdi/carte-config.xml"
if [ -f "$CFG" ]; then
  exec /opt/pdi/carte.sh "$CFG"
fi

CARTE_HOST="${CARTE_HOST:-0.0.0.0}"
CARTE_PORT="${CARTE_PORT:-8080}"

exec /opt/pdi/carte.sh "$CARTE_HOST" "$CARTE_PORT"