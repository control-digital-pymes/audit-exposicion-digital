# Checklist · Capa 3 — Web pública

> Objetivo: revisar la superficie web observable sin tocar el servidor.

## Comprobaciones

- [ ] **Cabeceras de seguridad** (`curl -I`): HSTS, CSP, X-Frame-Options, X-Content-Type-Options, Referrer-Policy, Permissions-Policy.
- [ ] **Certificado TLS** (`openssl`): validez, emisor, fuerza de clave, SCTs de Certificate Transparency.
- [ ] **Configuración TLS** (`testssl.sh`): protocolos habilitados, cifrados, vulnerabilidades conocidas, nota global.
- [ ] **Tecnología**: CMS y versión (meta generator), plugins detectables, tema.
- [ ] **Ficheros públicos**: `robots.txt`, `sitemap.xml`, `author-sitemap.xml`.
- [ ] **Información expuesta** en HTML: emails, comentarios de desarrollo, rutas internas.
- [ ] **Hardening de ficheros**: ¿se sirve `readme.txt` / `changelog.txt` de plugins?

## Criterios de hallazgo

| Observación | Criticidad |
|---|---|
| Software desactualizado con CVE conocido | Alto / Crítico |
| Ausencia de cabeceras de seguridad | Alto |
| Versiones de CMS/plugins expuestas | Alto |
| Enumeración de usuarios posible | Medio |
| Hardening de ficheros inconsistente | Medio |
| TLS A/A+ sin vulnerabilidades | Positivo |

## Comandos de referencia

Ver [`scripts/check_http_headers.sh`](../scripts/check_http_headers.sh) y [`scripts/check_tls.sh`](../scripts/check_tls.sh).
