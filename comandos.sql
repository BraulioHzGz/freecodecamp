-- Acceder a la consola de postgres:
psql --username=<user> --dbname=<motor>;

-- Listar bases de datos
\l

-- Conectarse a una base de datos
\c <database_name>

-- Mostrar tablas y ciertos contenidos
\d
\d <tabla>

-- Crear tabla nueva
CREATE TABLE <table_name>();

-- Tipos de datos:
-- VARHCAR(N): dato de tipo string con una cantidad máxima de N caracteres
-- SERIAL: crea una columna INT, NOT NULL y con un AUTO_INCREMENT
-- INT: dato de tipo entero
-- NUMERIC(N, M): crea un dato que permite llegar hasta N dígitos y M digitos tienen que estar después del punto (decimal -> N.M)

-- Renombrar columna:
ALTER TABLE <table> RENAME <columna> TO <nuevo_nombre>;

-- Agregar llave primaria
ALTER TABLE <table> ADD PRIMARY KEY(<columna>);
ALTER TABLE <table> ADD PRIMARY KEY(<columna1>, <columna2>);  -- Llave primaria compuesta

-- Agregar UNIQUE
ALTER TABLE <table> ADD UNIQUE(<columna>);


-- Hacer un dump (respaldo)
pd_gump --clean --create --inserts --username=<user> <nombre de la base> > <archivo>.sql
-- El <user> es quien va a tener acceso a la base y al script -> Solo lo hace en el dump y ahí se ve

-- Llamar a un respaldo
psql -U <base de origen> < <archivo>.sql
-- Ejemplo: psql -U postgres < students.sql		:	Importar el respaldo students.sql a la base postgres

-- Búsquedas usando LIKE 
-- Condición %:  busca un patrón sin importar lo que siga despues:  %a -> busca <algo>a   ;  %M% -> busca <algo>M<algo>
-- Condición _:  busca lo que coindica con el espacio faltante
-- ILIKE: ignora mayúsculas y minúsculas, como si fuera lo mismo
SELECT * FROM <tabla> WHERE <columna> LIKE <condicion>;
SELECT * FROM <tabla> WHERE <columna> NOT LIKE <condicion>;
SELECT * FROM <tabla> WHERE <columna> ILIKE <condicion>;
SELECT * FROM <tabla> WHERE <columna> NOT ILIKE <condicion>;

-- Búsquedas usando IS NULL
SELECT * FROM <tabla> WHERE <columna> IS NULL;
SELECT * FROM <tabla> WHERE <columna> IS NOT NULL;

-- Actualizar columnas
UPDATE <tabla> SET <columna> = <valor>;
UPDATE <tabla> SET <columna> = <valor> WHERE <condicion>;

-- Operaciones
SELECT * FROM <tabla> ORDER BY <columna>  -- Default: ASC
SELECT * FROM <tabla> ORDER BY <columna> DESC;
SELECT * FROM <tabla> ORDER BY <columna> LIMIT <n>;
SELECT MIN(columna) FROM <tabla>;	-- Valor mínimo
SELECT MAX(columna) FROM <tabla>;	-- Valor máximo
SELECT SUM(columna) FROM <tabla>;	-- Suma total
SELECT AVG(columna) FROM <tabla>;	-- Promedio
SELECT CEIL(columna) FROM <tabla>;	-- Función piso
SELECT ROUND(columna) FROM <tabla>;	-- Redondeo
SELECT ROUND(columna, N) FROM <tabla>;	-- Redondeo a N decimales
SELECT DISTINCT(columna) FROM <tabla>;	-- Trae los uniques o distintos
SELECT COUNT(<condicion>) FROM <tabla>;	-- Cuenta datos de una columna o todo si se usa *
SELECT <columna> FROM <tabla> GROUP BY <columna>;	-- Agrupa
	-- DISTINTC Y GROUP BY hacen lo mismo, pero GROUP BY permite añadir MIN, MAX, COUNT, etc
	-- SELECT major_id, COUNT(*) FROM students GROUP BY major_id		->		Obtenemos los major_id y el total de alumnos
SELECT <columna> FROM <tabla> GROUP BY <columna> HAVING <condicion>		-- Mayor poder de búsqueda en el GROUP BY
SELECT <columna> AS <nombre> FROM <tabla> GROUP BY <columna> HAVING <condicion>		-- Renombrar una columna	


-- Un JOIN se hace cuando dos tablas comparten una llave, una tabla la usa como primaria y otra tabla como foránea
FULL JOIN 	-- Obtiene todos los datos de ambas tablas sin importar si la fk es nula
LEFT JOIN 	-- Obtiene todas las filas de la tabla izquierda, pero solo las vinculadas de la tabla derecha que están vinculadas desde la izquierda
RIGHT JOIN 	-- Obtiene todas las filas de la tabla derecha, pero solo las vinculadas de la tabla izquierda que están vinculadas desde la derecha
INNER JOIN	-- Solo devuelve las filas en común que tengan relación válida entre ambas tablas, que no posean NULL
