SELECT SellStartDate, 
[0], [1], [2], [3], [4]
FROM
(SELECT SellStartDate,DaysToManufacture, StandardCost 
    FROM AdventureWorks.Production.Product) AS SourceTable
PIVOT
(
AVG(StandardCost)
FOR DaysToManufacture IN ([0], [1], [2], [3], [4])
) AS PivotTable;


