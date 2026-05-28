# Scripts

Automatizaciones puntuales para las consultas OSINT de cada capa. Todas:

- Consultan **solo información pública**. No tocan los sistemas del objetivo.
- Guardan cada salida en fichero y calculan su **hash SHA-256**.
- Se identifican con User-Agent de auditoría donde hacen peticiones HTTP.

| Script | Capa | Qué hace |
|---|---|---|
| `recon_dns.sh` | 1 | WHOIS + registros DNS |
| `check_email_auth.sh` | 2 | SPF, DKIM, DMARC |
| `check_http_headers.sh` | 3 | Cabeceras de seguridad HTTP |
| `check_tls.sh` | 3 | Certificado y configuración TLS (testssl.sh) |
| `check_analytics.sh` | 6 | Medición y trackers en el HTML |
| `recon_subdominios.sh` | 5 y 7 | Certificate Transparency + subdominios comunes |

## Uso

```bash
chmod +x *.sh
./recon_dns.sh ejemplo.com
./check_email_auth.sh ejemplo.com
./check_http_headers.sh https://www.ejemplo.com
```

## Requisitos

`whois`, `dig` (paquete `dnsutils`/`bind-utils`), `curl`, `openssl`, `python3`. Para `check_tls.sh`, además [`testssl.sh`](https://github.com/drwetter/testssl.sh).

## Aviso

Pensados para dominios propios, con autorización, o análisis OSINT de información estrictamente pública. El uso contra terceros sin autorización puede ser ilegal.
