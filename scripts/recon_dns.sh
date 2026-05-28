#!/usr/bin/env bash
# recon_dns.sh — Capa 1: dominio y DNS
# Uso: ./recon_dns.sh ejemplo.com [carpeta_salida]
# Recoge WHOIS y registros DNS, y calcula hashes de las evidencias.
# Solo consulta información pública. No toca el servidor del objetivo.

set -euo pipefail

DOMINIO="${1:?Uso: ./recon_dns.sh dominio.com [carpeta_salida]}"
OUT="${2:-capa1-dns}"
mkdir -p "$OUT"; cd "$OUT"

echo "[*] WHOIS de $DOMINIO"
whois "$DOMINIO" | tee "whois-${DOMINIO}.txt" >/dev/null

echo "[*] Registros DNS (ANY) de $DOMINIO"
dig "$DOMINIO" ANY +noall +answer | tee "dig-${DOMINIO}.txt" >/dev/null

echo "[*] Desglose por tipo"
{
  for t in A AAAA MX NS TXT SOA CAA; do
    echo "=== $t ==="
    dig "$DOMINIO" "$t" +short
    echo
  done
} | tee "dig-tipos-${DOMINIO}.txt" >/dev/null

echo "[*] Hashes de evidencias"
sha256sum whois-*.txt dig-*.txt | tee "hashes-capa1-${DOMINIO}.txt"

echo "[OK] Evidencias en $(pwd)"
