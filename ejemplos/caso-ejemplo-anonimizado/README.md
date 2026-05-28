# Caso de ejemplo (anonimizado)

Auditoría completa de exposición digital sobre un cliente ficticio, derivada de un caso real **anonimizado**: cliente, dominios, identificadores y direcciones IP sustituidos por valores ficticios. Los nombres de fichero y hashes de la cadena de custodia son ilustrativos en esta versión pública.

## Qué demuestra este caso

Las siete capas aplicadas de principio a fin sobre una pyme con tienda online:

- **2 hallazgos críticos:** analítica completamente rota (no medía nada) y tracker de marketing cargando antes del consentimiento (riesgo legal).
- **4 hallazgos altos:** software desactualizado con historial de vulnerabilidades, sistema documental expuesto sin inventariar, cuenta de proveedor externo con acceso activo, ausencia de cabeceras de seguridad.
- **4 medios, 3 bajos** y **9 aspectos correctos verificados.**
- **3 correlaciones entre capas** que es donde está el valor diferencial.

## El informe

[informe-auditoria-anonimizado.pdf](informe-auditoria-anonimizado.pdf) — 15 páginas, con resumen ejecutivo, hallazgos detallados, correlaciones, plan de remediación priorizado, sección "lo que no se ha encontrado" y cadena de custodia.

## Lección metodológica del caso

El hallazgo más valioso (un sistema documental expuesto y sin inventariar) **no apareció buscándolo directamente**, sino al consultar Certificate Transparency durante el análisis de marca. Los hallazgos que más diferencian un informe rara vez son los que se buscan: son los que emergen al mirar el conjunto con método.
