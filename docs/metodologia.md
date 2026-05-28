# Metodología — Auditoría de Exposición Digital

Revisión externa, pasiva y documentada de la huella digital pública de una pyme. Siete capas, analizadas en orden y correlacionadas entre sí.

El orden importa: va de lo más fácil de demostrar y entender (un dominio que expira) a lo más técnico (un servicio olvidado expuesto). Cuando el cliente lee el informe, empieza por algo que entiende, y eso le predispone a confiar en el resto.

---

## Capa 1 — Dominio y DNS

**Objetivo:** saber quién controla el dominio, cuándo expira y cómo está configurada la resolución de nombres.

- WHOIS / RDAP: titular, fechas de creación y expiración, registrador, estados (p. ej. `clientTransferProhibited`).
- Registros DNS: A, AAAA, MX, NS, TXT, SOA, CAA.
- DNSSEC (firmado / sin firmar).
- Política SPF publicada en el TXT raíz.

**Hallazgos típicos:** vencimiento próximo, contacto administrativo en manos de un tercero, DNSSEC ausente, ausencia de redundancia de nameservers.

---

## Capa 2 — Correo corporativo

**Objetivo:** determinar si los correos del dominio pueden ser autenticados, y si el dominio puede ser suplantado en envíos a terceros.

- **SPF:** existe, está bien formado, política final (`-all` estricto vs `~all` permisivo).
- **DKIM:** al menos un selector publicado. Recordar que el selector no es estándar; sin acceso o sin una cabecera de correo legítimo, la verificación externa es limitada.
- **DMARC:** existe, política (`none`/`quarantine`/`reject`), presencia de `rua`/`ruf`, alineación.

**Hallazgos típicos:** DMARC en `p=none` sin reporte, DKIM no verificable, SPF permisivo, ausencia total de DMARC.

---

## Capa 3 — Web pública

**Objetivo:** revisar la superficie web observable sin tocar el servidor.

- Cabeceras HTTP de seguridad: HSTS, CSP, X-Frame-Options, X-Content-Type-Options, Referrer-Policy, Permissions-Policy.
- Certificado TLS: validez, emisor, fuerza de clave, Certificate Transparency.
- Configuración TLS del servidor (con `testssl.sh`): protocolos, cifrados, vulnerabilidades conocidas.
- Tecnología expuesta: CMS y versión, plugins detectables, tema.
- Ficheros públicos: `robots.txt`, `sitemap.xml`, `author-sitemap.xml`.
- Información expuesta en el HTML: emails, comentarios de desarrollo, rutas internas.

**Hallazgos típicos:** ausencia de cabeceras de seguridad, software desactualizado con CVEs conocidos, versiones expuestas, enumeración de usuarios posible.

---

## Capa 4 — Credenciales filtradas

**Objetivo:** detectar exposición del dominio y sus cuentas en filtraciones públicas.

- Consulta del dominio en bases de filtraciones conocidas (Have I Been Pwned, sección de webs comprometidas).
- Búsqueda de emails corporativos expuestos en la propia web.
- Verificación por cuenta individual: requiere conocer las direcciones, normalmente con colaboración del cliente.

**Límite habitual:** la verificación profunda por cuenta exige las direcciones concretas, que no son públicas. Se documenta como pendiente de colaboración.

---

## Capa 5 — Suplantación y marca

**Objetivo:** detectar intentos de aprovechamiento de la marca.

- Variaciones tipográficas registradas (typosquatting) con `dnstwist`.
- Distinguir registros defensivos del propio cliente de registros de terceros.
- Consulta a Certificate Transparency: certificados emitidos para variantes del nombre o subdominios no inventariados.
- Variantes semánticas (nombre del producto, no solo del dominio).

**Hallazgos típicos:** typosquatting defensivo incompleto, subdominios olvidados con servicios vivos, certificados sospechosos de terceros.

---

## Capa 6 — Analítica y trazabilidad

**Objetivo:** verificar si la medición funciona y si el tratamiento de datos cumple la normativa.

- Detección de GA4, Tag Manager, píxeles de terceros desde el HTML.
- Errores de implementación: código obsoleto, identificadores incompatibles, duplicidades.
- Banner de cookies: estructura (aceptar/rechazar/configurar) y, sobre todo, si bloquea de verdad los scripts antes del consentimiento o es meramente informativo.

**Hallazgos típicos:** medición rota (no mide nada), trackers que cargan antes del consentimiento, transferencias internacionales sin base legal documentada.

---

## Capa 7 — Continuidad y propiedad

**Objetivo:** responder a "¿quién controla cada pieza del negocio digital y qué pasa si falla?".

- Mapa de infraestructura: dónde está la web, el correo, el DNS, otros servicios.
- Subdominios huérfanos (riesgo de subdomain takeover).
- Cuentas con acceso (incluidas las de proveedores externos).
- Vencimientos críticos y puntos únicos de fallo.

**Hallazgos típicos:** servicios autogestionados sin inventariar, cuentas de antiguos proveedores aún activas, dependencia de un único proveedor, licencias sin titular claro.

---

## Síntesis: correlaciones

El valor diferencial no está en cada capa por separado, sino en cruzarlas. Ejemplos de patrones que solo emergen al correlacionar:

- **Riesgo de suplantación:** DMARC débil (Capa 2) + typosquatting incompleto (Capa 5) + marca reconocida.
- **Tienda que ni mide ni cumple:** analítica rota (Capa 6) + tracker sin consentimiento (Capa 6) + sin CSP (Capa 3) + plugins desactualizados (Capa 3).
- **Gobernanza difusa:** cuenta de agencia activa (Capa 3/7) + servicio autogestionado aparte (Capa 7) + configuraciones de calidad desigual entre sistemas.

El informe dedica una sección específica a estas correlaciones.
