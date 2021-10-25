USE TestDB
GO
ALTER PROCEDURE dbo.ImportTextFile(
	@Path VARCHAR(MAX),
	@Table VARCHAR(MAX),
	@FieldTerminator VARCHAR(MAX),
	@RowTerminator VARCHAR(MAX),
	@FirstRow VARCHAR(MAX)
) AS
BEGIN
	DECLARE @Sql VARCHAR(MAX)
	SET @Sql = '
	BULK INSERT ' + @Table + ' FROM '''+@Path+ '''
		WITH (
			FIELDTERMINATOR = '''+@FieldTerminator+''',
			FIRSTROW = '+@FirstRow+',ROWTERMINATOR = '''+@RowTerminator+'''
			)'

	PRINT @Sql
	EXEC sp_sqlexec @Sql
END
GO


	--BULK INSERT TestDB.dbo.WorkOrderImportFromTextFile FROM 'E:\SQLData\Data\WorkOrder.txt'
	--	WITH (
	--		FIELDTERMINATOR = ',',
	--		FIRSTROW = 2,
	--		ROWTERMINATOR = '\n'
	--		)

	--Lưu ý: ROWTERMINATOR = '\n' khi kết thúc dòng là xuống dòng

-- EXEC TestDB.dbo.ImportTextFile 'E:\SQLData\Data\WorkOrder.txt','TestDB.dbo.WorkOrderImportFromTextFile',',','\n',2