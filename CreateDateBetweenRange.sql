USE KHANH_DB
DECLARE @dates TABLE (Dt datetime)
DECLARE @dateFrom datetime
DECLARE @dateTo datetime

SET @dateFrom = '2015-01-01'
SET @dateTo = '2017-12-31'

WHILE (@dateFrom < @dateTo)
BEGIN
	INSERT INTO @dates
	SELECT @dateFrom
	SET @dateFrom = DATEADD(DAY,1,@dateFrom)
END

SELECT * FROM @dates
