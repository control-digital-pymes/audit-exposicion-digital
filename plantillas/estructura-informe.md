# Estructura del informe entregable

El informe tiene doble lectura: ejecutiva (para el dueño) y técnica (para su implementador).

1. **Portada** — cliente, dominios, ventana de análisis, referencia, versión.
2. **Aviso de alcance y limitaciones** — qué es y qué no es esta auditoría.
3. **Resumen ejecutivo** — conclusión general, distribución de hallazgos, los puntos que más importan, prioridades a 30 días. Legible en 3-4 minutos por un no técnico.
4. **Metodología** — las siete capas y herramientas.
5. **Hallazgos por capa** — cada uno: qué se observó, por qué importa, qué hacer, esfuerzo, evidencia con hash.
6. **Correlaciones entre capas** — la sección que justifica el servicio.
7. **Plan de remediación priorizado** — tabla por criticidad, plazo, esfuerzo y coste.
8. **Lo que NO se ha encontrado** — lo que está bien, verificado.
9. **Anexo: cadena de custodia** — tabla de evidencias con sus hashes SHA-256.
10. **Anexo técnico** — fragmentos de configuración para el implementador.
11. **Declaración del autor** — metodología, ausencia de conflicto de interés.

## Criticidades

| Nivel | Plazo orientativo |
|---|---|
| Crítico | < 7 días |
| Alto | < 30 días |
| Medio | < 3 meses |
| Bajo / Informativo | Sin urgencia |
| Positivo | Sin acción (lo que está bien) |

Ver un informe completo en [`../ejemplos/caso-ejemplo-anonimizado/`](../ejemplos/caso-ejemplo-anonimizado/).
