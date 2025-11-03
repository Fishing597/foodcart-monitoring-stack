#!/usr/bin/env bash
LAN_IP=$(hostname -I | awk '{print $1}')
TS_IP=$(tailscale ip -4 2>/dev/null | head -n1)
printf "LAN:       http://%s:3000  (Grafana)\n" "$LAN_IP"
printf "           http://%s:3001  (Uptime Kuma)\n" "$LAN_IP"
printf "           http://%s:9090  (Prometheus)\n\n" "$LAN_IP"
[ -n "$TS_IP" ] && {
  printf "Tailscale: http://%s:3000  (Grafana)\n" "$TS_IP"
  printf "           http://%s:3001  (Uptime Kuma)\n" "$TS_IP"
  printf "           http://%s:9090  (Prometheus)\n" "$TS_IP"
}
