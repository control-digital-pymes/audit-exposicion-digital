#!/usr/bin/env bash
# check_email_auth.sh — Capa 2: SPF, DKIM, DMARC
# Uso: ./check_email_auth.sh ejemplo.com [carpeta_salida]

set -euo pipefail

DOMINIO="${1:?Uso: ./check_email_auth.sh dominio.com [carpeta_salida]}"
OUT="${2:-capa2-correo}"
mkdir -p "$OUT"; cd "$OUT"

echo "[*] SPF (TXT raíz)"
dig "$DOMINIO" TXT +short | grep -i "v=spf1" | tee "spf-${DOMINIO}.txt" || echo "(sin SPF)"

echo "[*] DMARC"
dig "_dmarc.${DOMINIO}" TXT +noall +answer | tee "dmarc-${DOMINIO}.txt" >/dev/null

echo "[*] DKIM (selectores comunes; el selector no es estándar)"
{
  for s in default mail email selector1 selector2 s1 s2 google k1 dkim; do
    echo "=== selector: $s ==="
    dig "${s}._domainkey.${DOMINIO}" TXT +noall +answer
    echo
  done
} | tee "dkim-${DOMINIO}.txt" >/dev/null

echo "[*] Hashes"
sha256sum spf-*.txt dmarc-*.txt dkim-*.txt 2>/dev/null | tee "hashes-capa2-${DOMINIO}.txt"
echo "[OK] Nota: si ningún selector DKIM responde, documentar como no verificable externamente."
