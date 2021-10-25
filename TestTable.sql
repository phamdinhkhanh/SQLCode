/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [TestDB]
GO

/****** Object:  Table [dbo].[ConvertTextFile]    Script Date: 9/5/2017 5:38:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConvertTextFile](
	[WorkOrderID] [float] NULL,
	[ProductID] [float] NULL,
	[OrderQty] [float] NULL,
	[StockedQty] [float] NULL,
	[ScrappedQty] [float] NULL,
	[StartDate] [float] NULL,
	[EndDate] [float] NULL,
	[DueDate] [float] NULL,
	[ScrapReasonID] [float] NULL,
	[ModifiedDate] [float] NULL,
	[SegmentOrder] [varchar](255) NULL
) ON [PRIMARY]
GO


