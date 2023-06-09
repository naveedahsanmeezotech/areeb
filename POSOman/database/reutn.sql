USE [db_fyp_areeb]
GO
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 6/9/2023 8:14:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn](
	[PurchaseReturnID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [int] NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[ReturnDate] [datetime] NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[IsDeleted] [bit] NULL,
	[UserID] [nvarchar](max) NULL,
 CONSTRAINT [PK_PurchaseReturns] PRIMARY KEY CLUSTERED 
(
	[PurchaseReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseReturnDetail]    Script Date: 6/9/2023 8:14:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturnDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseReturnId] [int] NOT NULL,
	[MaterailName] [nvarchar](50) NULL,
	[MaterailId] [int] NULL,
	[Qty] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Description] [nvarchar](50) NULL,
	[MeasureOfUnit] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
 CONSTRAINT [PK_PurchaseReturnDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PurchaseReturn] ON 

INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [PurchaseID], [InvoiceNo], [ReturnDate], [TotalAmount], [IsDeleted], [UserID]) VALUES (1, 0, NULL, CAST(N'2023-06-09T08:03:39.303' AS DateTime), CAST(12000.00 AS Decimal(18, 2)), NULL, N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [PurchaseID], [InvoiceNo], [ReturnDate], [TotalAmount], [IsDeleted], [UserID]) VALUES (2, 1042, NULL, CAST(N'2023-06-09T08:11:23.380' AS DateTime), CAST(1200.00 AS Decimal(18, 2)), NULL, N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
SET IDENTITY_INSERT [dbo].[PurchaseReturn] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseReturnDetail] ON 

INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (1, 1, N'block', 1, 5, CAST(40.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (2, 1, N'Cement', 2, 10, CAST(1000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (3, 2, N'block', 1, 2, CAST(40.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (4, 2, N'Cement', 2, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
SET IDENTITY_INSERT [dbo].[PurchaseReturnDetail] OFF
GO
ALTER TABLE [dbo].[PurchaseReturnDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturnDetail_Product] FOREIGN KEY([MaterailId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[PurchaseReturnDetail] CHECK CONSTRAINT [FK_PurchaseReturnDetail_Product]
GO
ALTER TABLE [dbo].[PurchaseReturnDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturnDetails_PurchaseReturns] FOREIGN KEY([PurchaseReturnId])
REFERENCES [dbo].[PurchaseReturn] ([PurchaseReturnID])
GO
ALTER TABLE [dbo].[PurchaseReturnDetail] CHECK CONSTRAINT [FK_PurchaseReturnDetails_PurchaseReturns]
GO
