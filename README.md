# Curso de SQL y PostgreSQL

Curso practico y progresivo para aprender SQL desde cero. Desde tu primera query SELECT hasta optimizar consultas con indices y EXPLAIN.

**[Ver el curso en linea](https://paulovillarroel.github.io/curso-sql/)**

## Contenido

El curso esta organizado en 18 modulos agrupados por nivel de dificultad:

### Basico

1. **Introduccion a SQL y PostgreSQL** — Que es SQL, paradigma declarativo, RDBMS
2. **Preparando el entorno** — Instalacion de PostgreSQL, creacion de la base de datos de practica
3. **SELECT: Tu primera consulta** — SELECT, FROM, DISTINCT, aliases
4. **WHERE: Filtrando datos** — Operadores de comparacion, BETWEEN, IN, LIKE, IS NULL
5. **Ordenar y paginar** — ORDER BY, LIMIT, OFFSET

### Intermedio

6. **Funciones de agregacion** — COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
7. **JOINs: Conectando tablas** — INNER, LEFT, RIGHT, FULL OUTER, CROSS, Self JOIN
8. **Subconsultas y CTEs** — Subconsultas escalares, correlacionadas, WITH, CTEs recursivas
9. **Funciones y expresiones** — Strings, fechas, CASE WHEN, COALESCE, NULLIF, CAST, STRING_AGG

### Avanzado

10. **Modificando datos** — INSERT, UPDATE, DELETE, ALTER TABLE, DROP TABLE
11. **Rendimiento y optimizacion** — EXPLAIN ANALYZE, indices, estrategias de optimizacion
12. **Analitica con SQL** — Window functions, ROLLUP, CUBE, tablas pivote, patrones de analisis
13. **Metadatos** — information_schema, pg_catalog, exploracion de estructura
14. **Normalizacion** — 1FN, 2FN, 3FN, anomalias, desnormalizacion
15. **Modelo dimensional** — Hechos, dimensiones, star schema, snowflake, SCD
16. **Transacciones** — BEGIN, COMMIT, ROLLBACK, SAVEPOINT, ACID, integridad de datos
17. **Vistas** — CREATE VIEW, vistas materializadas, vistas actualizables
18. **Bases de datos vectoriales** — pgvector, embeddings, busqueda por similitud, indices HNSW/IVFFlat

### Practica y referencia

- **Ejercicios integradores** — 24 ejercicios organizados por nivel (Basico, Intermedio, Avanzado)
- **Errores comunes** — Los errores mas frecuentes y como solucionarlos
- **Cheatsheet** — Referencia rapida de toda la sintaxis del curso

## Base de datos de practica

El curso usa una base de datos llamada `tienda` con 5 tablas:

```
productos (id, nombre, precio, categoria, stock, fecha_creacion)
clientes (id, nombre, email, ciudad, fecha_registro)
pedidos (id, cliente_id, fecha, total, estado)
detalle_pedidos (id, pedido_id, producto_id, cantidad, precio_unitario)
empleados (id, nombre, departamento, salario, fecha_contratacion, jefe_id)
```

El script de inicializacion esta en `db/init.sql`.

## Desarrollo local

### Requisitos

- [Node.js](https://nodejs.org/) 18+
- npm

### Instalacion

```bash
git clone https://github.com/paulovillarroel/curso-sql.git
cd curso-sql
npm install
```

### Comandos

```bash
npm run dev       # Servidor de desarrollo (http://localhost:4321)
npm run build     # Build de produccion
npm run preview   # Preview del build
```

## Stack tecnologico

- [Astro](https://astro.build/) 5 — Framework web
- [MDX](https://mdxjs.com/) — Contenido con componentes
- [Tailwind CSS](https://tailwindcss.com/) v4 — Estilos
- [Expressive Code](https://expressive-code.com/) — Bloques de codigo con syntax highlighting
- GitHub Pages — Hosting

## Parte de Hazla con Datos

Este curso es un recurso complementario de [Hazla con Datos](https://hazlacondatos.com/), una comunidad enfocada en programacion y ciencia de datos en salud.

## Licencia

MIT
