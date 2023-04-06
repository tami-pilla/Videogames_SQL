USE Videogames

SELECT * 
FROM videogames_original

--------------------------------------------------------

ALTER TABLE videogames_original
ALTER COLUMN NA_Sales FLOAT

ALTER TABLE videogames_original
ALTER COLUMN EU_Sales FLOAT

ALTER TABLE videogames_original
ALTER COLUMN JP_Sales FLOAT

ALTER TABLE videogames_original
ALTER COLUMN Other_Sales FLOAT

ALTER TABLE videogames_original
ALTER COLUMN Global_Sales FLOAT

---------------------------------------------------------------

SELECT Rank,
       Name, 
       Platform, 
	   Year, 
	   Genre, 
	   Publisher, 
       NA_Sales*1000000 AS NA_Sales,
       EU_Sales*1000000 AS EU_Sales,
	   JP_Sales*1000000 AS JP_Sales,
	   Other_Sales*1000000 AS Other_Sales,
	   Global_Sales*1000000 AS Global_Sales
INTO videogames
FROM videogames_original

SELECT * FROM videogames

-------------------------------------------------------


--Valores repetidos
SELECT Name, 
       Platform, 
	   Year, 
	   Genre, 
	   Publisher, 
	   NA_Sales,
	   EU_Sales, 
	   JP_Sales, 
	   Other_Sales, 
	   Global_Sales, 
	   COUNT(*) as cantidad_ocurrencias
FROM videogames
GROUP BY Name, 
         Platform, 
		 Year, 
		 Genre, 
		 Publisher, 
		 NA_Sales,
		 EU_Sales, 
		 JP_Sales, 
		 Other_Sales, 
		 Global_Sales
HAVING COUNT(*)>1


--Hay 1 registro repetido que aparece 2 veces
SELECT *
FROM videogames
WHERE Name = 'Wii de Asobu: Metroid Prime'

--Elimino uno de esos registros tomando el Rank
DELETE FROM videogames
WHERE Rank = 15002


---------------------------------------------------------


SELECT DISTINCT Year 
FROM videogames
ORDER BY Year DESC

SELECT *
FROM videogames
WHERE Year IS NULL

--Hay 270 valores nulos
DELETE FROM videogames
WHERE Year IS NULL


---------------------------------------------------------

SELECT DISTINCT Platform 
FROM videogames

SELECT *
FROM videogames
WHERE  Platform  IS NULL 

---------------------------------------------------------

SELECT DISTINCT Genre 
FROM videogames

SELECT *
FROM videogames
WHERE  Genre  IS NULL 

---------------------------------------------------------


--Cantidad de juegos por año
SELECT Distinct Year, 
                COUNT(*) as frecuencia
FROM videogames
GROUP BY Year
ORDER BY frecuencia DESC


--En el 2020 hay solo 1 juego y en 2017 solo 3
--Se eliminan estos registros. 
--Se van a analizar años 1980-2016
DELETE FROM videogames
WHERE Year = 2020;

DELETE FROM videogames
WHERE Year = 2017;

-----------------------------------------------------------------------


---Distribucion de Frecuencias---

--Variables cualitativas

--Name
SELECT DISTINCT
           Name, 
           COUNT(*) as frecuencia,
INTO names
FROM videogames
GROUP BY Name
ORDER BY frecuencia DESC

ALTER TABLE names
ADD porcentaje FLOAT

UPDATE names
SET porcentaje = frecuencia * 100.0/  
                 (SELECT SUM(frecuencia) 
				 FROM names) 


SELECT *
FROM names
ORDER BY frecuencia DESC




--Platform
SELECT DISTINCT
           Platform, 
           COUNT(*) as frecuencia
INTO platform
FROM videogames
GROUP BY Platform 
ORDER BY frecuencia DESC

SELECT *
FROM platform
ORDER BY frecuencia DESC

ALTER TABLE platform
ADD porcentaje FLOAT

UPDATE platform
SET porcentaje = frecuencia * 100.0 /
                (SELECT SUM(frecuencia)
				 FROM platform) 

SELECT *
FROM platform
ORDER BY frecuencia DESC



--Genre
SELECT DISTINCT
           Genre, 
           COUNT(*) as frecuencia
INTO genre
FROM videogames
GROUP BY Genre
ORDER BY frecuencia DESC

SELECT *
FROM genre
ORDER BY frecuencia DESC

ALTER TABLE genre
ADD porcentaje FLOAT

UPDATE genre
SET porcentaje = frecuencia * 100.0 /
                (SELECT SUM(frecuencia)
				 FROM genre) 

SELECT *
FROM genre
ORDER BY frecuencia DESC




--Publisher
SELECT DISTINCT
           Publisher, 
           COUNT(*) as frecuencia
INTO publisher
FROM videogames
GROUP BY Publisher
ORDER BY frecuencia DESC

SELECT *
FROM publisher
ORDER BY frecuencia DESC

ALTER TABLE publisher
ADD porcentaje FLOAT

UPDATE publisher
SET porcentaje = frecuencia * 100.0 /
                (SELECT SUM(frecuencia)
				 FROM publisher) 

SELECT *
FROM publisher
ORDER BY frecuencia DESC

------------------------------------------------------------


--Variables cuantitativas

--Year
SELECT DISTINCT
           Year, 
           COUNT(*) as frecuencia
INTO year
FROM videogames
GROUP BY Year
ORDER BY frecuencia DESC


SELECT *
FROM year
ORDER BY frecuencia DESC

ALTER TABLE year
ADD porcentaje FLOAT

UPDATE year
SET porcentaje = frecuencia * 100.0 /
                (SELECT SUM(frecuencia)
				 FROM year) 

SELECT *
FROM year
ORDER BY frecuencia DESC



--Sales
SELECT NA_Sales,
       EU_Sales,
	   JP_Sales,
	   Other_Sales,
	   Global_Sales
INTO sales
FROM videogames

SELECT * FROM sales

SELECT 
       SUM(NA_Sales) AS total_NA_Sales,
       SUM(EU_Sales) as total_EU_Sales,
	   SUM(JP_Sales) as total_JP_Sales,
	   SUM(Other_Sales) as total_Other_Sales,
	   SUM(Global_Sales) as total_Global_Sales
FROM sales

SELECT AVG(NA_Sales) AS avg_NA_Sales,
       AVG(EU_Sales) as avg_EU_Sales,
	   AVG(JP_Sales) as avg_JP_Sales,
	   AVG(Other_Sales) as avg_Other_Sales,
	   AVG(Global_Sales) as avg_Global_Sales
FROM sales

SELECT MAX(NA_Sales) AS max_NA_Sales,
       MAX(EU_Sales) as max_EU_Sales,
	   MAX(JP_Sales) as max_JP_Sales,
	   MAX(Other_Sales) as max_Other_Sales,
	   MAX(Global_Sales) as max_Global_Sales
FROM sales

SELECT MIN(NA_Sales) AS min_NA_Sales,
       MIN(EU_Sales) as min_EU_Sales,
	   MIN(JP_Sales) as min_JP_Sales,
	   MIN(Other_Sales) as min_Other_Sales,
	   MIN(Global_Sales) as min_Global_Sales
FROM sales


----------------------------------------------------------------------




