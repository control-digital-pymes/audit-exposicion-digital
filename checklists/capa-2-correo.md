# Checklist · Capa 2 — Correo corporativo

> Objetivo: determinar si los correos del dominio pueden autenticarse y si el dominio puede ser suplantado.

## Comprobaciones

- [ ] **SPF**: existe, bien formado, política final (`-all` estricto / `~all` permisivo). Revisar nº de rangos autorizados (hosting compartido = riesgo residual).
- [ ] **DMARC** (`_dmarc.dominio`): existe, política (`none`/`quarantine`/`reject`), presencia de `rua` (reportes), `pct`, alineación.
- [ ] **DKIM**: probar selectores comunes. Si ninguno responde, documentar como no verificable externamente (el selector no es estándar).

## Criterios de hallazgo

| Observación | Criticidad |
|---|---|
| Sin DMARC | Alto |
| DMARC `p=none` y sin `rua` | Alto |
| DKIM no verificable | Medio |
| SPF permisivo | Medio |
| SPF `-all` + DMARC `reject` + DKIM activo | Positivo |

## Comandos de referencia

Ver [`scripts/check_email_auth.sh`](../scripts/check_email_auth.sh).

```bash
dig _dmarc.ejemplo.com TXT +noall +answer | tee dmarc-ejemplo.txt
for s in default mail selector1 selector2 google k1 dkim; do
  dig ${s}._domainkey.ejemplo.com TXT +noall +answer
done | tee dkim-ejemplo.txt
```
