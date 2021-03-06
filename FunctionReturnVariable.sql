--SELECT * FROM TestDB..WorkOrder
--ALTER TABLE TestDB..WorkOrder
--ADD SegmentOrder VARCHAR(32)


CREATE FUNCTION dbo.SegmentOrder(@OrderQty INT,
	@iSILVER INT,
	@iGOLD INT,
	@iTITAN INT
)
RETURNS VARCHAR(32) 
AS
BEGIN
	DECLARE @SegmentOrder VARCHAR(32)
	SET @SegmentOrder = CASE WHEN @OrderQty < @iSILVER THEN 'SILVER'
							WHEN @OrderQty < @iGOLD THEN 'GOLD'
							WHEN @OrderQty < @iTITAN THEN 'TITAN'
							ELSE 'PLATINUM' END
	RETURN(@SegmentOrder)
END

--SELECT dbo.SegmentOrder(100,10,20,100)
--UPDATE WorkOrder
--SET SegmentOrder = dbo.SegmentOrder(OrderQty,10,20,100)
--SELECT * FROM TestDB..WorkOrder