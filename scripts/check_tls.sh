#!/usr/bin/env bash
# check_tls.sh — Capa 3: certificado y configuración TLS
# Requiere testssl.sh en el PATH o en ~/herramientas/testssl.sh/
# Uso: ./check_tls.sh www.ejemplo.com [carpeta_salida]

set -euo pipefail

HOST="${1:?Uso: ./check_tls.sh www.ejemplo.com [carpeta_salida]}"
OUT="${2:-capa3-web}"
mkdir -p "$OUT"; cd "$OUT"

echo "[*] Certificado (openssl)"
echo | openssl s_client -servername "$HOST" -connect "${HOST}:443" 2>/dev/null \
  | openssl x509 -noout -issuer -subject -dates -ext subjectAltName \
  | tee "cert-${HOST}.txt"

echo "[*] Configuración TLS (testssl.sh) — puede tardar varios minutos"
TESTSSL="$(command -v testssl.sh || echo "$HOME/herramientas/testssl.sh/testssl.sh")"
if [ -x "$TESTSSL" ]; then
  "$TESTSSL" --quiet --color 0 "https://${HOST}" | tee "testssl-${HOST}.txt" >/dev/null
else
  echo "  [aviso] testssl.sh no encontrado. Instálalo: git clone https://github.com/drwetter/testssl.sh"
fi

sha256sum cert-*.txt testssl-*.txt 2>/dev/null | tee "hashes-tls-${HOST}.txt"
