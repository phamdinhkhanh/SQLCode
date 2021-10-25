--Dieu kien backup
--1.Database de o che do RECOVERY MODE la full
--2.Database da tung duoc full backup
--3.Log file chua tung bi SHRINK
--Tao Database
USE master
GO
IF DB_ID('TestDB') IS NOT NULL DROP DATABASE TestDB
GO 
CREATE DATABASE TestDB
GO
USE TestDB
GO
CREATE TABLE dbo.Table1(
	ID INT IDENTITY,
	TEN VARCHAR(32)
)
GO
INSERT INTO dbo.Table1(TEN)
SELECT A = 'Nguyen Van A' UNION ALL
SELECT B = 'Nguyen Van B' UNION ALL
SELECT C = 'Nguyen Van C'
GO
--full backup
BACKUP DATABASE TestDB TO DISK = 'E:\SQLData\Backup\TestDB.bak' WITH INIT
--2017-08-02 14:54:50.807
--Them du lieu moi sau khi full back up (can duoc thuc hien dinh ki cuoi tuan)
INSERT INTO dbo.Table1(TEN)
SELECT 'Nguyen Van D' UNION ALL
SELECT 'Nguyen Van E'
--differental backup (chi backup du lieu sau thoi diem full backup) (thuc hien vao 1 ngay trong tuan)
BACKUP DATABASE TestDB TO DISK = 'E:\SQLData\Backup\TestDB_Diff.bak' WITH DIFFERENTIAL
--Mo phong tinh huong database da duoc full backup ngay hom truoc, them moi du lieu ngay hom sau va bi xoa
DELETE FROM dbo.Table1
--Dong Database de khong cho ai co the truy cap du lieu den khi Database duoc khoi phuc xong. Chuyen sang che do 1 nguoi dung
--SINGLE_USER
ALTER DATABASE TestDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE
--Ghi lai thoi diem xay ra su co
SELECT GETDATE()
--2017-08-02 15:16:05.323
--Khoi phuc lai DB theo thu tu ban backup truoc roi den ban Log backup:
USE master
GO
RESTORE DATABASE TestDB FROM DISK = 'E:\SQLData\Backup\TestDB.bak' WITH NORECOVERY
RESTORE DATABASE TestDB FROM DISK = 'E:\SQLData\Backup\TestDB.trn' WITH STOPAT = '2017-08-02 15:16:05'

USE TestDB
SELECT * FROM dbo.Table1

--Chuyen Database ve che do nhieu nguoi dung
ALTER DATABASE TestDB SET MULTI_USER





