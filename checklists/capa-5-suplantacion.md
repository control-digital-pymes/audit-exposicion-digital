# Checklist · Capa 5 — Suplantación y marca

> Objetivo: detectar intentos de aprovechamiento de la marca.

## Comprobaciones

- [ ] **Typosquatting** (`dnstwist --registered --mxcheck`): variantes registradas.
- [ ] Distinguir registros **defensivos del cliente** (misma infra, redirigen al original) de **terceros**.
- [ ] **Certificate Transparency** (crt.sh): certificados para variantes del nombre o subdominios no inventariados.
- [ ] **Variantes semánticas**: nombre del producto, no solo del dominio.
- [ ] Para variantes del cliente: ¿tienen cobertura HTTPS? ¿redirección limpia?

## Criterios de hallazgo

| Observación | Criticidad |
|---|---|
| Dominio clónico de tercero con web activa | Alto / Crítico |
| Subdominio olvidado con servicio vivo | Alto |
| Typosquat defensivo sin HTTPS | Medio |
| Registro defensivo correcto | Positivo |
| Sin suplantadores externos (verificado) | Positivo |

## Nota

crt.sh puede bloquear IPs de VPN (devuelve 502). Si se usa VPN y falla, desactivarla y reintentar. Aplicar prueba de control con una consulta que se sepa que devuelve datos.
