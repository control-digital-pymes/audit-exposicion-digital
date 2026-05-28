# Alcance y límites

Definir con precisión qué hace y qué **no** hace esta auditoría protege legalmente al auditor y, paradójicamente, aumenta la confianza del cliente. La sobre-promesa es la marca del aficionado.

## Qué incluye

- Análisis **externo y pasivo** de información de acceso público.
- Revisión de las siete capas descritas en la metodología.
- Informe con hallazgos clasificados, correlaciones, plan de remediación y cadena de custodia ligera.

## Qué NO incluye

- **No es un test de intrusión (pentest).** No se intenta explotar ninguna vulnerabilidad.
- **No accede a sistemas del cliente.** No se usan credenciales, no se entra en paneles, no se consultan bases de datos.
- **No es una auditoría de cumplimiento normativo.** No certifica conformidad con RGPD, LOPDGDD, ENS ni ISO 27001. Puede señalar indicios de riesgo legal, pero no sustituye a un asesor jurídico.
- **No es un dictamen pericial.** La cadena de custodia es "ligera": suficiente para una primera base defendible, pero un peritaje formal requiere medios adicionales (sellado de tiempo por tercero de confianza, entre otros).
- **No garantiza ausencia de vulnerabilidades.** Refleja el estado observable en una ventana de tiempo concreta.

## Verificaciones que requieren colaboración del cliente

Algunas comprobaciones no pueden completarse desde fuera y se documentan como pendientes:

- Verificación de DKIM (requiere el selector o una cabecera de correo legítimo).
- Exposición de cuentas individuales en filtraciones (requiere las direcciones concretas).
- Análisis de seguridad de servicios que requieren autenticación (paneles, sistemas internos).
- Titularidad real de dominios `.es` (el WHOIS está restringido).

## Validez temporal

Los hallazgos reflejan el estado observable durante la ventana de análisis. La exposición digital cambia: se recomienda repetir la revisión cada 6-12 meses o tras cualquier cambio significativo (migración, cambio de proveedor, incidente).
