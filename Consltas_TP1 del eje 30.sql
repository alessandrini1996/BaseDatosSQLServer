USE TP1BD
-- Ejercicio 30
-- Obtener los cinco primeros caracteres de los nombres de todos los lectores de libros

SELECT SUBSTRING(nombre,1,5)
FROM LECTOR

-- Ejercicio 31
-- Listar los nombres y la direcci�n de los lectores que tienen libros a pr�stamo (usar subconsultas)

SELECT NOMBRE,DIRECCION 
FROM LECTOR
WHERE NRO_LECTOR IN (SELECT NRO_LECTOR FROM PRESTAMO)
-- Ejercicio 32
-- Listar el n�mero, t�tulo y precio original de aquellos libros cuyos precios originales sean m�s altos que el
-- promedio de precios actuales de todos los libros.

SELECT NRO_LIBRO, Titulo, Precio_Ori
FROM LIBRO
WHERE PRECIO_ORI>(SELECT AVG(PRECIO_ACT)FROM LIBRO)

-- Ejercicio 33
-- Listar el n�mero, t�tulo y precio actual del libro que tenga el m�ximo precio original.

SELECT NRO_LIBRO, Titulo, Precio_Act
FROM LIBRO
WHERE PRECIO_ORI = (SELECT MAX(PRECIO_ORI)FROM LIBRO)

-- Ejercicio 34
-- Listar los n�meros, t�tulos y precios originales de aquellos libros cuyos precios originales sean mayores que
-- todos y cada uno de los precios originales de las novelas.

SELECT NRO_LIBRO, Titulo, Precio_Ori
FROM LIBRO
WHERE PRECIO_ORI > ALL(SELECT PRECIO_ORI FROM LIBRO WHERE TIPO ='no')

-- Ejercicio 35
-- Listar los n�meros, t�tulos y precios originales de aquellos libros cuyos precios originales sean mayores que
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
-- adem�s un campo en el que se identifique si el �Autor� o �Lector�

SELECT 'LECTOR' AS Tipo,Nombre 
FROM LECTOR
GROUP BY NOMBRE UNION SELECT 'AUTOR' AS Tipo, Autor FROM LIBRO GROUP BY Autor ORDER BY 1,2

-- Ejercicio 39
-- Listar el Titulo, fecha de Pr�stamo y la fecha de Devoluci�n de los Libros prestados

SELECT LIBRO.TITULO , PRESTAMO.F_PREST , PRESTAMO.F_DEVOL
FROM LIBRO INNER JOIN PRESTAMO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO

-- Ejercicio 40
-- Listar el Nro de Libro, Titulo, fecha de Pr�stamo y la fecha de Devoluci�n de los Libros prestados

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO , PRESTAMO.F_PREST , PRESTAMO.F_DEVOL
FROM LIBRO INNER JOIN PRESTAMO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO

-- Ejercicio 41
-- Listar el n�mero de lector, su nombre y la cantidad de pr�stamos realizados a ese lector.

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE , COUNT (PRESTAMO.NRO_LECTOR) AS Cantidad
FROM LECTOR LEFT JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR GROUP BY LECTOR.NRO_LECTOR,LECTOR.NOMBRE

-- Ejercicio 42
-- Listar el n�mero de libro, el t�tulo, y la cantidad de pr�stamos realizados para ese libro a partir del a�o 2012

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO , COUNT(PRESTAMO.NRO_LIBRO) AS Cantidad
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO GROUP BY LIBRO.NRO_LIBRO,LIBRO.TITULO

-- Ejercicio 43
-- Listar el n�mero de libro, el t�tulo, el n�mero de copia, y la cantidad de pr�stamos realizados para cada
-- copia de cada libro.

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA , COUNT(PRESTAMO.NRO_LIBRO) AS Cantidad
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO GROUP BY LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA

-- Ejercicio 44
-- Listar el n�mero de libro, el t�tulo, el n�mero de copia, y la cantidad de pr�stamos realizados para cada
-- copia de cada libro, pero s�lo para aquellas copias que se hayan prestado m�s de 1 vez.

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA , COUNT (PRESTAMO.NRO_LIBRO) AS Cantidad
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO GROUP BY LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.NRO_COPIA HAVING COUNT(PRESTAMO.NRO_COPIA) > 1

-- Ejercicio 45
-- Obtener la lista de los t�tulos de los libros prestados y los nombres de los lectores que los tienen en pr�stamo

SELECT Titulo, nombre
FROM LIBRO INNER JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO  INNER JOIN LECTOR ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR

-- Ejercicio 46
-- Listar el Nro de Lector, Nombre y fecha de Pr�stamo de aquellos Lectores que hayan realizado un pr�stamo
-- y no lo hayan devuelto

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.F_DEVOL
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR 
WHERE PRESTAMO.F_DEVOL IS NULL

-- Ejercicio 47
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de pr�stamo que aquellos Prestamos que hayan sido devueltos

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.NRO_LIBRO, TITULO, PRESTAMO.F_PREST
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR AND PRESTAMO.F_PREST IS NOT NULL INNER JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO 

-- Ejercicio 48
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de pr�stamo que aquellos Prestamos que hayan
-- sido devueltos y el tipo de Libro sea Novela o Cuentos

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.NRO_LIBRO, TITULO, LIBRO.TIPO, PRESTAMO.F_PREST
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR AND PRESTAMO.F_PREST IS NOT NULL INNER JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO WHERE LIBRO.TIPO LIKE  'no'

-- Ejercicio 49
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, Descripci�n del Tipo de Libro , fecha de pr�stamo que
-- aquellos Prestamos que hayan sido devueltos y el tipo de Libro sea Novela o Cuentos

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.NRO_LIBRO, TITULO, LIBRO.TIPO, PRESTAMO.F_PREST
FROM LECTOR INNER JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR AND PRESTAMO.F_PREST IS NOT NULL INNER JOIN LIBRO ON PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO WHERE LIBRO.TIPO IN ('no','cu')

-- Ejercicio 50
-- Listar el Nro de Lector, Nombre y fecha de Pr�stamo de Todos los Lectores, hayan tenido Prestamos o no

SELECT LECTOR.NRO_LECTOR, NOMBRE, PRESTAMO.F_PREST
FROM LECTOR LEFT JOIN PRESTAMO ON LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR

-- Ejercicio 51
-- Listar el Nro de Libro, Titulo, nro de Copia y Fecha de Pr�stamo, de todas las Copias, hayan sido prestadas o no

SELECT LIBRO.NRO_LIBRO, TITULO, PRESTAMO.NRO_COPIA, PRESTAMO.F_PREST
FROM LIBRO LEFT JOIN PRESTAMO ON LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO

-- Ejercicio 52
-- Realizar una sentencia SQL que involucre TODOS los campos de TODAS las tablas. Es esto posible?

SELECT * 
FROM COPIAS,LECTOR,LIBRO,PRESTAMO,TIPOLIBRO

-- Ejercicio 53
-- Cu�l es el objetivo de la siguiente sentencia SQL?
-- Cu�l es el error que tiene la misma?
-- Cu�l ser�a la sintaxis correcta?


select *
from PRESTAMO
where NRO_COPIA < 5
and 'no' in (select TIPO from LIBRO L
where L.NRO_LIBRO = NRO_LIBRO)