
USE TP1BD

-- Ejercicio 1
-- Indicar cuales son los titulos y autores de los libros cuyo tipo se "no" y sus precios originales superen los $21

SELECT Titulo , Autor , Tipo , PRECIO_ORI
FROM LIBRO
WHERE TIPO LIKE 'no' AND PRECIO_ORI > $21

-- Ejercicio 2 
-- �Cu�les son los t�tulos y nombres de los autores de los libros cuyo tipo sea �no� o aquellos cuyos precios de origen superan $21?

SELECT Titulo , Autor , Tipo , PRECIO_ORI
FROM LIBRO
WHERE TIPO LIKE 'no' OR PRECIO_ORI > $21

-- Ejercicio 3
-- �Cu�les son los n�meros, precios originales y ediciones de los libros cuyo tipo sea �no� o que sus precios
-- originales superen $21 y las ediciones sean posteriores a 1985?

SELECT NRO_LIBRO , PRECIO_ORI , EDICION , TIPO
FROM LIBRO 
WHERE TIPO LIKE 'no' AND PRECIO_ORI > 21 AND EDICION < 1985

-- Ejercicio 4
-- �Cu�les son los n�meros, precios originales y ediciones de los libros cuyas ediciones son posteriores a 1985 y
-- adem�s o bien el tipo es �no� o el precio original supera $21?

SELECT NRO_LIBRO , PRECIO_ORI , EDICION , TIPO
FROM LIBRO
WHERE  (EDICION > 1985 AND TIPO LIKE 'no') OR PRECIO_ORI > 21  

-- Ejercicio 5
-- Obtener la lista de t�tulos y precios originales de los libros que se editaron en 1948, 1978 y 1985

SELECT TITULO, PRECIO_ORI, Edicion
FROM LIBRO
WHERE EDICION  IN (1984,1978,1985)

-- Ejercicio 6
-- Obtener los t�tulos y ediciones de los libros cuyos precios originales est�n dentro del rango de $12 a $25
-- inclusive

SELECT TITULO, Edicion
FROM LIBRO
WHERE PRECIO_ORI BETWEEN $12 AND $25

-- Ejercicio 7
-- Obtener la lista autores y ediciones de los libros cuyos nombres de autores comiencen con la letra L

SELECT Autor, edicion 
FROM LIBRO
WHERE AUTOR LIKE 'L%'

-- Ejercicio 8
-- Obtener la lista de autores, precios originales y ediciones de los libros cuyos autores tengan la hilera "RR" en
-- alg�n lugar del nombre

SELECT autor , precio_ori , edicion
FROM LIBRO
WHERE AUTOR LIKE '%RR%'

-- Ejercicio 9
-- Obtener la lista de t�tulos, precios originales y ediciones de aquellos libros cuyos t�tulos tengan las letras "R" y
-- "S" en alg�n lugar y en ese orden.

SELECT Titulo, Precio_ori, Edicion
FROM LIBRO
WHERE TITULO LIKE '%R%S%' 

-- Ejercicio 10
-- Obtener la lista de t�tulos, precios originales y ediciones de aquellos libros que tengan la letra "A" en la
-- segunda posici�n del t�tulo. 

SELECT Titulo ,Precio_ori, Edicion
FROM LIBRO 
WHERE TITULO LIKE '_A%'

-- Ejercicio 11
-- Obtener la lista de autores y ediciones de los libros cuyos nombres de autores no comiencen con la letra G.

SELECT Autor , Edicion
FROM LIBRO
WHERE AUTOR NOT LIKE 'G%'

-- Ejercicio 12
-- Obtener la lista de t�tulos y ediciones de aquellos libros cuyos precios originales no est�n comprendidos
-- entre $12 y $25.

SELECT TITULO, Edicion
FROM LIBRO
WHERE NOT PRECIO_ORI  BETWEEN $12 AND $25

-- Ejericicio 13
-- Ordenar en secuencia ascendente por a�o de edici�n los t�tulos de los libros cuyo tipo sea �no�. Listar
-- tambi�n la edici�n.

SELECT Edicion , Titulo , Tipo
FROM LIBRO
ORDER BY Edicion ASC 

-- Ejericico 14
-- Listar los n�meros, ediciones y tipos de libros cuyos precios originales superen los $20. Clasificar por edici�n
-- en forma descendente y por n�mero de libro ascendente en ese orden.

SELECT	NRO_LIBRO, Edicion , Tipo , PRECIO_ORI
FROM LIBRO
WHERE PRECIO_ACT > 20
ORDER BY EDICION DESC , NRO_LIBRO ASC

-- Ejericicio 15
-- Idem anterior pero ordenado por edici�n (ascendente) y n�mero de libro (descendente)

SELECT	NRO_LIBRO, Edicion , Tipo , PRECIO_ORI
FROM LIBRO
WHERE PRECIO_ACT > 20
ORDER BY EDICION ASC , NRO_LIBRO DESC

-- Ejericio 16
-- Obtener todos los tipos y ediciones de los libros.

SELECT Tipo , Edicion
FROM LIBRO

-- Ejercicio 17
-- Idem anterior pero ordenado por Tipo y Edicion ascendente

SELECT Tipo , Edicion
FROM LIBRO 
ORDER BY  TIPO , EDICION ASC

-- Ejercicio 18
-- Obtener todos los tipos y ediciones DISTINTAS(en tipo y Edicion) de los libros, ordenado por Edicion y a�o de edici�n ascendente.
-- Que diferencia se observa entre la Consulta 17 y la 18? Porque?

SELECT DISTINCT Tipo, Edicion
FROM LIBRO
ORDER BY EDICION ASC

-- Ejercicio 19
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias de precios para todos
-- los libros de estudio.

SELECT NRO_LIBRO, Edicion, Tipo, Precio_Ori, Precio_Act, PRECIO_ORI-PRECIO_ACT AS Diferencia
FROM LIBRO

-- Ejercicio 20
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias de precios para todos
-- los libros cuyas diferencias de precio sean superiores a $10.

SELECT NRO_LIBRO, Edicion, Tipo, Precio_Ori, Precio_Act, PRECIO_ACT-PRECIO_ORI AS Diferencia
FROM LIBRO
WHERE (PRECIO_ACT-PRECIO_ORI)>10

-- Ejercicio 21
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias de precios para todos
-- los libros cuyas diferencias de precio sean superiores a $10, clasificado por dicha diferencia en forma descendente.

SELECT NRO_LIBRO, Edicion, Tipo, Precio_Ori, Precio_Act, PRECIO_ACT-PRECIO_ORI AS Diferencia
FROM LIBRO
WHERE (PRECIO_ACT-PRECIO_ORI)>10
ORDER BY Diferencia DESC

-- Ejercicio 22
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias de precios para todos
-- los libros clasificado por tipo y por dicha diferencia en forma ascendente, en ese orden.

SELECT NRO_LIBRO, Edicion, Tipo, Precio_Ori, Precio_Act, PRECIO_ACT-PRECIO_ORI AS Diferencia
FROM LIBRO
ORDER BY Tipo, Diferencia ASC

-- Ejercicio 23
-- Obtener la suma y el promedio de los precios originales y el m�nimo y el m�ximo de los precios actuales
-- para todos los libros cuyo a�o de edici�n sea mayor a 1970

SELECT SUM(Precio_Ori) AS Suma, AVG(Precio_Ori) AS Promedio , MIN(Precio_Act) AS Minimo , MAX(Precio_Act) AS Maximo
FROM LIBRO
WHERE EDICION > 1970

-- Ejercicio 24
-- Obtener de la suma totla de la suma de lo precios originales mas los actuales , el promedio de dicha suma
-- y el m�nimo y el m�ximo de las diferencias de precios para todos los libros cuyo a�o de edici�n sea superior a 1970.

SELECT SUM(Precio_Act) + SUM (Precio_Ori) AS Suma_Total, ((SUM(Precio_Act) + SUM (Precio_Ori))/2) AS Promedio_Suma 
FROM LIBRO
WHERE EDICION  > 1970

-- Ejericicio 25
-- Contar la cantidad de libros, los distintos tipos de libros, el m�nimo y el m�ximo del precio original, pero s�lo
-- para aquellos libros cuyo precio original supere los $30.

SELECT COUNT(NRO_LIBRO) AS Cantidad_Libros , COUNT (DISTINCT Tipo) AS Tipo_Distintos , MIN (Precio_Ori) AS Minimo, MAX(Precio_Ori) AS Maximo
FROM LIBRO
WHERE PRECIO_ORI > 30

-- Ejericicio 26
-- Calcular el promedio y el total de los precios actuales de todos los libros, imprimiendo los t�tulos adicionales
-- "PROMEDIO --->" y "TOTAL --->" en la l�nea de res�men.
DECLARE @PROMEDIO int;
DECLARE @SUMA int;
SELECT @PROMEDIO = AVG(PRECIO_ACT), @SUMA = SUM(PRECIO_ACT) FROM LIBRO;

PRINT 'PROMEDIO---->'+ CAST(@PROMEDIO AS varchar);
PRINT 'SUMA-------->'+ CAST(@SUMA AS varchar);

-- Ejericicio 27
-- Listar los tipos de libros, totales de precios originales y promedios de precios actuales, de aquellos libros
-- que no fueron editados en 1946, resumidos por tipo de libro.

SELECT DISTINCT TIPO As Tipos, SUM(Precio_ori) AS Total_Precio_Ori, AVG(Precio_Act) AS Promedio_Precio_Act
FROM LIBRO
WHERE EDICION NOT IN (1946)
GROUP BY TIPO

-- Ejercicio 28
-- Idem anterior pero clasificado por promedio de precios actuales de menor a mayor.

SELECT DISTINCT TIPO As Tipos, SUM(Precio_ori) AS Total_Precio_Ori, AVG(Precio_Act) AS Promedio_Precio_Act
FROM LIBRO
WHERE EDICION NOT IN (1946)
GROUP BY TIPO 
ORDER BY Promedio_Precio_Act ASC

-- Ejericicio 29
-- Listar los tipos de libros, totales de precios originales, promedios de precios actuales, resumidos por tipo de
-- libro y para los libros cuyas ediciones no sean de 1946, pero s�lo para aquellos tipos de libros cuya sumatoria de precios originales supere $40.

SELECT Tipo, SUM(Precio_Ori) AS Total_Precio_Ori , AVG(Precio_Act) AS Promedio_Precio_Act
FROM LIBRO
WHERE EDICION NOT IN (1946) AND PRECIO_ORI > 40
GROUP BY TIPO
ORDER BY Promedio_Precio_Act ASC

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
WHERE PRECIO_ORI >= ALL(SELECT PRECIO_ORI FROM LIBRO)

-- Ejercicio 35
-- Listar los n�meros, t�tulos y precios originales de aquellos libros cuyos precios originales sean mayores que
-- alguno cualquiera de los precios originales de las novelas.

SELECT NRO_LIBRO, Titulo, Precio_Ori
FROM LIBRO
WHERE PRECIO_ORI > ANY (SELECT PRECIO_ORI FROM LIBRO)

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
--Cu�l es el error que tiene la misma?
-- Cu�l ser�a la sintaxis correcta?


select *
from PRESTAMO
where NRO_COPIA < 5
and 'no' in (select TIPO from LIBRO L
where L.NRO_LIBRO = NRO_LIBRO)