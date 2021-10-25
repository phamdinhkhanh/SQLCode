USE TestDB
GO
CREATE FUNCTION dbo.ConvertDate (
	@StringDate VARCHAR(32)
) 
RETURNS @TableResult TABLE(
	DateConverted VARCHAR(8)
)
AS
BEGIN
DECLARE @B VARCHAR(32), @Date VARCHAR(32), 
	@Month VARCHAR(32), @Year VARCHAR(32),
	@TempDate VARCHAR(32), @TempMonth VARCHAR(32)
	SET @B = LEFT(@StringDate,LEN(@StringDate)-6)
	SET @TempDate = LEFT(@StringDate,CHARINDEX('/',@B,1)-1)
	SET @Date = CASE WHEN LEN(@TempDate) = 2 THEN @TempDate
					 ELSE '0'+@TempDate END
	SET @Year= RIGHT(@B,4)
	SET @TempMonth = SUBSTRING(@B,LEN(@TempDate)+2,LEN(@B)-LEN(@Year)-LEN(@TempDate)-2)
	SET @Month = CASE WHEN LEN(@TempMonth) = 2 THEN @TempMonth
					  ELSE '0'+@TempMonth END
	INSERT INTO @TableResult
	SELECT @Year+@Month+@Date
	RETURN
END

--SELECT A = dbo.ConvertDate('1/12/2017 00:00')
--Chức năng của CROSS APPLY Tương tự như inner join
--DECLARE @TableStringDate TABLE
--(
--	StringDate VARCHAR(32)
--)
--BEGIN
--	INSERT INTO @TableStringDate
--	VALUES ('1/12/2017 00:00')
--	INSERT INTO @TableStringDate
--	VALUES ('11/10/2017 00:00')
--	INSERT INTO @TableStringDate
--	VALUES ('11/9/2017 00:00')
--	INSERT INTO @TableStringDate
--	VALUES ('2/5/2017 00:00')
--END
--SELECT A.StringDate, B.* FROM @TableStringDate A
--	CROSS APPLY dbo.ConvertDate(A.StringDate) B