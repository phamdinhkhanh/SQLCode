CREATE DATABASE SwitchOut
GO
--Tao cac file group
ALTER DATABASE SwitchOut ADD FILEGROUP FG1
ALTER DATABASE SwitchOut ADD FILEGROUP FG2
ALTER DATABASE SwitchOut ADD FILEGROUP FG3
ALTER DATABASE SwitchOut ADD FILEGROUP FG4
--Them data vao moi file group
ALTER DATABASE SwitchOut ADD FILE (NAME = 'F1', FILENAME = 'E:\SQLData\Data\SwitchOut\SwitchOut_F1.ndf') TO FILEGROUP FG1
ALTER DATABASE SwitchOut ADD FILE (NAME = 'F2', FILENAME = 'E:\SQLData\Data\SwitchOut\SwitchOut_F2.ndf') TO FILEGROUP FG2
ALTER DATABASE SwitchOut ADD FILE (NAME = 'F3', FILENAME = 'E:\SQLData\Data\SwitchOut\SwitchOut_F3.ndf') TO FILEGROUP FG3
ALTER DATABASE SwitchOut ADD FILE (NAME = 'F4', FILENAME = 'E:\SQLData\Data\SwitchOut\SwitchOut_F4.ndf') TO FILEGROUP FG4
GO

USE SwitchOut
GO
--tao Partition Function (Range left se lay max la cut point, min la cut point lien truoc +1)
CREATE PARTITION FUNCTION PF_SwitchOut(INT) AS RANGE RIGHT FOR VALUES (1000,2000,3000)
--tao Partition Scheme
CREATE PARTITION SCHEME PS_SwitchOut AS PARTITION PF_SwitchOut TO (FG1,FG2,FG3,FG4)
--tao bang se partition du lieu theo ID vao cac file group
CREATE TABLE MyPartTable
(
	ID INT IDENTITY PRIMARY KEY,
	MyData VARCHAR(100)
) ON PS_SwitchOut(ID)

--chen them du lieu vao bang
DECLARE @ID TABLE (ID int)
DECLARE @StartId int
DECLARE @EndId int

SET @StartId = 1
SET @EndId = 10000

WHILE(@StartId <= @EndId)
BEGIN
	INSERT INTO @ID
	SELECT @StartId
	SET @StartId = @StartId + 1
END

INSERT INTO MyPartTable(MyData)
SELECT * FROM @ID


--Chuyen du lieu tu 1 bang sang 1 bang khac ngay tuc thi
--Tao bang tam
CREATE TABLE dbo.Tbl_1000 (
	ID INT IDENTITY PRIMARY KEY,
	MyData VARCHAR(100)
) ON FG1 
GO
--Switch out toi Tbl_1000
ALTER TABLE MyPartTable SWITCH PARTITION 1 TO Tbl_1000
--Kiem tra ket qua
SELECT * FROM MyPartTable
SELECT * FROM Tbl_1000
--nhu vay du lieu da duoc cat vao Tbl_1000



