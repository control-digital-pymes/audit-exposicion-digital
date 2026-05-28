#!/usr/bin/env bash
# check_analytics.sh — Capa 6: detección de medición y trackers
# Uso: ./check_analytics.sh https://www.ejemplo.com [carpeta_salida]

set -euo pipefail

URL="${1:?Uso: ./check_analytics.sh https://www.ejemplo.com [carpeta_salida]}"
OUT="${2:-capa6-analitica}"
mkdir -p "$OUT"; cd "$OUT"
HOST="$(echo "$URL" | sed -E 's#https?://##; s#/.*##')"

echo "[*] Descargando HTML"
curl -sL -A "AuditoriaCliente/1.0 (analisis-medicion)" "$URL" -o "web-${HOST}.html"

echo "[*] Identificadores de medición encontrados:"
grep -oE '(G-[A-Z0-9]{8,12}|GTM-[A-Z0-9]{6,8}|UA-[0-9]{4,10}-[0-9]{1,3}|fbq\(|gtag\(|_gaq|google-analytics|googletagmanager|hotjar|clarity\.ms|mailchimp)' \
  "web-${HOST}.html" | sort | uniq -c | sort -rn | tee "medicion-${HOST}.txt" || echo "(ninguno)"

echo
echo "[*] Pistas de banner de cookies:"
grep -ioE '(cookie-law-info|cookieyes|cookiebot|borlabs|complianz)' "web-${HOST}.html" | sort -u || echo "(ninguno detectado)"

echo "[!] Revisar manualmente: ¿los trackers cargan ANTES del consentimiento? (señal de incumplimiento)"
sha256sum "web-${HOST}.html" "medicion-${HOST}.txt" | tee "hashes-capa6-${HOST}.txt"
