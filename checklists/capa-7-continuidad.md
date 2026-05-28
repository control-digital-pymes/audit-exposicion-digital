# Checklist · Capa 7 — Continuidad y propiedad

> Objetivo: responder a "¿quién controla cada pieza del negocio digital y qué pasa si falla?".

## Comprobaciones

- [ ] Mapa de infraestructura: web, correo, DNS, otros servicios (IPs y proveedores).
- [ ] Subdominios comunes (`mail`, `webmail`, `ftp`, `cpanel`, `staging`, `dev`, `vpn`...).
- [ ] Subdominios huérfanos (apuntan a servicios muertos = riesgo de takeover).
- [ ] Cuentas con acceso, incluidas las de proveedores externos.
- [ ] Vencimientos críticos (dominios, certificados, licencias).
- [ ] Puntos únicos de fallo (dependencia de un solo proveedor).

## Criterios de hallazgo

| Observación | Criticidad |
|---|---|
| Subdominio huérfano (takeover posible) | Alto / Crítico |
| Servicio autogestionado sin inventariar | Alto |
| Cuenta de antiguo proveedor aún activa | Alto |
| Licencia sin titular claro | Medio |
| Dependencia de un único proveedor | Medio / informativo |
| Infraestructura mapeada y documentada | Positivo |

## Comandos de referencia

Ver [`scripts/recon_subdominios.sh`](../scripts/recon_subdominios.sh).
