USE master
GO
sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'Ad Hoc Distributed Queries', 1;
GO
RECONFIGURE; 
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParam', 1

--Điều kiện: phải cài Access database Engine 64 bit
USE TestDB;
GO
TRUNCATE TABLE WorkOrderOpenRowSet
INSERT INTO WorkOrderOpenRowSet
SELECT * FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 8.0; Database=E:\SQLData\Data\WorkOrderOpenRowSet.xlsx', [Sheet1$]);
GO

--SELECT * FROM WorkOrderOpenRowSet