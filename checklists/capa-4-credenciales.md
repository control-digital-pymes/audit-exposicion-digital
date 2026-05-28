# Checklist · Capa 4 — Credenciales filtradas

> Objetivo: detectar exposición del dominio y sus cuentas en filtraciones públicas.

## Comprobaciones

- [ ] Dominio en bases de filtraciones conocidas (Have I Been Pwned, sección de webs).
- [ ] Emails corporativos expuestos en la propia web (extracción del HTML).
- [ ] Verificación por cuenta individual (requiere colaboración del cliente).

## Criterios de hallazgo

| Observación | Criticidad |
|---|---|
| Cuentas del dominio en filtraciones con contraseña | Alto |
| Emails corporativos expuestos en la web | Bajo / Medio |
| Sin emails expuestos (uso de formularios) | Positivo |

## Límite

La verificación profunda por cuenta requiere las direcciones concretas, que no son públicas. Documentar como pendiente de colaboración. No usar agregadores de dudosa legalidad.
