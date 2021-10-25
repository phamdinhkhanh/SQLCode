--Tao database va file group
CREATE DATABASE PartTest
GO
USE PartTest
GO
--Tao filegroup
ALTER DATABASE PartTest ADD FILEGROUP FG1
ALTER DATABASE PartTest ADD FILEGROUP FG2
ALTER DATABASE PartTest ADD FILEGROUP FG3

--Them data vao moi File group
ALTER DATABASE PartTest ADD FILE (NAME = N'FG1', FILENAME = N'E:\SQLData\Data\PartTest\FY2015.ndf') TO FILEGROUP FG1
ALTER DATABASE PartTest ADD FILE (NAME = N'FG2', FILENAME = N'E:\SQLData\Data\PartTest\FY2016.ndf') TO FILEGROUP FG2
ALTER DATABASE PartTest ADD FILE (NAME = N'FG3', FILENAME = N'E:\SQLData\Data\PartTest\FY2017.ndf') TO FILEGROUP FG3


--Tao partition function va partition scheme
USE PartTest
GO
CREATE PARTITION FUNCTION PFunction(DATETIME) AS RANGE RIGHT FOR VALUES ('2016-01-01','2017-01-01')
GO
CREATE PARTITION SCHEME PScheme_NGD AS PARTITION PFunction to (FG1,FG2,FG3)
--Ham PFunction se cat cac doan vao tung file group (o day co 2 doan va 3 khoang)
--khoang 1: < 2016-01-01
--khoang 2: tu 2016-01-01 den 2016-12-31
--khoang 3: > 2017-01-01
--Ham PScheme_NGD dung de dinh cac doan vao tung file group

--Tao bang dung partition scheme
USE PartTest
GO
CREATE TABLE dbo.Dt(
	Dt DATETIME
) ON PScheme_NGD(Dt)
GO
CREATE CLUSTERED INDEX CI_Dt on dbo.Dt(Dt) ON PScheme_NGD(Dt)
--Kiem tra phan doan du lieu
SELECT $PARTITION.PFunction('2017-03-31')
SELECT $PARTITION.PFunction('2016-03-31')
SELECT $PARTITION.PFunction('2015-03-31')

--Lua chon partition 3
SET STATISTICS TIME ON
SELECT * FROM Dt WHERE $PARTITION.PFunction(Dt) = 3
SET STATISTICS TIME OFF


SET STATISTICS TIME ON
SELECT * FROM Dt 
SET STATISTICS TIME OFF


--Khi rebuild index chi can rebuild cho mot doan
ALTER INDEX CI_Dt
ON dbo.Dt
Rebuild PARTITION = 3


