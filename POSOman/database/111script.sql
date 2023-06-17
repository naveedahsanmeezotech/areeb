
USE [db_fyp_areeb]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Grave]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Grave_Size]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Grave_Status]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[GraveDetail]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[PaymentCard]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Purchase]    Script Date: 6/17/2023 4:09:46 PM ******/
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
	[IsReturned] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PKPurchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetail]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[PurchaseReturnDetail]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[Quotation]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[QuotationDetail]    Script Date: 6/17/2023 4:09:46 PM ******/
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
/****** Object:  Table [dbo].[SaleOrder]    Script Date: 6/17/2023 4:09:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDate] [date] NULL,
	[OrderDate] [date] NULL,
	[DeceasedPerson] [varchar](50) NULL,
	[DeceasedCnic] [varchar](50) NULL,
	[ReasonOfDeath] [varchar](50) NULL,
	[DateofDeath] [date] NULL,
	[DeceasedDateofBirth] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_SaleOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 6/17/2023 4:09:47 PM ******/
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
/****** Object:  Table [dbo].[StockLog]    Script Date: 6/17/2023 4:09:47 PM ******/
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 6/17/2023 4:09:47 PM ******/
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
	[Address] [varchar](max) NULL,
	[Status] [varchar](30) NULL,
 CONSTRAINT [PK__Vendor__D9CCC2888371050E] PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4', N'Customer')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18aea5a1-e74d-446f-bbdf-0220c34bc120', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'701afdff-31fd-4801-a1eb-af2b9a2420b4', N'4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9cf6e101-1539-4b9c-9a3e-ec36245a3c5d', N'4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f69d00ef-179d-4409-a495-1583f1e7dbf5', N'4')
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserId], [BranchID]) VALUES (N'18aea5a1-e74d-446f-bbdf-0220c34bc120', N'admin@gmail.com', 0, N'AJ+EzWgB4sqyEw5wHGBylSH7OeqnAGejkF3OxR70DeTxJR6/TPAonE9Zf2C1IgwMKQ==', N'312d4756-51fc-4f03-b35b-e0c4db83dda9', NULL, 0, 0, NULL, 1, 0, N'Admin', 4001, 9001)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserId], [BranchID]) VALUES (N'701afdff-31fd-4801-a1eb-af2b9a2420b4', N'1091456855@gmail.com', 0, N'AFAH7j24hDQy7ld7SLUjitdbGL7IVnfMNcrWz1DUct0zQcnt6Gi+Gti9hopOhjSd2g==', N'1017dcb5-fa9c-45fd-801c-266afe2033a4', NULL, 0, 0, NULL, 1, 0, N'areeb112', 4002, 9001)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserId], [BranchID]) VALUES (N'9cf6e101-1539-4b9c-9a3e-ec36245a3c5d', N'1881688122@gmail.com', 0, N'AJmGihB/x5tffy620e/dW1b3cgkOH96g5RnUTSkbtZU02LDhgzvZ7Occ4pKgOJTtIg==', N'0bcb69f3-0796-4d0f-b20b-a160810564bf', NULL, 0, 0, NULL, 1, 0, N'Admin2', 4004, 9001)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserId], [BranchID]) VALUES (N'f69d00ef-179d-4409-a495-1583f1e7dbf5', N'1010832130@gmail.com', 0, N'AOBXZndXTN7VV4r6ETGr0BM59R2vo2YeBeSLq2TyuQdgrWOQIb7DEMlIN813NJ2BPw==', N'92f05b9d-74b3-4a20-973d-f1e90eedd249', NULL, 0, 0, NULL, 1, 0, N'Admin1', 4003, 9001)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2001, N'Areeb', N'Jalal', N'03303155411', N'mareeb@gmail.com', N'f2', CAST(N'2023-05-26T14:54:59.603' AS DateTime), N'Karachi', N'Pakistan', N'42201-6975211-9', CAST(N'2000-09-09' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2002, N'abc', N'abc', N'03303155411', N'areebjalal@gmail.com', N'f2', CAST(N'2023-05-30T22:22:26.240' AS DateTime), N'Karachi', N'Pakistan', N'42201-6975211-9', CAST(N'2023-05-30' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2003, N'abc', N'abc', N'03303155411', N'areebjalal@gmail.com', N'f2', CAST(N'2023-05-30T22:22:36.220' AS DateTime), N'Karachi', N'Pakistan', N'42201-6975211-9', CAST(N'2023-05-30' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2004, N'Ahsan', N'Khan', N'03212233431', N'ahsan@gmail.com', N'test address', CAST(N'2023-06-01T23:23:47.317' AS DateTime), N'Karachi', N'Pakistan', N'42201-6975211-9', CAST(N'2000-09-09' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2005, N'Areeb ', N'Jala', N'03303155411', N'areebjalal@gmail.com', N'f2', CAST(N'2023-06-02T13:14:35.847' AS DateTime), N'1', N'1', N'42201-6975211-9', CAST(N'2000-09-09' AS Date), N'701afdff-31fd-4801-a1eb-af2b9a2420b4')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2006, N'Fahad', N'Awan', N'03303155411', N'fahadawan@gmail.com', N'f2', CAST(N'2023-06-02T13:59:29.547' AS DateTime), N'1', N'1', N'42201-6975211-9', CAST(N'1995-06-02' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2007, N'w', N'1', N'03122370860', N'naveed@gmail.com', N'B-70', CAST(N'2023-06-10T00:09:22.063' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-7', CAST(N'2023-06-10' AS Date), N'f69d00ef-179d-4409-a495-1583f1e7dbf5')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2008, N'e', N'2', N'03122370860', N'naveed1@gmail.com', N'B-70 ', CAST(N'2023-06-10T00:10:45.333' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-7', CAST(N'2023-06-09' AS Date), N'f69d00ef-179d-4409-a495-1583f1e7dbf5')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2009, N' a', N'b', N'03122370860', N'naveed@gmail.com', N'we', CAST(N'2023-06-11T03:31:00.370' AS DateTime), N'Karachi', N'Pakistan', N'4220107701257', CAST(N'2023-06-11' AS Date), N'9cf6e101-1539-4b9c-9a3e-ec36245a3c5d')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2010, N'21', N'313', N'03122370860', N'naveed@gmail.com', N'222', CAST(N'2023-06-11T03:33:45.333' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-7', CAST(N'2023-06-11' AS Date), N'9cf6e101-1539-4b9c-9a3e-ec36245a3c5d')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2011, N'1', N'2', N'03122370905', N'w@gmail.com', N'www', CAST(N'2023-06-11T04:30:55.817' AS DateTime), N'Karachi', N'Pakistan', N'0312237090554', CAST(N'2023-06-11' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2012, N'1', N'23', N'03122370905', N'w@gmail.com', N'212', CAST(N'2023-06-11T04:32:37.343' AS DateTime), N'Karachi', N'Pakistan', N'0312237090512', CAST(N'2023-01-09' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [UserId]) VALUES (2013, N'q', N'd', N'03122370860', N'naveed@gmail.com', N'w', CAST(N'2023-06-11T09:33:14.623' AS DateTime), N'Karachi', N'Pakistan', N'4220107701257', CAST(N'2023-05-29' AS Date), N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave] ON 

INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (1, 1, N'A-1', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (2, 1, N'A-2', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (3, 1, N'A-3', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (4, 1, N'A-4', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (5, 1, N'A-5', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (6, 1, N'A-6', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (7, 1, N'A-7', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (8, 1, N'A-8', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (9, 1, N'A-9', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (10, 1, N'A-10', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (11, 1, N'A-11', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (12, 1, N'A-12', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (13, 1, N'A-13', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (14, 1, N'A-14', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (15, 1, N'A-15', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (16, 1, N'A-16', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (17, 1, N'A-17', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (18, 1, N'A-18', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (19, 1, N'A-19', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (20, 1, N'A-20', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (21, 2, N'B-1', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (22, 2, N'B-2', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (23, 2, N'B-3', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (24, 2, N'B-4', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (25, 2, N'B-5', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (26, 2, N'B-6', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (27, 2, N'B-7', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (28, 2, N'B-8', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (29, 2, N'B-9', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (30, 2, N'B-10', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (31, 1, N'C-1', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (32, 3, N'C-2', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (33, 1, N'C-3', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (34, 3, N'C-4', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (35, 3, N'C-5', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (36, 2, N'B-11', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (37, 2, N'B-12', 1)
SET IDENTITY_INSERT [dbo].[Grave] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave_Size] ON 

INSERT [dbo].[Grave_Size] ([Id], [Sizes], [Cement], [Slab], [Blocks], [Price]) VALUES (1, N'Adult', N'2', N'4', N'10', CAST(2500 AS Decimal(18, 0)))
INSERT [dbo].[Grave_Size] ([Id], [Sizes], [Cement], [Slab], [Blocks], [Price]) VALUES (2, N'Child', N'4', N'6', N'12', CAST(3500 AS Decimal(18, 0)))
INSERT [dbo].[Grave_Size] ([Id], [Sizes], [Cement], [Slab], [Blocks], [Price]) VALUES (3, N'new born', N'1', N'1', N'5', CAST(500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Grave_Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave_Status] ON 

INSERT [dbo].[Grave_Status] ([Status_ID], [Status_Name]) VALUES (1, N'Available')
INSERT [dbo].[Grave_Status] ([Status_ID], [Status_Name]) VALUES (2, N'Booked')
INSERT [dbo].[Grave_Status] ([Status_ID], [Status_Name]) VALUES (3, N'Reserved')
SET IDENTITY_INSERT [dbo].[Grave_Status] OFF
GO
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2001, CAST(N'2023-05-26' AS Date), CAST(N'2023-05-26' AS Date), N'Mushtaq Khan', N'42201-6975211-4', N'Heart Attack', CAST(N'2000-09-09' AS Date), CAST(N'1999-05-02' AS Date), N'Booked', 5, 1)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2002, CAST(N'2023-05-30' AS Date), CAST(N'2023-05-30' AS Date), N'abc', N'42201-6975211-1', N'fever', CAST(N'2023-05-30' AS Date), CAST(N'2023-05-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2004, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-01' AS Date), N'Fazal Ahmed', N'42201-6975211-2', N'Heart Attack', CAST(N'2000-09-09' AS Date), CAST(N'1947-06-19' AS Date), NULL, 7, 1)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2005, CAST(N'2023-06-03' AS Date), CAST(N'2023-06-02' AS Date), N'Mushtaq Khan', N'42201-6975211-1', N'Heart Attack', CAST(N'2000-09-09' AS Date), CAST(N'1974-07-21' AS Date), N'Booked', 1, 1)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2006, NULL, CAST(N'2023-06-02' AS Date), NULL, NULL, NULL, CAST(N'1995-06-02' AS Date), NULL, N'Reserved', NULL, NULL)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2007, NULL, CAST(N'2023-06-10' AS Date), NULL, NULL, NULL, CAST(N'2023-06-10' AS Date), NULL, N'Reserved', NULL, NULL)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2008, NULL, CAST(N'2023-06-10' AS Date), NULL, NULL, NULL, CAST(N'2023-06-09' AS Date), NULL, N'Reserved', NULL, NULL)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2009, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-11' AS Date), N'1', N'4220107701257', N'11', CAST(N'2023-06-11' AS Date), CAST(N'2023-06-11' AS Date), N'Booked', 35, 3)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2010, NULL, CAST(N'2023-06-11' AS Date), NULL, NULL, NULL, CAST(N'2023-06-11' AS Date), NULL, N'Reserved', 34, NULL)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2011, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-11' AS Date), N'1', N'0312237090512', N'ww', CAST(N'2023-06-11' AS Date), CAST(N'2023-06-07' AS Date), N'Booked', 32, 1)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2012, CAST(N'2023-06-13' AS Date), CAST(N'2023-06-11' AS Date), N'21', N'0312237090512', N'2', CAST(N'2023-01-09' AS Date), CAST(N'2023-06-10' AS Date), N'Booked', 1, 1)
INSERT [dbo].[GraveDetail] ([GraveDetail_ID], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveId], [GraveSizeId]) VALUES (2013, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-11' AS Date), N'1', N'4220107701257', N'w', CAST(N'2023-05-29' AS Date), CAST(N'2023-06-08' AS Date), N'Booked', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[PaymentCard] ON 

INSERT [dbo].[PaymentCard] ([Id], [CardNumber], [Code], [Expire], [Active]) VALUES (1, N'1', N'12', N'1223', 1)
SET IDENTITY_INSERT [dbo].[PaymentCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (1, N'Blocks', N'Block for Grave', N'Piece')
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (2, N'Cement', N'Cement', N'KG')
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (3, N'Slab', N'Slabs for Grave', N'Piece')
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (4, N'point', N'12', N'kg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1030, 2000, NULL, CAST(N'2023-05-16T00:16:25.207' AS DateTime), NULL, 9002, CAST(33.00 AS Decimal(18, 2)), 0, 1001, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1031, 2001, NULL, CAST(N'2023-05-16T00:16:43.337' AS DateTime), NULL, 9000, CAST(36.00 AS Decimal(18, 2)), 1, 1000, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1032, 2002, NULL, CAST(N'2023-05-16T00:27:31.600' AS DateTime), NULL, 9000, CAST(36.00 AS Decimal(18, 2)), 1, 1000, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1033, 2003, NULL, CAST(N'2023-05-26T15:12:20.267' AS DateTime), NULL, 9000, CAST(35.00 AS Decimal(18, 2)), 1, 1002, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1034, 2000, NULL, CAST(N'2023-05-16T00:16:25.207' AS DateTime), NULL, 9002, NULL, 2, 1001, 442, CAST(N'2023-05-26T00:00:00.000' AS DateTime), CAST(N'2023-05-26T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1035, 2001, NULL, CAST(N'2023-05-30T16:15:44.250' AS DateTime), NULL, 9002, CAST(21500.00 AS Decimal(18, 2)), 0, 1003, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1036, 2001, NULL, CAST(N'2023-05-30T16:15:44.250' AS DateTime), NULL, 9002, CAST(21500.00 AS Decimal(18, 2)), 2, 1003, 448, CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(N'2023-05-30T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1037, 2002, NULL, CAST(N'2023-06-02T03:42:05.820' AS DateTime), NULL, 9002, CAST(2000.00 AS Decimal(18, 2)), 0, 1004, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1038, 2002, NULL, CAST(N'2023-06-02T03:42:05.820' AS DateTime), NULL, 9002, CAST(2000.00 AS Decimal(18, 2)), 2, 1004, 59, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1039, 2003, NULL, CAST(N'2023-06-02T14:17:08.897' AS DateTime), NULL, 9003, CAST(12000.00 AS Decimal(18, 2)), 0, 1005, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1040, 2003, NULL, CAST(N'2023-06-02T14:17:08.897' AS DateTime), NULL, 9003, CAST(12000.00 AS Decimal(18, 2)), 2, 1005, 339, CAST(N'2023-06-02T00:00:00.000' AS DateTime), CAST(N'2023-06-02T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1041, 2004, NULL, CAST(N'2023-06-05T23:43:00.343' AS DateTime), NULL, 9003, CAST(1200.00 AS Decimal(18, 2)), 0, 1005, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1042, 2004, NULL, CAST(N'2023-06-05T23:43:00.343' AS DateTime), NULL, 9003, CAST(1200.00 AS Decimal(18, 2)), 2, 1005, 381, CAST(N'2023-06-05T00:00:00.000' AS DateTime), CAST(N'2023-06-05T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1043, 2005, NULL, CAST(N'2023-06-11T09:35:42.377' AS DateTime), NULL, 9003, CAST(11.00 AS Decimal(18, 2)), 0, 1006, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate], [IsReturned], [IsDeleted]) VALUES (1044, 2005, NULL, CAST(N'2023-06-11T09:35:42.377' AS DateTime), NULL, 9003, CAST(13.00 AS Decimal(18, 2)), 2, 1006, 312, CAST(N'2023-06-11T00:00:00.000' AS DateTime), CAST(N'2023-06-11T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] ON 

INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (44, 1030, N'block', 1, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N's3', N'50', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (45, 1031, N'block', 1, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N's', N'50', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (46, 1031, N'PIPE', 3, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'1', N'60', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (47, 1032, N'block', 1, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N's', N'50', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (48, 1032, N'PIPE', 3, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'1', N'60', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (49, 1033, N'Cement', 2, 1, CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (50, 1033, N'block', 1, 1, CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (51, 1034, N'block', 1, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N's3', N'50', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (52, 1035, N'Cement', 2, 10, CAST(2000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (53, 1035, N'block', 1, 100, CAST(15.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (54, 1036, N'Cement', 2, 10, CAST(2000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (55, 1036, N'block', 1, 100, CAST(15.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (56, 1037, N'block', 1, 50, CAST(40.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (57, 1038, N'block', 1, 50, CAST(40.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (58, 1039, N'block', 1, 50, CAST(40.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (59, 1039, N'Cement', 2, 10, CAST(1000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (60, 1040, N'block', 1, 50, CAST(40.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (61, 1040, N'Cement', 2, 10, CAST(1000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (62, 1041, N'block', 1, 5, CAST(40.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (63, 1041, N'Cement', 2, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (64, 1042, N'block', 1, 5, CAST(40.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (65, 1042, N'Cement', 2, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (66, 1043, N'point', 4, 4, CAST(2.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'12', N'kg', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (67, 1043, N'Cement', 2, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (68, 1044, N'point', 4, 5, CAST(2.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'12', N'kg', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (69, 1044, N'Cement', 2, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
SET IDENTITY_INSERT [dbo].[PurchaseDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseReturn] ON 

INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [PurchaseID], [InvoiceNo], [ReturnDate], [TotalAmount], [IsDeleted], [UserID]) VALUES (1, 0, NULL, CAST(N'2023-06-09T08:03:39.303' AS DateTime), CAST(12000.00 AS Decimal(18, 2)), NULL, N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [PurchaseID], [InvoiceNo], [ReturnDate], [TotalAmount], [IsDeleted], [UserID]) VALUES (2, 1042, NULL, CAST(N'2023-06-09T08:11:23.380' AS DateTime), CAST(1200.00 AS Decimal(18, 2)), NULL, N'18aea5a1-e74d-446f-bbdf-0220c34bc120')
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [PurchaseID], [InvoiceNo], [ReturnDate], [TotalAmount], [IsDeleted], [UserID]) VALUES (3, 1038, N'89', CAST(N'2023-06-11T07:10:38.303' AS DateTime), CAST(2000.00 AS Decimal(18, 2)), NULL, N'')
SET IDENTITY_INSERT [dbo].[PurchaseReturn] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseReturnDetail] ON 

INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (1, 1, N'block', 1, 5, CAST(40.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (2, 1, N'Cement', 2, 10, CAST(1000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (3, 2, N'block', 1, 2, CAST(40.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (4, 2, N'Cement', 2, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'Cement', N'KG', NULL)
INSERT [dbo].[PurchaseReturnDetail] ([Id], [PurchaseReturnId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (5, 3, N'block', 1, 1, CAST(40.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece', NULL)
SET IDENTITY_INSERT [dbo].[PurchaseReturnDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotation] ON 

INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1033, 1000, N'q2', CAST(N'2023-05-16T00:15:44.823' AS DateTime), NULL, 9000, CAST(36.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1034, 1001, N'1', CAST(N'2023-05-16T00:15:58.977' AS DateTime), NULL, 9002, CAST(33.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1035, 1002, NULL, CAST(N'2023-05-26T15:11:31.250' AS DateTime), NULL, 9000, CAST(35.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1036, 1003, N'10000031', CAST(N'2023-05-30T16:15:00.013' AS DateTime), NULL, 9002, CAST(2015.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1037, 1004, N'1000021', CAST(N'2023-06-02T03:41:47.787' AS DateTime), NULL, 9002, CAST(40.00 AS Decimal(18, 2)), 0, CAST(N'2023-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1038, 1005, N'100041', CAST(N'2023-06-02T14:15:43.370' AS DateTime), NULL, 9003, CAST(1040.00 AS Decimal(18, 2)), 0, CAST(N'2023-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [validTill]) VALUES (1039, 1006, NULL, CAST(N'2023-06-11T09:35:28.300' AS DateTime), NULL, 9003, CAST(5.00 AS Decimal(18, 2)), 0, NULL)
SET IDENTITY_INSERT [dbo].[Quotation] OFF
GO
SET IDENTITY_INSERT [dbo].[QuotationDetail] ON 

INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (52, 1033, N'block', 1, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N's', N'50')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (53, 1033, N'PIPE', 3, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'1', N'60')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (54, 1034, N'block', 1, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N's3', N'50')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (55, 1035, N'Cement', 2, 1, CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Cement', N'KG')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (56, 1035, N'block', 1, 1, CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (57, 1036, N'Cement', 2, 1, CAST(2000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), N'Cement', N'KG')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (58, 1036, N'block', 1, 1, CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (59, 1037, N'block', 1, 1, CAST(40.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (60, 1038, N'block', 1, 1, CAST(40.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'Block for Grave', N'Piece')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (61, 1038, N'Cement', 2, 1, CAST(1000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'Cement', N'KG')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (62, 1039, N'point', 4, 1, CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'12', N'kg')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (63, 1039, N'Cement', 2, 1, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'Cement', N'KG')
SET IDENTITY_INSERT [dbo].[QuotationDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([Id], [Section]) VALUES (1, N'A')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (2, N'B')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (3, N'C')
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[StockLog] ON 

INSERT [dbo].[StockLog] ([Id], [MaterailId], [MaterailName], [StockIn], [StockOut], [Status], [Description]) VALUES (1, 1, N'block', 185, NULL, 1, N's3        ')
INSERT [dbo].[StockLog] ([Id], [MaterailId], [MaterailName], [StockIn], [StockOut], [Status], [Description]) VALUES (2, 2, N'Cement', 18, NULL, 1, N'Cement    ')
INSERT [dbo].[StockLog] ([Id], [MaterailId], [MaterailName], [StockIn], [StockOut], [Status], [Description]) VALUES (3, 4, N'point', 5, NULL, 1, N'12        ')
SET IDENTITY_INSERT [dbo].[StockLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9000, N'naveed', N'02', N'25', N'1', NULL, N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9001, N'imran', N'2', N'5', NULL, NULL, N'InActive')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9002, N'Farrukh', N'Farrukh', N'03210210211', N'Cash', N'Shop no. 11', N'Active')
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address], [Status]) VALUES (9003, N'Haji Cements', N'Haji Siraj Ahmed', N'03303166455', N'cash', N'abc', N'Active')
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DFPurchase_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_IsReturned]  DEFAULT ((0)) FOR [IsReturned]
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
USE [master]
GO
ALTER DATABASE [db_fyp_areeb] SET  READ_WRITE 
GO
