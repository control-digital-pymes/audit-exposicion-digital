# Checklist · Capa 1 — Dominio y DNS

> Objetivo: saber quién controla el dominio, cuándo expira y cómo está configurada la resolución de nombres.

## Comprobaciones

- [ ] **WHOIS / RDAP** del dominio principal y de los secundarios.
  - [ ] Fecha de creación y de expiración.
  - [ ] Registrador.
  - [ ] Contacto administrativo (¿es del cliente o de un tercero?).
  - [ ] Estados del dominio (`clientTransferProhibited` = bloqueo de transferencia, positivo).
- [ ] **Registros DNS** (`dig`):
  - [ ] A y AAAA (IPv4 / IPv6).
  - [ ] MX (servidor de correo).
  - [ ] NS (¿cuántos nameservers? ¿redundancia?).
  - [ ] TXT (incluye el SPF).
  - [ ] SOA.
  - [ ] CAA (qué CAs pueden emitir certificados, si existe).
- [ ] **DNSSEC**: ¿firmado o `unsigned`?
- [ ] **SPF** (en el TXT raíz): existe, bien formado, política final (`-all` vs `~all`).

## Criterios de hallazgo

| Observación | Criticidad orientativa |
|---|---|
| Dominio expira en < 60 días | Alto |
| Contacto administrativo en manos de un tercero | Alto |
| DNSSEC sin activar | Medio |
| Un solo nameserver (sin redundancia) | Medio |
| SPF permisivo (`~all` o `?all`) | Medio |
| `clientTransferProhibited` activado | Positivo |
| 3+ nameservers, IPv6, SPF `-all` | Positivo |

## Comandos de referencia

Ver [`scripts/recon_dns.sh`](../scripts/recon_dns.sh).

```bash
whois ejemplo.com | tee whois-ejemplo.txt
dig ejemplo.com ANY +noall +answer | tee dig-ejemplo.txt
sha256sum whois-ejemplo.txt dig-ejemplo.txt
```
