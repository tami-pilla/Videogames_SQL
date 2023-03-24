USE Videogames

SELECT *
FROM videogames


-----------------------------------------------------------


--Ventas por Videojuegouego

-- Los 10 juegos mas vendidos en Norte America
SELECT TOP 5 Name,
              MAX(NA_Sales) AS total_NA_Sales
FROM videogames
GROUP BY Name
ORDER BY total_NA_Sales DESC


-- Los 10 juegos mas vendidos en Europa
SELECT TOP 5 Name,
              MAX(EU_Sales) AS total_EU_Sales
FROM videogames
GROUP BY Name
ORDER BY total_EU_Sales DESC


-- Los 10 juegos mas vendidos en Japon
SELECT TOP 5 Name,
              MAX(JP_Sales) AS total_JP_Sales
FROM videogames
GROUP BY Name
ORDER BY total_JP_Sales DESC


-- Los 10 juegos mas vendidos en el resto del mundo
SELECT TOP 5 Name,
             MAX(Other_Sales) AS total_Other_Sales
FROM videogames
GROUP BY Name
ORDER BY total_Other_Sales DESC


-- Los 10 juegos mas vendidos globlamente entre 1980-2016
SELECT TOP 5 Name,
             MAX(Global_Sales) AS total_Global_Sales
FROM videogames
GROUP BY Name
ORDER BY total_Global_Sales DESC


-- Año de mayor venta de los 10 juegos mas vendidos
SELECT TOP 5 Name,
       MAX(Global_Sales) as total_Global_Sales,
	   Year
FROM videogames
GROUP BY Name, Global_Sales, Year
ORDER BY Global_Sales DESC


-----------------------------------------------------------


--Ventas por Plataforma

--Cantidad de Ventas por Plataforma en Norte America
SELECT Platform,
       SUM(NA_Sales) AS  total_NA_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_NA_Sales DESC


--Cantidad de Ventas por Plataforma en Europa
SELECT Platform,
       SUM(EU_Sales) AS  total_EU_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_EU_Sales DESC


--Cantidad de Ventas por Plataforma en Japon
SELECT Platform,
       SUM(JP_Sales) AS  total_JP_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_JP_Sales DESC


--Cantidad de Ventas por Plataforma en el resto del mundo
SELECT Platform,
       SUM(Other_Sales) AS  total_Other_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_Other_Sales DESC


--Total de Ventas Globales por Plataforma 
SELECT Platform,
       SUM(Global_Sales) AS  total_Global_Sales
FROM videogames
GROUP BY Platform
ORDER BY total_Global_Sales DESC


-----------------------------------------------------------


--Ventas por genero


--Cantidad de Ventas por Genero en Norte America
SELECT Genre,
       SUM(NA_Sales) as total_NA_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_NA_Sales DESC


--Cantidad de Ventas por Genero en Europa
SELECT Genre,
       SUM(EU_Sales) as total_EU_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_EU_Sales DESC


--Cantidad de Ventas por Genero en Japon
SELECT Genre,
       SUM(JP_Sales) as total_JP_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_JP_Sales DESC


--Cantidad de Ventas por Genero en el resto del mundo
SELECT Genre,
       SUM(Other_Sales) as total_Other_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_Other_Sales DESC


--Total de Ventas Globales por Genero 
SELECT Genre,
       SUM(Global_Sales) as total_Global_Sales
FROM videogames
GROUP BY Genre
ORDER BY total_Global_Sales DESC




--Total de Ventas Globales por año
SELECT Year,
       SUM(Global_Sales) as total_Global_Sales
FROM videogames
GROUP BY Year
ORDER BY total_Global_Sales DESC





