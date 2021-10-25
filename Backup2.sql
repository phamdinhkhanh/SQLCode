--Create new table in database TestDB
USE TestDB
GO
CREATE TABLE TestTable
(
	ID INT IDENTITY PRIMARY KEY,
	TESTNAME VARCHAR(32)
)
GO
INSERT INTO TestTable
VALUES ('FIRST TEST')

--Create full back up for TestDB
BACKUP DATABASE TestDB TO DISK = 'E:\SQLData\Backup\TestDB.bak' WITH INIT

--Create back up differential for TestDB
BACKUP DATABASE TestDB TO DISK = 'E:\SQLData\Backup\TestDB_Diff.bak' WITH DIFFERENTIAL

--Restore database to NewBackUp database
USE master
GO
RESTORE DATABASE NewBackUp FROM DISK = 'E:\SQLData\Backup\TestDB.bak' WITH REPLACE

