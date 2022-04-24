/****** Script for SelectTopNRows command from SSMS  ******/
USE WideWorldImporters

SELECT salesTerritory, count(StateProvinceName) AS NumberOfStates
FROM Application.StateProvinces
GROUP BY salesTerritory
HAVING count(salesTerritory) = 12
ORDER BY salesTerritory
;



SELECT MAX(LatestRecordedPopulation) AS MaximumPopulation,
		MIN(LatestRecordedPopulation) AS MinimumPopulation,
		AVG(LatestRecordedPopulation) AS AveragePopulation
FROM Application.StateProvinces


--writting subqueries in T-SQL
SELECT * FROM Application.StateProvinces

SELECT StateProvinceID, StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation > 
	(SELECT MAX(LatestRecordedPopulation) FROM Application.StateProvinces )


SELECT StateProvinceID, StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation > 
	(SELECT MIN(LatestRecordedPopulation) FROM Application.StateProvinces)


SELECT StateProvinceID, StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation > 
	(SELECT AVG(LatestRecordedPopulation) FROM Application.StateProvinces)

