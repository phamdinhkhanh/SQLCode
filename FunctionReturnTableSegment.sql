USE TestDB
GO
CREATE FUNCTION dbo.Segment(
	@Value INT,	
	@LowValue INT,
	@MediumValue INT,
	@HightValue INT
) 
RETURNS @SegmentTable TABLE(
	Segment VARCHAR(32)
)
AS
BEGIN
	DECLARE @Segment VARCHAR(32)
	SET @Segment = CASE WHEN @Value <= @LowValue THEN 'SILVER'
						WHEN @Value <= @MediumValue THEN 'GOLD'
						WHEN @Value <= @HightValue THEN 'TITAN'
						ELSE 'PLATINUM' END
	INSERT INTO @SegmentTable VALUES (@Segment)
	RETURN
END
--SELECT * FROM TestDB.dbo.Segment(49,10,50,100)
--SELECT A.ProductID,A.OrderQty,B.* FROM TestDB.dbo.WorkOrder A
--	CROSS APPLY
--	TestDB.dbo.Segment(A.OrderQty,10,20,100) B