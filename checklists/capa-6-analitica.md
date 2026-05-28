# Checklist · Capa 6 — Analítica y trazabilidad

> Objetivo: verificar si la medición funciona y si el tratamiento de datos cumple la normativa.

## Comprobaciones

- [ ] Herramientas de medición en el HTML: GA4, Tag Manager, píxeles de terceros.
- [ ] Errores de implementación: código obsoleto (`_gaq`, `ga.js`), identificadores incompatibles, duplicidades.
- [ ] Banner de cookies: ¿ofrece rechazar tan fácil como aceptar? ¿panel granular?
- [ ] **Clave:** ¿el banner BLOQUEA los scripts antes del consentimiento, o es solo informativo?
- [ ] Transferencias internacionales (p. ej. píxeles a EE. UU.) y su base legal.

## Criterios de hallazgo

| Observación | Criticidad |
|---|---|
| Medición rota (no mide nada) | Crítico |
| Tracker que carga antes del consentimiento | Crítico |
| Banner solo informativo (no bloquea) | Alto |
| Banner bien estructurado (3 opciones) | Positivo |

## Comandos de referencia

Ver [`scripts/check_analytics.sh`](../scripts/check_analytics.sh).
