USE Videogames

SELECT *
FROM videogames

-----------------------------------------------------------


--Total de copias de videojuegos vendidas globalmente
SELECT 
      SUM(Global_Sales) as total_Global_Sales
FROM videogames



--Año

--Total de copias vendidas globalmente por año
SELECT Year,
       SUM(Global_Sales) as total_Global_Sales
FROM videogames
GROUP BY Year
ORDER BY Year, total_Global_Sales DESC


--Total de lanzamientos por año
SELECT DISTINCT COUNT(Name) as total_count_videogames,
       Year
FROM videogames
GROUP BY Year
ORDER BY  Year ASC


-----------------------------------------------


-- Videojuegouegos

-- Los 5 juegos con mas copias vendidas en Norte America
SELECT TOP 5 Name,
              MAX(NA_Sales) AS total_NA_Sales
FROM videogames
GROUP BY Name
ORDER BY total_NA_Sales DESC


-- Los 5 juegos con mas copias vendidas en Europa
SELECT TOP 5 Name,
              MAX(EU_Sales) AS total_EU_Sales
FROM videogames
GROUP BY Name
ORDER BY total_EU_Sales DESC


-- Los 5 juegos con mas copias vendidas en Japon
SELECT TOP 5 Name,
              MAX(JP_Sales) AS total_JP_Sales
FROM videogames
GROUP BY Name
ORDER BY total_JP_Sales DESC


-- Los 5 juegos con mas copias vendidas en el resto del mundo
SELECT TOP 5 Name,
             MAX(Other_Sales) AS total_Other_Sales
FROM videogames
GROUP BY Name
ORDER BY total_Other_Sales DESC


-- Los 5 juegos con mas copias vendidas globlamente 
SELECT TOP 5 Name,
             Global_Sales 
FROM videogames
GROUP BY Name, Global_Sales
ORDER BY Global_Sales DESC


-----------------------------------------------------------


-- Plataforma

--Cantidad de copias vendidas por Plataforma en Norte America
SELECT Platform,
       SUM(NA_Sales) AS  total_NA_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_NA_Sales DESC


--Cantidad de copias vendidas por Plataforma en Europa
SELECT Platform,
       SUM(EU_Sales) AS  total_EU_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_EU_Sales DESC


--Cantidad de copias vendidas por Plataforma en Japon
SELECT Platform,
       SUM(JP_Sales) AS  total_JP_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_JP_Sales DESC


--Cantidad de copias vendidas por Plataforma en el resto del mundo
SELECT Platform,
       SUM(Other_Sales) AS  total_Other_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_Other_Sales DESC


--Total de copias vendidas Globales por Plataforma 
SELECT Platform,
       SUM(Global_Sales) AS  total_Global_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_Global_Sales DESC



-----------------------------------------------------------


--Genero

--Cantidad de copias vendidas por Genero en Norte America
SELECT Genre,
       SUM(NA_Sales) as total_NA_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_NA_Sales DESC


--Cantidad de copias vendidas por Genero en Europa
SELECT Genre,
       SUM(EU_Sales) as total_EU_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_EU_Sales DESC


--Cantidad de copias vendidass por Genero en Japon
SELECT Genre,
       SUM(JP_Sales) as total_JP_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_JP_Sales DESC


--Cantidad de copias vendidas por Genero en el resto del mundo
SELECT Genre,
       SUM(Other_Sales) as total_Other_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_Other_Sales DESC


--Cantidad de copias vendidas por Genero 
SELECT Genre,
       SUM(Global_Sales) as total_Global_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_Global_Sales DESC


-----------------------------------------------------------


-- Editorial

--Cantidad de copias vendidas por Editorial en Norte America
SELECT Publisher,
       SUM(NA_Sales) as total_NA_Sales
FROM videogames
GROUP BY Publisher
ORDER BY total_NA_Sales DESC


--Cantidad de copias vendidas por Editorial en Europa
SELECT Publisher,
       SUM(EU_Sales) as total_EU_Sales
FROM videogames
GROUP BY Publisher
ORDER BY total_EU_Sales DESC


--Cantidad de copias vendidass por Editorial en Japon
SELECT Publisher,
       SUM(JP_Sales) as total_JP_Sales
FROM videogames
GROUP BY Publisher
ORDER BY total_JP_Sales DESC

--Cantidad de copias vendidas por Editorial en el resto del mundo
SELECT Publisher,
       SUM(Other_Sales) as total_Other_Sales
FROM videogames
GROUP BY Publisher
ORDER BY total_Other_Sales DESC


--Cantidad de copias vendidas por Editorial globalmente
SELECT Publisher,
       SUM(Global_Sales) as total_Global_Sales
FROM videogames
GROUP BY Publisher
ORDER BY total_Global_Sales DESC



--------------------------------------------------------------------


--Búsquedas específicas:

SELECT 
      SUM(Global_Sales) as total_Global_Sales
FROM videogames
WHERE Genre = 'Action'


SELECT 
      SUM(NA_Sales) as total_NA_Sales
FROM videogames
WHERE Platform = 'Wii'


SELECT 
      SUM(Global_Sales) as total_Global_Sales
FROM videogames
WHERE Publisher = 'Nintendo'
      AND Genre = 'Sports'


SELECT 
      SUM(EU_Sales) as total_EU_Sales
FROM videogames
WHERE Year BETWEEN 1990 AND 1995


SELECT Name,
       Global_Sales
FROM videogames
WHERE Global_Sales > 20000000


SELECT Name,
       Year,
       NA_Sales
FROM videogames
WHERE Name = 'Tetris' AND 
      NA_Sales BETWEEN 1000000 AND 35000000



