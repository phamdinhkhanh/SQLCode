USE TestDB
GO
--DROP FUNCTION dbo.AverageOrder
CREATE FUNCTION dbo.AverageOrder(
	@ProductID VARCHAR(32),
	@MinOrderQty INT
) 
RETURNS @OrderTable TABLE (
	ProductID VARCHAR(32),
	AverageOrderQty INT
)
AS 
BEGIN
	WITH A AS (
		SELECT ProductID,AVG(OrderQty) AverageOrderQty FROM TestDB.dbo.WorkOrder
		WHERE ProductID = @ProductID AND OrderQty >= @MinOrderQty
		GROUP BY ProductID
	)
	INSERT INTO @OrderTable
	SELECT * FROM A
	RETURN
END

