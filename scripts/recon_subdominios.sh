#!/usr/bin/env bash
# recon_subdominios.sh — Capas 5 y 7: subdominios e infraestructura
# Uso: ./recon_subdominios.sh ejemplo.com [carpeta_salida]
# Combina Certificate Transparency (crt.sh) con sondeo de subdominios comunes.

set -euo pipefail

DOMINIO="${1:?Uso: ./recon_subdominios.sh dominio.com [carpeta_salida]}"
OUT="${2:-capa7-continuidad}"
mkdir -p "$OUT"; cd "$OUT"

echo "[*] Certificate Transparency (crt.sh) — desactiva la VPN si devuelve 502"
curl -s "https://crt.sh/?q=${DOMINIO}&output=json" -o "crtsh-${DOMINIO}.json" || true
if [ -s "crtsh-${DOMINIO}.json" ] && [ "$(cat "crtsh-${DOMINIO}.json")" != "[]" ]; then
  python3 -c "
import json,sys
data=json.load(open('crtsh-${DOMINIO}.json'))
d=set()
for c in data: d.update(c['name_value'].split(chr(10)))
[print(x) for x in sorted(d)]
" | tee "subdominios-ct-${DOMINIO}.txt"
else
  echo "  (crt.sh sin datos o no accesible; reintentar sin VPN)"
fi

echo "[*] Sondeo de subdominios comunes (DNS)"
{
  for s in mail webmail correo ftp cpanel panel admin staging dev test backup old beta intranet vpn smtp pop imap mx; do
    r="$(dig +short "${s}.${DOMINIO}" 2>/dev/null || true)"
    [ -n "$r" ] && echo "[!] ${s}.${DOMINIO} -> ${r}"
  done
} | tee "subdominios-comunes-${DOMINIO}.txt"

sha256sum crtsh-*.json subdominios-*.txt 2>/dev/null | tee "hashes-capa7-${DOMINIO}.txt"
