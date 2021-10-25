USE TestDB
GO
ALTER PROCEDURE dbo.SelectWorkOrder
(
	@ProductID VARCHAR(MAX),
	@MinOrderQty VARCHAR(MAX)
) AS
BEGIN
DECLARE @sql VARCHAR(MAX) =''
SET @sql = 'SELECT * FROM TestDB.dbo.WorkOrder A WHERE A.OrderQty >= '+@MinOrderQty+'AND LEFT(A.ProductID,2) = '+@ProductID
PRINT @sql
EXEC sp_sqlexec @sql
PRINT 'Select Successfully'
END


--EXEC dbo.SelectWorkOrder 71,10