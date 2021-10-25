USE TestDB
GO
ALTER PROCEDURE dbo.ImportCSV(
	@Path VARCHAR(MAX),
	@Table VARCHAR(MAX),
	@FormatFilePath VARCHAR(MAX),
	@FirstRow VARCHAR(MAX)
) AS
BEGIN
	DECLARE @Sql VARCHAR(MAX)
	SET @Sql = '
	BULK INSERT ' + @Table + ' FROM '''+@Path+ '''
		WITH (
			FORMATFILE = '''+@FormatFilePath+''',
			FIRSTROW = '+@FirstRow+')'
	PRINT @Sql
	EXEC sp_sqlexec @Sql
END


--BULK INSERT TestDB.dbo.WorkOrderImportFromCSV 
--FROM 'E:\SQLData\Data\WorkOrder.csv'
--WITH (FORMATFILE = 'E:\SQLData\Data\WorkOrder.Fmt',
--	FIRSTROW = 2)
GO
EXEC TestDB.dbo.ImportCSV 'E:\SQLData\Data\WorkOrder.csv','TestDB.dbo.WorkOrderImportFromCSV','E:\SQLData\Data\WorkOrder.Fmt',2

