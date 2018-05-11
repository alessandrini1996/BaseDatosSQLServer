-- Ejercicio 2
-- ¿Cuáles son los títulos y nombres de los autores de los libros cuyo tipo sea ‘no’ o aquellos cuyos precios de
-- origen superan $21?

SELECT Titulo , Autor , Tipo , PRECIO_ORI
FROM LIBRO
WHERE TIPO LIKE 'no' OR PRECIO_ORI > $21


SELECT * FROM LIBRO
