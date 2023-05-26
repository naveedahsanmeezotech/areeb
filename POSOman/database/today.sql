
USE [db_fyp_areeb]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[UserId] [int] IDENTITY(4001,1) NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_ID] [int] IDENTITY(2001,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Creation_Date] [datetime] NULL,
	[city] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[cnic] [varchar](15) NULL,
	[date_of_birth] [date] NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK__Customer__CD64CFDD58F1F83D] PRIMARY KEY CLUSTERED 
(
	[customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grave]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Section_Id] [int] NULL,
	[Grave_Name] [nvarchar](50) NULL,
	[Grave_Status_Id] [int] NULL,
 CONSTRAINT [PK__Grave__E154BADCAC2D9FFB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grave_Size]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grave_Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sizes] [nvarchar](50) NULL,
	[Cement] [nvarchar](50) NULL,
	[Slab] [nvarchar](50) NULL,
	[Blocks] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Grave_Size] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grave_Status]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grave_Status](
	[Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status_Name] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GraveDetail]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraveDetail](
	[GraveDetail_ID] [int] NOT NULL,
	[DeliveryDate] [date] NULL,
	[OrderDate] [date] NULL,
	[DeceasedPerson] [varchar](50) NULL,
	[DeceasedCnic] [varchar](50) NULL,
	[ReasonOfDeath] [varchar](50) NULL,
	[DateofDeath] [date] NULL,
	[DeceasedDateofBirth] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[GraveId] [int] NULL,
	[GraveSizeId] [int] NULL,
 CONSTRAINT [PK_GraveDetails] PRIMARY KEY CLUSTERED 
(
	[GraveDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentCard]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Expire] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PaymentCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[UnitOfMeasure] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[PurchaseNo] [int] NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[DateIssued] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[VendorId] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[Status] [int] NOT NULL,
	[QutotationReferenceNo] [int] NULL,
	[GR] [int] NULL,
	[DocumnetDate] [datetime] NULL,
	[PostingDate] [datetime] NULL,
 CONSTRAINT [PKPurchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetail]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseId] [int] NOT NULL,
	[MaterailName] [nvarchar](50) NULL,
	[MaterailId] [int] NULL,
	[Qty] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Description] [nvarchar](50) NULL,
	[MeasureOfUnit] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
 CONSTRAINT [PK_PurchaseDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[QuotationNo] [int] NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[DateIssued] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[VendorId] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[Status] [int] NOT NULL,
	[validTill] [datetime] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuotationDetail]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuotationDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuotationId] [int] NOT NULL,
	[MaterailName] [nvarchar](50) NULL,
	[MaterailId] [int] NULL,
	[Qty] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Description] [nvarchar](50) NULL,
	[MeasureOfUnit] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuotationDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrder]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrder](
	[Id] [int] IDENTITY(3000,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_SaleOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Section] [varchar](25) NOT NULL,
 CONSTRAINT [PK__Section__70E702BA477059DB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockLog]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterailId] [int] NULL,
	[MaterailName] [nvarchar](50) NULL,
	[StockIn] [int] NULL,
	[StockOut] [int] NULL,
	[Status] [int] NULL,
	[Description] [nchar](10) NULL,
 CONSTRAINT [PK_StockLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 05/26/2023 9:05:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Vendor_ID] [int] IDENTITY(9000,1) NOT NULL,
	[Vendor_Name] [varchar](30) NULL,
	[Contact_Person] [varchar](30) NULL,
	[Vendor_Contact] [nvarchar](15) NULL,
	[Vendor_Payment_Type] [varchar](30) NULL,
	[Address] [varchar](30) NULL,
	[Status] [varchar](30) NULL,
 CONSTRAINT [PK__Vendor__D9CCC2888371050E] PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4', N'Customer')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18aea5a1-e74d-446f-bbdf-0220c34bc120', N'3')
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserId], [BranchID]) VALUES (N'18aea5a1-e74d-446f-bbdf-0220c34bc120', N'admin@gmail.com', 0, N'AJ+EzWgB4sqyEw5wHGBylSH7OeqnAGejkF3OxR70DeTxJR6/TPAonE9Zf2C1IgwMKQ==', N'312d4756-51fc-4f03-b35b-e0c4db83dda9', NULL, 0, 0, NULL, 1, 0, N'Admin', 4001, 9001)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave] ON 
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (1, 1, N'A-1', 2)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (2, 1, N'A-2', 1)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (3, 1, N'A-3', 3)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (4, 1, N'B-57', 2)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (5, 2, N'B-52', 1)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (6, 2, N'B-59', 1)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (7, 2, N'B-68', 1)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (8, 2, N'C-65', 2)
GO
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (9, 1, N'A-5', 3)
GO
SET IDENTITY_INSERT [dbo].[Grave] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave_Size] ON 
GO
INSERT [dbo].[Grave_Size] ([Id], [Sizes], [Cement], [Slab], [Blocks], [Price]) VALUES (1, N'Adult', N'2', N'4', N'10', CAST(2500 AS Decimal(18, 0)))
GO
INSERT [dbo].[Grave_Size] ([Id], [Sizes], [Cement], [Slab], [Blocks], [Price]) VALUES (2, N'Child', N'4', N'6', N'12', CAST(3500 AS Decimal(18, 0)))
GO
INSERT [dbo].[Grave_Size] ([Id], [Sizes], [Cement], [Slab], [Blocks], [Price]) VALUES (3, N'new born', N'1', N'1', N'5', CAST(500 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Grave_Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave_Status] ON 
GO
INSERT [dbo].[Grave_Status] ([Status_ID], [Status_Name]) VALUES (1, N'Available')
GO
INSERT [dbo].[Grave_Status] ([Status_ID], [Status_Name]) VALUES (2, N'Booked')
GO
INSERT [dbo].[Grave_Status] ([Status_ID], [Status_Name]) VALUES (3, N'Reserved')
GO
SET IDENTITY_INSERT [dbo].[Grave_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentCard] ON 
GO
INSERT [dbo].[PaymentCard] ([Id], [CardNumber], [Code], [Expire], [Active]) VALUES (1, N'1', N'12', N'1223', 1)
GO
SET IDENTITY_INSERT [dbo].[PaymentCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (1, N'block', N's', N'50')
GO
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (2, N'Cement', N'1', N'56')
GO
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (3, N'PIPE', N'1', N'60')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 
GO
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate]) VALUES (1030, 2000, NULL, CAST(N'2023-05-16T00:16:25.207' AS DateTime), NULL, 9002, CAST(33.00 AS Decimal(18, 2)), 1, 1001, NULL, NULL, NULL)
GO
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate]) VALUES (1031, 2001, NULL, CAST(N'2023-05-16T00:16:43.337' AS DateTime), NULL, 9000, CAST(36.00 AS Decimal(18, 2)), 1, 1000, NULL, NULL, NULL)
GO
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate]) VALUES (1032, 2002, NULL, CAST(N'2023-05-16T00:27:31.600' AS DateTime), NULL, 9000, CAST(36.00 AS Decimal(18, 2)), 1, 1000, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] ON 
GO
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (44, 1030, N'block', 1, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N's3', N'50', NULL)
GO
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (45, 1031, N'block', 1, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N's', N'50', NULL)
GO
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (46, 1031, N'PIPE', 3, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'1', N'60', NULL)
GO
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (47, 1032, N'block', 1, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N's', N'50', NULL)
GO
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (48, 1032, N'PIPE', 3, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'1', N'60', NULL)
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotation] ON 
GO
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1033, 1000, N'q2', CAST(N'2023-05-16T00:15:44.823' AS DateTime), NULL, 9000, CAST(36.00 AS Decimal(18, 2)), 0, NULL)
GO
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1034, 1001, N'1', CAST(N'2023-05-16T00:15:58.977' AS DateTime), NULL, 9002, CAST(33.00 AS Decimal(18, 2)), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Quotation] OFF
GO
SET IDENTITY_INSERT [dbo].[QuotationDetail] ON 
GO
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (52, 1033, N'block', 1, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N's', N'50')
GO
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (53, 1033, N'PIPE', 3, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'1', N'60')
GO
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (54, 1034, N'block', 1, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N's3', N'50')
GO
SET IDENTITY_INSERT [dbo].[QuotationDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 
GO
INSERT [dbo].[Section] ([Id], [Section]) VALUES (1, N'A')
GO
INSERT [dbo].[Section] ([Id], [Section]) VALUES (2, N'B')
GO
INSERT [dbo].[Section] ([Id], [Section]) VALUES (3, N'C')
GO
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 
GO
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9000, N'naveed', N'02', N'25', N'1', NULL, N'Active')
GO
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9001, N'imran', N'2', N'5', NULL, NULL, N'InActive')
GO
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9002, N'q', N'w', N'we', N'e', N'e', N'Active')
GO
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DFPurchase_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[GraveDetail]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Grave] FOREIGN KEY([GraveId])
REFERENCES [dbo].[Grave] ([Id])
GO
ALTER TABLE [dbo].[GraveDetail] CHECK CONSTRAINT [FK_Customer_Grave]
GO
ALTER TABLE [dbo].[GraveDetail]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Grave_Size] FOREIGN KEY([GraveSizeId])
REFERENCES [dbo].[Grave_Size] ([Id])
GO
ALTER TABLE [dbo].[GraveDetail] CHECK CONSTRAINT [FK_Customer_Grave_Size]
GO
ALTER TABLE [dbo].[GraveDetail]  WITH CHECK ADD  CONSTRAINT [FK_GraveDetails_Customer1] FOREIGN KEY([GraveDetail_ID])
REFERENCES [dbo].[Customer] ([customer_ID])
GO
ALTER TABLE [dbo].[GraveDetail] CHECK CONSTRAINT [FK_GraveDetails_Customer1]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FKPurchase_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Vendor_ID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FKPurchase_Vendor]
GO
ALTER TABLE [dbo].[PurchaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetail_Product] FOREIGN KEY([MaterailId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetail] CHECK CONSTRAINT [FK_PurchaseDetail_Product]
GO
ALTER TABLE [dbo].[PurchaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetail_Purchase] FOREIGN KEY([PurchaseId])
REFERENCES [dbo].[Purchase] ([Id])
GO
ALTER TABLE [dbo].[PurchaseDetail] CHECK CONSTRAINT [FK_PurchaseDetail_Purchase]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Vendor_ID])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Vendor]
GO
ALTER TABLE [dbo].[QuotationDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuotationDetail_Product] FOREIGN KEY([MaterailId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[QuotationDetail] CHECK CONSTRAINT [FK_QuotationDetail_Product]
GO
ALTER TABLE [dbo].[QuotationDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuotationDetail_Quotation] FOREIGN KEY([QuotationId])
REFERENCES [dbo].[Quotation] ([Id])
GO
ALTER TABLE [dbo].[QuotationDetail] CHECK CONSTRAINT [FK_QuotationDetail_Quotation]
GO
ALTER TABLE [dbo].[SaleOrder]  WITH CHECK ADD  CONSTRAINT [FK_SaleOrder_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([customer_ID])
GO
ALTER TABLE [dbo].[SaleOrder] CHECK CONSTRAINT [FK_SaleOrder_Customer]
GO
ALTER TABLE [dbo].[StockLog]  WITH CHECK ADD  CONSTRAINT [FK_StockLog_Product] FOREIGN KEY([MaterailId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[StockLog] CHECK CONSTRAINT [FK_StockLog_Product]
GO
USE [db_fyp_areeb]

