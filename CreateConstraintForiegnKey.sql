CREATE DATABASE StudentDB
GO
USE StudentDB
GO 
CREATE TABLE StudentDB.dbo.Class (
	ClassID INT PRIMARY KEY NOT NULL,
	ClassName VARCHAR(32)
)
GO
CREATE TABLE StudentDB.dbo.Student(
	StudentID INT PRIMARY KEY NOT NULL,
	Name VARCHAR(64),
	Address VARCHAR(32),
	ClassID INT,
	CONSTRAINT FK_ClassID FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
)
GO
SELECT * FROM StudentDB.dbo.Class
GO
SELECT * FROM StudentDB.dbo.Student
--Luon phai insert bang Foreign key truoc
INSERT INTO Class VALUES(1,'12A1')
INSERT INTO Class VALUES(2,'12A2')
INSERT INTO Class VALUES(3,'12Y')


--Neu thong tin foreign key khong co trong bang reference bang se bi loi
INSERT INTO Student
VALUES(
1,'PHAM DINH KHANH','HOANG MAI',1
)

INSERT INTO Student
VALUES(
2,'LE THANH CONG','CAU GIAY',3)

INSERT INTO Student
VALUES(
3,'DANG NGHIA HUNG','MINH KHAI',2
)

INSERT INTO Student
VALUES(
4,'NGUYEN DUY TUNG','BA DINH',2
)
