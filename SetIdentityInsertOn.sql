
--Khi bang co gia tri indentity insert de insert chinh xac gia tri cua cot identity thi phai liet ke list field insert trong bang duoc insert
--va set che do indentity insert on

SET IDENTITY_INSERT TestDB.dbo.WorkOrder ON
INSERT INTO TestDB.dbo.WorkOrder
([WorkOrderID]
    ,[ProductID]
    ,[OrderQty]
    ,[StockedQty]
    ,[ScrappedQty]
    ,[StartDate]
    ,[EndDate]
    ,[DueDate]
    ,[ScrapReasonID]
    ,[ModifiedDate]
    ,[SegmentOrder])

SELECT A.*,B.Segment FROM [AdventureWorks].[Production].[WorkOrder] A
CROSS APPLY  TestDB.dbo.Segment(A.OrderQty,10,20,50) B
   
SET IDENTITY_INSERT TestDB.dbo.WorkOrder ON

  