
USE [db_fyp]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
	[GraveId] [int] NULL,
	[DeliveryDate] [date] NULL,
	[OrderDate] [date] NULL,
	[DeceasedPerson] [varchar](50) NULL,
	[DeceasedCnic] [varchar](50) NULL,
	[ReasonOfDeath] [varchar](50) NULL,
	[DateofDeath] [date] NULL,
	[DeceasedDateofBirth] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[GraveSizeId] [int] NULL,
 CONSTRAINT [PK__Customer__CD64CFDD58F1F83D] PRIMARY KEY CLUSTERED 
(
	[customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grave]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[Grave_Size]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[Grave_Status]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[PaymentCard]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 27-Apr-23 7:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrder]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
/****** Object:  Table [dbo].[UserAction_Log]    Script Date: 27-Apr-23 7:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAction_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserLogId] [int] NULL,
	[UserAction] [nvarchar](max) NULL,
	[ActionDate] [smalldatetime] NULL,
 CONSTRAINT [PK_UserAction_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Log]    Script Date: 27-Apr-23 7:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[LoginTime] [smalldatetime] NULL,
	[LogoutTime] [smalldatetime] NULL,
	[UserIP] [nvarchar](max) NULL,
	[IsLogin] [bit] NULL,
 CONSTRAINT [PK_Users_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 27-Apr-23 7:23:54 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'SuperAdmin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18aea5a1-e74d-446f-bbdf-0220c34bc120', N'1')
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserId], [BranchID]) VALUES (N'18aea5a1-e74d-446f-bbdf-0220c34bc120', N'admin@gmail.com', 0, N'AJ+EzWgB4sqyEw5wHGBylSH7OeqnAGejkF3OxR70DeTxJR6/TPAonE9Zf2C1IgwMKQ==', N'312d4756-51fc-4f03-b35b-e0c4db83dda9', NULL, 0, 0, NULL, 1, 0, N'Admin', 4001, 9001)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [GraveId], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveSizeId]) VALUES (2053, N'w', N'q', N'03122370860', N'rao@gmail.com', N'eq', CAST(N'2023-04-26T10:55:14.403' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-8', CAST(N'2023-04-25' AS Date), 1, CAST(N'2023-04-29' AS Date), CAST(N'2023-04-28' AS Date), N'wqe', N'qwe', N'qwe', CAST(N'2023-04-24' AS Date), CAST(N'2023-04-25' AS Date), N'Booked', 3)
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [GraveId], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveSizeId]) VALUES (2054, N'nave13', N'ahsan', N'03122370860', N'16555@gmail.com', N'123', CAST(N'2023-04-26T11:28:00.947' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-9', CAST(N'2023-04-24' AS Date), 2, CAST(N'2023-04-28' AS Date), CAST(N'2023-04-29' AS Date), NULL, NULL, NULL, NULL, NULL, N'Reserved', 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave] ON 

INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (1, 1, N'A-1', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (2, 1, N'A-2', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (3, 1, N'A-3', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (4, 1, N'B-57', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (5, 2, N'B-52', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (6, 2, N'B-59', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (7, 2, N'B-68', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (8, 2, N'C-65', 1)
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
SET IDENTITY_INSERT [dbo].[PaymentCard] ON 

INSERT [dbo].[PaymentCard] ([Id], [CardNumber], [Code], [Expire], [Active]) VALUES (1, N'1', N'12', N'1223', 1)
SET IDENTITY_INSERT [dbo].[PaymentCard] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleOrder] ON 

INSERT [dbo].[SaleOrder] ([Id], [CustomerId], [DeliveryDate], [OrderDate]) VALUES (3019, 2053, CAST(N'2023-04-29T00:00:00.000' AS DateTime), CAST(N'2023-04-28T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SaleOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([Id], [Section]) VALUES (1, N'A')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (2, N'B')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (3, N'C')
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAction_Log] ON 

INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (1, 1, N'LoggedIn', CAST(N'2023-04-01T02:42:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (2, 3, N'LoggedIn', CAST(N'2023-04-01T02:45:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (3, 2, N'LoggedIn', CAST(N'2023-04-01T02:45:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (4, 4, N'LoggedIn', CAST(N'2023-04-01T03:24:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (5, 5, N'LoggedIn', CAST(N'2023-04-01T03:37:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (6, 6, N'LoggedIn', CAST(N'2023-04-01T03:38:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (7, 6, N'LoggedOut', CAST(N'2023-04-01T03:39:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (8, 7, N'LoggedIn', CAST(N'2023-04-01T03:43:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (9, 8, N'LoggedIn', CAST(N'2023-04-03T00:39:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (10, 9, N'LoggedIn', CAST(N'2023-04-03T00:44:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (11, 10, N'LoggedIn', CAST(N'2023-04-03T23:34:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (12, 11, N'LoggedIn', CAST(N'2023-04-04T00:02:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (13, 12, N'LoggedIn', CAST(N'2023-04-04T00:11:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (14, 13, N'LoggedIn', CAST(N'2023-04-04T00:31:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (15, 14, N'LoggedIn', CAST(N'2023-04-04T00:41:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (16, 15, N'LoggedIn', CAST(N'2023-04-04T19:18:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (17, 16, N'LoggedIn', CAST(N'2023-04-05T00:03:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (18, 17, N'LoggedIn', CAST(N'2023-04-05T00:07:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (19, 18, N'LoggedIn', CAST(N'2023-04-05T00:21:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (20, 19, N'LoggedIn', CAST(N'2023-04-05T00:30:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (21, 20, N'LoggedIn', CAST(N'2023-04-05T19:59:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (22, 21, N'LoggedIn', CAST(N'2023-04-05T20:11:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (23, 22, N'LoggedIn', CAST(N'2023-04-05T20:12:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (24, 23, N'LoggedIn', CAST(N'2023-04-05T20:18:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (25, 24, N'LoggedIn', CAST(N'2023-04-05T20:18:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (26, 25, N'LoggedIn', CAST(N'2023-04-07T01:16:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (27, 26, N'LoggedIn', CAST(N'2023-04-07T01:19:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (28, 27, N'LoggedIn', CAST(N'2023-04-07T01:47:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (29, 28, N'LoggedIn', CAST(N'2023-04-09T00:57:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (30, 29, N'LoggedIn', CAST(N'2023-04-09T01:12:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (31, 29, N'LoggedOut', CAST(N'2023-04-09T01:16:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (32, 30, N'LoggedIn', CAST(N'2023-04-09T01:17:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (33, 31, N'LoggedIn', CAST(N'2023-04-09T01:41:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (34, 32, N'LoggedIn', CAST(N'2023-04-09T02:03:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (35, 33, N'LoggedIn', CAST(N'2023-04-09T02:09:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (36, 34, N'LoggedIn', CAST(N'2023-04-09T23:52:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (37, 35, N'LoggedIn', CAST(N'2023-04-10T01:15:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (38, 36, N'LoggedIn', CAST(N'2023-04-12T10:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (39, 37, N'LoggedIn', CAST(N'2023-04-20T00:03:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (40, 38, N'LoggedIn', CAST(N'2023-04-20T00:40:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (41, 39, N'LoggedIn', CAST(N'2023-04-23T12:45:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (42, 40, N'LoggedIn', CAST(N'2023-04-23T13:22:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (43, 41, N'LoggedIn', CAST(N'2023-04-23T13:28:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (44, 42, N'LoggedIn', CAST(N'2023-04-25T14:33:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[UserAction_Log] OFF
GO
SET IDENTITY_INSERT [dbo].[Users_Log] ON 

INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (1, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T02:42:00' AS SmallDateTime), CAST(N'2023-04-01T02:45:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (2, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T02:45:00' AS SmallDateTime), CAST(N'2023-04-01T03:24:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (3, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T02:45:00' AS SmallDateTime), CAST(N'2023-04-01T03:24:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (4, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T03:24:00' AS SmallDateTime), CAST(N'2023-04-01T03:37:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (5, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T03:37:00' AS SmallDateTime), CAST(N'2023-04-01T03:38:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (6, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T03:38:00' AS SmallDateTime), CAST(N'2023-04-01T03:39:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (7, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-01T03:43:00' AS SmallDateTime), CAST(N'2023-04-03T00:39:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (8, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-03T00:39:00' AS SmallDateTime), CAST(N'2023-04-03T00:44:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (9, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-03T00:44:00' AS SmallDateTime), CAST(N'2023-04-03T23:34:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (10, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-03T23:34:00' AS SmallDateTime), CAST(N'2023-04-04T00:02:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (11, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-04T00:02:00' AS SmallDateTime), CAST(N'2023-04-04T00:11:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (12, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-04T00:11:00' AS SmallDateTime), CAST(N'2023-04-04T00:31:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (13, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-04T00:31:00' AS SmallDateTime), CAST(N'2023-04-04T00:41:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (14, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-04T00:41:00' AS SmallDateTime), CAST(N'2023-04-04T19:18:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (15, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-04T19:18:00' AS SmallDateTime), CAST(N'2023-04-05T00:03:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (16, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T00:03:00' AS SmallDateTime), CAST(N'2023-04-05T00:07:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (17, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T00:07:00' AS SmallDateTime), CAST(N'2023-04-05T00:21:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (18, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T00:21:00' AS SmallDateTime), CAST(N'2023-04-05T00:30:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (19, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T00:30:00' AS SmallDateTime), CAST(N'2023-04-05T19:59:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (20, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T19:59:00' AS SmallDateTime), CAST(N'2023-04-05T20:11:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (21, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T20:11:00' AS SmallDateTime), CAST(N'2023-04-05T20:12:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (22, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T20:12:00' AS SmallDateTime), CAST(N'2023-04-05T20:18:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (23, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T20:18:00' AS SmallDateTime), CAST(N'2023-04-05T20:18:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (24, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-05T20:18:00' AS SmallDateTime), CAST(N'2023-04-07T01:16:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (25, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-07T01:16:00' AS SmallDateTime), CAST(N'2023-04-07T01:19:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (26, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-07T01:19:00' AS SmallDateTime), CAST(N'2023-04-07T01:47:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (27, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-07T01:47:00' AS SmallDateTime), CAST(N'2023-04-09T00:57:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (28, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T00:57:00' AS SmallDateTime), CAST(N'2023-04-09T01:12:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (29, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T01:12:00' AS SmallDateTime), CAST(N'2023-04-09T01:16:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (30, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T01:17:00' AS SmallDateTime), CAST(N'2023-04-09T01:41:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (31, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T01:41:00' AS SmallDateTime), CAST(N'2023-04-09T02:03:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (32, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T02:03:00' AS SmallDateTime), CAST(N'2023-04-09T02:09:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (33, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T02:09:00' AS SmallDateTime), CAST(N'2023-04-09T23:52:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (34, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-09T23:52:00' AS SmallDateTime), CAST(N'2023-04-10T01:15:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (35, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-10T01:15:00' AS SmallDateTime), CAST(N'2023-04-12T10:29:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (36, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-12T10:29:00' AS SmallDateTime), CAST(N'2023-04-20T00:03:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (37, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-20T00:03:00' AS SmallDateTime), CAST(N'2023-04-20T00:40:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (38, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-20T00:40:00' AS SmallDateTime), CAST(N'2023-04-23T12:45:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (39, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-23T12:45:00' AS SmallDateTime), CAST(N'2023-04-23T13:22:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (40, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-23T13:22:00' AS SmallDateTime), CAST(N'2023-04-23T13:28:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (41, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-23T13:28:00' AS SmallDateTime), CAST(N'2023-04-25T14:33:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (42, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-25T14:33:00' AS SmallDateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users_Log] OFF
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
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Grave] FOREIGN KEY([GraveId])
REFERENCES [dbo].[Grave] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Grave]
GO
ALTER TABLE [dbo].[SaleOrder]  WITH CHECK ADD  CONSTRAINT [FK_SaleOrder_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([customer_ID])
GO
ALTER TABLE [dbo].[SaleOrder] CHECK CONSTRAINT [FK_SaleOrder_Customer]
GO
ALTER TABLE [dbo].[UserAction_Log]  WITH CHECK ADD  CONSTRAINT [FK_Users_Log_UserAction_Log] FOREIGN KEY([UserLogId])
REFERENCES [dbo].[Users_Log] ([ID])
GO
ALTER TABLE [dbo].[UserAction_Log] CHECK CONSTRAINT [FK_Users_Log_UserAction_Log]
GO
ALTER TABLE [dbo].[Users_Log]  WITH CHECK ADD  CONSTRAINT [FK_Id_Users_Log] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Users_Log] CHECK CONSTRAINT [FK_Id_Users_Log]
GO
USE [master]
GO
ALTER DATABASE [db_fyp] SET  READ_WRITE 
GO
