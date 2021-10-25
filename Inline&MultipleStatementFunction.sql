--Ham kieu bang tra ve 1 bang 
--dang 1:in-line: chi co duy nhat mot cau lenh select duoc gui toi Server
USE AdventureWorks
GO
CREATE FUNCTION dbo.fn_ProductInfoByModelId(@p INT) 
RETURNS TABLE AS
RETURN
		SELECT P.ProductID, P.Name, P.ProductNumber
		FROM Production.Product P
		WHERE P.ProductModelID = @p
GO
--goi ham truc tiep
SELECT * FROM dbo.fn_ProductInfoByModelId(5)

--dang 2:multiple-statement nhieu hon 1 lenh duoc gui toi server
CREATE FUNCTION dbo.fnCSVStr2Table(@CSVStr VARCHAR(8000))
RETURNS @Tbl TABLE(ValueColumn VARCHAR(1000))
AS
BEGIN 
	DECLARE @SubStr VARCHAR(100)
	DECLARE @i INT
	SET @i = CHARINDEX(',',@CSVStr, 0)
	WHILE @i > 0
	BEGIN
		SET @SubStr = LTRIM(RTRIM(LEFT(@CSVStr,@i-1)))
		INSERT INTO @Tbl
		SELECT @SubStr
		SET @CSVStr = SUBSTRING(@CSVStr, @i+1,8000)
		SET @i = CHARINDEX(',',@CSVStr,0)
	END
	--khi khong tim thay dau phay tri se co @i = 0, insert phan substring duoc luu trong @CSVStr
	INSERT INTO @Tbl
	SELECT LTRIM(RTRIM(@CSVStr))
	RETURN
END


SELECT * FROM fnCSVStr2Table('HANOI, HAIPHONG, THANH HOA')

--Ham multi-statement se phai khai bao dinh dang cua bang va phan than chuong trinh gom cac ham lenh thao tac du lieu va ket thuc
--la ham return vi ket qua da duoc khai bao trong @Tbl. Trai nguoc voi in-line khong can khai bao bang va return la mot cau lenh select

--Xem phuong an thuc thi
SELECT TH.*,P.Name
FROM Production.TransactionHistory TH
JOIN dbo.fn_ProductInfoByModelId(5) P ON TH.ProductID = P.ProductID

--chuyen ham fn_ProductInfoByModelId ve multi-statement
DROP FUNCTION dbo.fn_ProductInfoByModelId

CREATE FUNCTION dbo.fn_ProductInfoByModelID_MSTV(@p INT) 
RETURNS @t TABLE(ProductID INT, Name NVARCHAR(50), ProductNumber NVARCHAR(25))
AS
BEGIN
	INSERT INTO @t
	SELECT P.ProductID, P.Name, P.ProductNumber
	FROM Production.Product P 
	WHERE P.ProductModelID = @p
 
	RETURN
END


SELECT *
FROM Production.TransactionHistory TH
JOIN dbo.fn_ProductInfoByModelID_MSTV(5) P ON TH.ProductID = P.ProductID