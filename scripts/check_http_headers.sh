#!/usr/bin/env bash
# check_http_headers.sh — Capa 3: cabeceras de seguridad HTTP
# Uso: ./check_http_headers.sh https://www.ejemplo.com [carpeta_salida]

set -euo pipefail

URL="${1:?Uso: ./check_http_headers.sh https://www.ejemplo.com [carpeta_salida]}"
OUT="${2:-capa3-web}"
mkdir -p "$OUT"; cd "$OUT"
HOST="$(echo "$URL" | sed -E 's#https?://##; s#/.*##')"

echo "[*] Cabeceras de $URL (siguiendo redirecciones, identificándonos como auditoría)"
curl -sIL -A "AuditoriaCliente/1.0" "$URL" | tee "headers-${HOST}.txt"

echo
echo "[*] Cabeceras de seguridad presentes / ausentes:"
for h in strict-transport-security content-security-policy x-frame-options \
         x-content-type-options referrer-policy permissions-policy; do
  if grep -iq "^$h:" "headers-${HOST}.txt"; then
    echo "  [OK]    $h"
  else
    echo "  [FALTA] $h"
  fi
done

sha256sum "headers-${HOST}.txt" | tee "hashes-headers-${HOST}.txt"
