USE TP1BD
-- Ejercicio 30
-- Obtener los cinco primeros caracteres de los nombres de todos los lectores de libros

SELECT SUBSTRING(nombre,1,5)
FROM LECTOR

-- Ejercicio 31
-- Listar los nombres y la dirección de los lectores que tienen libros a préstamo (usar subconsultas)

SELECT NOMBRE,DIRECCION 
FROM LECTOR
WHERE NRO_LECTOR IN (SELECT NRO_LECTOR FROM PRESTAMO)
-- Ejercicio 32
-- Listar el número, título y precio original de aquellos libros cuyos precios originales sean más altos que el
-- promedio de precios actuales de todos los libros.

SELECT NRO_LIBRO, Titulo, Precio_Ori
FROM LIBRO
WHERE PRECIO_ORI>(SELECT AVG(PRECIO_ACT)FROM LIBRO)

-- Ejercicio 33
-- Listar el número, título y precio actual del libro que tenga el máximo precio original.

SELECT NRO_LIBRO, Titulo, Precio_Act
FROM LIBRO
WHERE PRECIO_ORI = (SELECT MAX(PRECIO_ORI)FROM LIBRO)

-- Ejercicio 34
-- Listar los números, títulos y precios originales de aquellos libros cuyos precios originales sean mayores que
-- todos y cada uno de los precios originales de las novelas.

SELECT NRO_LIBRO, Titulo, Precio_Ori
FROM LIBRO
WHERE PRECIO_ORI > ALL(SELECT PRECIO_ORI FROM LIBRO WHERE TIPO ='no')

-- Ejercicio 35
-- Listar los números, títulos y precios originales de aquellos libros cuyos precios originales sean mayores que
-- alguno cualquiera de los precios originales de las novelas.

SELECT NRO_LIBRO, Titulo, Precio_Ori
FROM LIBRO
WHERE PRECIO_ORI > ANY (SELECT PRECIO_ORI FROM LIBRO WHERE TIPO = 'no')

-- Ejercicio 36
-- Listar los tipos de libros y promedios de precios originales agrupados por tipos, para aquellos tipos que
-- tengan el promedio de sus precios originales por arriba del promedio de precios originales de todos los libros.

SELECT DISTINCT TIPO, AVG(Precio_Ori) AS Promedio
FROM LIBRO
GROUP BY Tipo

-- Ejercicio 37
-- Hay error de Sintaxis en el siguiente SQL?, SI
/*Select * from
(select nro_libro, titulo
from Libro)*/

-- Ejericicio 38
-- Listar los Nombres de los Lectores y los Autores de los Libros, ordenados de manera Ascendente, indicar
-- además un campo en el que se identifique si el ‘Autor’ o ‘Lector’

SELECT 'LECTOR' AS Tipo,Nombre 
FROM LECTOR
GROUP BY NOMBRE UNION SELECT 'AUTOR' AS Tipo, Autor FROM LIBRO GROUP BY Autor ORDER BY 1,2

-- Ejercicio 39
-- Listar el Titulo, fecha de Préstamo y la fecha de Devolución de los Libros prestados

SELECT LIBRO.TITULO , PRESTAMO.F_PREST , PRESTAMO.F_DEVOL
FROM LIBRO INNER JOIN PRESTAMO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO

-- Ejercicio 40
-- Listar el Nro de Libro, Titulo, fecha de Préstamo y la fecha de Devolución de los Libros prestados

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO , PRESTAMO.F_PREST , PRESTAMO.F_DEVOL
FROM LIBRO INNER JOIN PRESTAMO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO

-- Ejercicio 41
-- Listar el número de lector, su nombre y la cantidad de préstamos realizados a ese lector.

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE , COUNT (PRESTAMO.NRO_LECTOR) AS Cantidad
FROM LECTOR LEFT JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR GROUP BY LECTOR.NRO_LECTOR,LECTOR.NOMBRE

-- Ejercicio 42
-- Listar el número de libro, el título, y la cantidad de préstamos realizados para ese libro a partir del año 2012

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO , COUNT(PRESTAMO.NRO_LIBRO) AS Cantidad
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO GROUP BY LIBRO.NRO_LIBRO,LIBRO.TITULO

-- Ejercicio 43
-- Listar el número de libro, el título, el número de copia, y la cantidad de préstamos realizados para cada
-- copia de cada libro.

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA , COUNT(PRESTAMO.NRO_LIBRO) AS Cantidad
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO GROUP BY LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA

-- Ejercicio 44
-- Listar el número de libro, el título, el número de copia, y la cantidad de préstamos realizados para cada
-- copia de cada libro, pero sólo para aquellas copias que se hayan prestado más de 1 vez.

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA , COUNT (PRESTAMO.NRO_LIBRO) AS Cantidad
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO GROUP BY LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA HAVING COUNT(PRESTAMO.NRO_COPIA) > 1

-- Ejercicio 45
-- Obtener la lista de los títulos de los libros prestados y los nombres de los lectores que los tienen en préstamo

SELECT Titulo, nombre
FROM LIBRO INNER JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO  INNER JOIN LECTOR ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR

-- Ejercicio 46
-- Listar el Nro de Lector, Nombre y fecha de Préstamo de aquellos Lectores que hayan realizado un préstamo
-- y no lo hayan devuelto

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.F_DEVOL
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR 
WHERE PRESTAMO.F_DEVOL IS NULL

-- Ejercicio 47
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de préstamo que aquellos Prestamos que hayan sido devueltos

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.NRO_LIBRO, TITULO, PRESTAMO.F_PREST
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR AND PRESTAMO.F_PREST IS NOT NULL INNER JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO 

-- Ejercicio 48
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de préstamo que aquellos Prestamos que hayan
-- sido devueltos y el tipo de Libro sea Novela o Cuentos

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.NRO_LIBRO, TITULO, LIBRO.TIPO, PRESTAMO.F_PREST
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR AND PRESTAMO.F_PREST IS NOT NULL INNER JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO WHERE LIBRO.TIPO LIKE  'no'

-- Ejercicio 49
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, Descripción del Tipo de Libro , fecha de préstamo que
-- aquellos Prestamos que hayan sido devueltos y el tipo de Libro sea Novela o Cuentos

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.NRO_LIBRO, TITULO, LIBRO.TIPO, PRESTAMO.F_PREST
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR AND PRESTAMO.F_PREST IS NOT NULL INNER JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO WHERE LIBRO.TIPO IN ('no','cu')

-- Ejercicio 50
-- Listar el Nro de Lector, Nombre y fecha de Préstamo de Todos los Lectores, hayan tenido Prestamos o no

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.F_PREST
FROM LECTOR LEFT JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR

-- Ejercicio 51
-- Listar el Nro de Libro, Titulo, nro de Copia y Fecha de Préstamo, de todas las Copias, hayan sido prestadas o no

SELECT LIBRO.NRO_LIBRO, TITULO, PRESTAMO.NRO_COPIA, PRESTAMO.F_PREST
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO

-- Ejercicio 52
-- Realizar una sentencia SQL que involucre TODOS los campos de TODAS las tablas. Es esto posible?

SELECT * 
FROM COPIAS,LECTOR,LIBRO,PRESTAMO,TIPOLIBRO

-- Ejercicio 53
-- Cuál es el objetivo de la siguiente sentencia SQL?
-- Cuál es el error que tiene la misma?
-- Cuál sería la sintaxis correcta?


select *
from PRESTAMO
where NRO_COPIA < 5
and 'no' in (select TIPO from LIBRO L
where L.NRO_LIBRO = NRO_LIBRO)