#!/usr/bin/env bash
set -euo pipefail
HOST="http://localhost:3000"
USER="${GRAFANA_USER:-admin}"
PASS="${GRAFANA_PASSWORD:-admin123}"
OUT="$(dirname "$0")/../backups/grafana/$(date +%F_%H%M%S)"
mkdir -p "$OUT"
curl -s -u "$USER:$PASS" "$HOST/api/search?query=" | jq -r '.[]|select(.type=="dash-db")|.uid' | while read -r UID; do
  curl -s -u "$USER:$PASS" "$HOST/api/dashboards/uid/$UID" > "$OUT/$UID.json"
done
echo "Saved: $OUT"
