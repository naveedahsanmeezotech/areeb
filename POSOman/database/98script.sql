USE [master]
GO
/****** Object:  Database [db_fyp]    Script Date: 12-May-23 9:29:19 AM ******/
CREATE DATABASE [db_fyp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_fyp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_fyp.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_fyp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_fyp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_fyp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_fyp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_fyp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_fyp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_fyp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_fyp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_fyp] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_fyp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_fyp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_fyp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_fyp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_fyp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_fyp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_fyp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_fyp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_fyp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_fyp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_fyp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_fyp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_fyp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_fyp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_fyp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_fyp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_fyp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_fyp] SET RECOVERY FULL 
GO
ALTER DATABASE [db_fyp] SET  MULTI_USER 
GO
ALTER DATABASE [db_fyp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_fyp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_fyp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_fyp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_fyp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_fyp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_fyp', N'ON'
GO
ALTER DATABASE [db_fyp] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_fyp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_fyp]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12-May-23 9:29:19 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Grave]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Grave_Size]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Grave_Status]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[PaymentCard]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Purchase]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[PurchaseDetail]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Quotation]    Script Date: 12-May-23 9:29:20 AM ******/
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
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuotationDetail]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[SaleOrder]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[StockLog]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[UserAction_Log]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Users_Log]    Script Date: 12-May-23 9:29:20 AM ******/
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 12-May-23 9:29:20 AM ******/
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

INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [GraveId], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveSizeId]) VALUES (2058, N'aaa', N'bbbbb', N'03122370360', N'rao12@gmail.com', N'2222222222222', CAST(N'2023-04-30T19:33:56.220' AS DateTime), N'Karachi3', N'Pakistan1', N'42201-0770125-3', CAST(N'2023-04-25' AS Date), 2, CAST(N'2023-05-01' AS Date), CAST(N'2023-04-30' AS Date), N'44444444444', N'42201-0770125-8', N'123111111', CAST(N'2023-04-26' AS Date), CAST(N'2023-04-28' AS Date), N'Booked', 3)
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [GraveId], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveSizeId]) VALUES (2059, N'1``', N'21', N'03122370860', N'rao@gmail.com', N'123', CAST(N'2023-05-02T09:08:05.933' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-8', CAST(N'2023-05-01' AS Date), 4, CAST(N'2023-05-25' AS Date), CAST(N'2023-05-02' AS Date), N'123', N'42201-0770125-8', N'qwe', CAST(N'2023-05-02' AS Date), CAST(N'2023-05-01' AS Date), N'Booked', 1)
INSERT [dbo].[Customer] ([customer_ID], [first_name], [last_name], [Contact], [Email], [Address], [Creation_Date], [city], [country], [cnic], [date_of_birth], [GraveId], [DeliveryDate], [OrderDate], [DeceasedPerson], [DeceasedCnic], [ReasonOfDeath], [DateofDeath], [DeceasedDateofBirth], [Status], [GraveSizeId]) VALUES (2060, N'123', N'231234', N'03122370860', N'rao132@gmail.com', N'2314', CAST(N'2023-05-02T09:08:41.413' AS DateTime), N'Karachi', N'Pakistan', N'42201-0770125-9', CAST(N'2023-05-02' AS Date), 3, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-02' AS Date), NULL, NULL, NULL, NULL, NULL, N'Reserved', 3)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Grave] ON 

INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (1, 1, N'A-1', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (2, 1, N'A-2', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (3, 1, N'A-3', 3)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (4, 1, N'B-57', 2)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (5, 2, N'B-52', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (6, 2, N'B-59', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (7, 2, N'B-68', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (8, 2, N'C-65', 1)
INSERT [dbo].[Grave] ([Id], [Section_Id], [Grave_Name], [Grave_Status_Id]) VALUES (9, 1, N'A-5', 1)
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
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (1, N'block', N's', N'50')
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (2, N'Cement', N'1', N'56')
INSERT [dbo].[Product] ([Id], [MaterialName], [Description], [UnitOfMeasure]) VALUES (3, N'PIPE', N'1', N'60')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate]) VALUES (1013, 2000, NULL, CAST(N'2023-05-12T09:21:20.633' AS DateTime), NULL, 9001, CAST(66.00 AS Decimal(18, 2)), 1, 1001, NULL, NULL, NULL)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate]) VALUES (1014, 2001, NULL, CAST(N'2023-05-12T09:21:37.953' AS DateTime), NULL, 9000, CAST(2658.00 AS Decimal(18, 2)), 0, 1000, NULL, NULL, NULL)
INSERT [dbo].[Purchase] ([Id], [PurchaseNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status], [QutotationReferenceNo], [GR], [DocumnetDate], [PostingDate]) VALUES (1015, 2001, NULL, CAST(N'2023-05-12T09:21:37.953' AS DateTime), NULL, 9000, CAST(1998.00 AS Decimal(18, 2)), 2, 1000, 21, CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2023-05-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] ON 

INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (19, 1013, N'Cement', 2, 2, CAST(33.00 AS Decimal(18, 2)), CAST(66.00 AS Decimal(18, 2)), N'31', N'133', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (20, 1014, N'block', 1, 5, CAST(2.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'1', N'222', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (21, 1014, N'PIPE', 3, 8, CAST(331.00 AS Decimal(18, 2)), CAST(2648.00 AS Decimal(18, 2)), N'31', N'33', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (22, 1015, N'block', 1, 6, CAST(2.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'1', N'222', NULL)
INSERT [dbo].[PurchaseDetail] ([Id], [PurchaseId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit], [Remark]) VALUES (23, 1015, N'PIPE', 3, 6, CAST(331.00 AS Decimal(18, 2)), CAST(1986.00 AS Decimal(18, 2)), N'31', N'33', NULL)
SET IDENTITY_INSERT [dbo].[PurchaseDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Quotation] ON 

INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status]) VALUES (1023, 1000, NULL, CAST(N'2023-05-12T09:21:02.883' AS DateTime), NULL, 9000, CAST(333.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Quotation] ([Id], [QuotationNo], [ReferenceNumber], [DateIssued], [ExpireDate], [VendorId], [TotalAmount], [Status]) VALUES (1024, 1001, NULL, CAST(N'2023-05-12T09:21:12.163' AS DateTime), NULL, 9001, CAST(33.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Quotation] OFF
GO
SET IDENTITY_INSERT [dbo].[QuotationDetail] ON 

INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (37, 1023, N'block', 1, 1, CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'1', N'222')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (38, 1023, N'PIPE', 3, 1, CAST(331.00 AS Decimal(18, 2)), CAST(331.00 AS Decimal(18, 2)), N'31', N'33')
INSERT [dbo].[QuotationDetail] ([Id], [QuotationId], [MaterailName], [MaterailId], [Qty], [Price], [Amount], [Description], [MeasureOfUnit]) VALUES (39, 1024, N'Cement', 2, 1, CAST(33.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), N'31', N'133')
SET IDENTITY_INSERT [dbo].[QuotationDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleOrder] ON 

INSERT [dbo].[SaleOrder] ([Id], [CustomerId], [DeliveryDate], [OrderDate]) VALUES (3021, 2058, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[SaleOrder] ([Id], [CustomerId], [DeliveryDate], [OrderDate]) VALUES (3022, 2059, CAST(N'2023-05-25T00:00:00.000' AS DateTime), CAST(N'2023-05-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SaleOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([Id], [Section]) VALUES (1, N'A')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (2, N'B')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (3, N'C')
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[StockLog] ON 

INSERT [dbo].[StockLog] ([Id], [MaterailId], [MaterailName], [StockIn], [StockOut], [Status], [Description]) VALUES (4, 1, N'block', 6, NULL, 1, N'1         ')
INSERT [dbo].[StockLog] ([Id], [MaterailId], [MaterailName], [StockIn], [StockOut], [Status], [Description]) VALUES (5, 3, N'PIPE', 6, NULL, 1, N'31        ')
SET IDENTITY_INSERT [dbo].[StockLog] OFF
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
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (45, 43, N'LoggedIn', CAST(N'2023-04-30T20:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (46, 43, N'LoggedOut', CAST(N'2023-04-30T20:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (47, 44, N'LoggedIn', CAST(N'2023-04-30T20:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (48, 44, N'LoggedOut', CAST(N'2023-04-30T20:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (49, 45, N'LoggedIn', CAST(N'2023-04-30T20:34:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (50, 46, N'LoggedIn', CAST(N'2023-05-02T09:01:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (51, 47, N'LoggedIn', CAST(N'2023-05-02T16:44:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (52, 48, N'LoggedIn', CAST(N'2023-05-03T09:48:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (53, 49, N'LoggedIn', CAST(N'2023-05-03T22:12:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (54, 50, N'LoggedIn', CAST(N'2023-05-03T22:21:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (55, 51, N'LoggedIn', CAST(N'2023-05-03T22:27:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (56, 52, N'LoggedIn', CAST(N'2023-05-03T23:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (57, 53, N'LoggedIn', CAST(N'2023-05-04T10:27:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (58, 54, N'LoggedIn', CAST(N'2023-05-04T10:30:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (59, 55, N'LoggedIn', CAST(N'2023-05-04T10:33:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (60, 56, N'LoggedIn', CAST(N'2023-05-04T10:34:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (61, 57, N'LoggedIn', CAST(N'2023-05-04T19:54:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (62, 58, N'LoggedIn', CAST(N'2023-05-04T20:12:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (63, 59, N'LoggedIn', CAST(N'2023-05-04T20:21:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (64, 60, N'LoggedIn', CAST(N'2023-05-04T20:24:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (65, 61, N'LoggedIn', CAST(N'2023-05-04T20:27:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (66, 62, N'LoggedIn', CAST(N'2023-05-04T20:28:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (67, 63, N'LoggedIn', CAST(N'2023-05-07T00:45:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (68, 64, N'LoggedIn', CAST(N'2023-05-07T00:49:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (69, 65, N'LoggedIn', CAST(N'2023-05-07T00:56:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (70, 66, N'LoggedIn', CAST(N'2023-05-07T09:21:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (71, 67, N'LoggedIn', CAST(N'2023-05-07T09:39:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (72, 68, N'LoggedIn', CAST(N'2023-05-07T14:13:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (73, 69, N'LoggedIn', CAST(N'2023-05-07T15:01:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (74, 70, N'LoggedIn', CAST(N'2023-05-07T15:02:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (75, 71, N'LoggedIn', CAST(N'2023-05-10T11:34:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (76, 72, N'LoggedIn', CAST(N'2023-05-10T11:55:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (77, 73, N'LoggedIn', CAST(N'2023-05-10T12:02:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (78, 74, N'LoggedIn', CAST(N'2023-05-10T12:04:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (79, 75, N'LoggedIn', CAST(N'2023-05-10T12:26:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (80, 76, N'LoggedIn', CAST(N'2023-05-10T12:27:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (81, 77, N'LoggedIn', CAST(N'2023-05-10T12:31:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (82, 78, N'LoggedIn', CAST(N'2023-05-10T12:33:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (83, 79, N'LoggedIn', CAST(N'2023-05-11T00:27:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (84, 80, N'LoggedIn', CAST(N'2023-05-11T00:29:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (85, 81, N'LoggedIn', CAST(N'2023-05-11T00:34:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (86, 82, N'LoggedIn', CAST(N'2023-05-11T00:35:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (87, 83, N'LoggedIn', CAST(N'2023-05-11T19:54:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (88, 84, N'LoggedIn', CAST(N'2023-05-11T20:07:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (89, 85, N'LoggedIn', CAST(N'2023-05-11T21:26:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (90, 86, N'LoggedIn', CAST(N'2023-05-11T21:31:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (91, 87, N'LoggedIn', CAST(N'2023-05-11T21:34:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (92, 88, N'LoggedIn', CAST(N'2023-05-11T21:44:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (93, 89, N'LoggedIn', CAST(N'2023-05-11T23:04:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (94, 90, N'LoggedIn', CAST(N'2023-05-11T23:04:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (95, 91, N'LoggedIn', CAST(N'2023-05-12T06:55:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (96, 92, N'LoggedIn', CAST(N'2023-05-12T06:56:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (97, 93, N'LoggedIn', CAST(N'2023-05-12T06:59:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (98, 94, N'LoggedIn', CAST(N'2023-05-12T07:03:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (99, 95, N'LoggedIn', CAST(N'2023-05-12T07:42:00' AS SmallDateTime))
GO
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (100, 96, N'LoggedIn', CAST(N'2023-05-12T07:47:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (101, 97, N'LoggedIn', CAST(N'2023-05-12T07:49:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (102, 98, N'LoggedIn', CAST(N'2023-05-12T08:03:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (103, 99, N'LoggedIn', CAST(N'2023-05-12T08:03:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (104, 100, N'LoggedIn', CAST(N'2023-05-12T08:04:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (105, 101, N'LoggedIn', CAST(N'2023-05-12T08:05:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (106, 102, N'LoggedIn', CAST(N'2023-05-12T08:10:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (107, 103, N'LoggedIn', CAST(N'2023-05-12T08:32:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (108, 104, N'LoggedIn', CAST(N'2023-05-12T08:33:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (109, 105, N'LoggedIn', CAST(N'2023-05-12T08:55:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (110, 106, N'LoggedIn', CAST(N'2023-05-12T09:05:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (111, 107, N'LoggedIn', CAST(N'2023-05-12T09:07:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (112, 108, N'LoggedIn', CAST(N'2023-05-12T09:08:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (113, 109, N'LoggedIn', CAST(N'2023-05-12T09:09:00' AS SmallDateTime))
INSERT [dbo].[UserAction_Log] ([ID], [UserLogId], [UserAction], [ActionDate]) VALUES (114, 110, N'LoggedIn', CAST(N'2023-05-12T09:21:00' AS SmallDateTime))
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
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (42, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-25T14:33:00' AS SmallDateTime), NULL, NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (43, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-30T20:29:00' AS SmallDateTime), CAST(N'2023-04-30T20:29:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (44, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-30T20:29:00' AS SmallDateTime), CAST(N'2023-04-30T20:29:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (45, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-04-30T20:34:00' AS SmallDateTime), CAST(N'2023-05-02T09:01:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (46, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-02T09:01:00' AS SmallDateTime), CAST(N'2023-05-02T16:44:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (47, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-02T16:44:00' AS SmallDateTime), CAST(N'2023-05-03T09:48:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (48, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-03T09:48:00' AS SmallDateTime), CAST(N'2023-05-03T22:12:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (49, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-03T22:12:00' AS SmallDateTime), CAST(N'2023-05-03T22:21:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (50, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-03T22:21:00' AS SmallDateTime), CAST(N'2023-05-03T22:27:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (51, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-03T22:27:00' AS SmallDateTime), CAST(N'2023-05-03T23:29:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (52, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-03T23:29:00' AS SmallDateTime), CAST(N'2023-05-04T10:27:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (53, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T10:27:00' AS SmallDateTime), CAST(N'2023-05-04T10:30:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (54, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T10:30:00' AS SmallDateTime), CAST(N'2023-05-04T10:33:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (55, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T10:33:00' AS SmallDateTime), CAST(N'2023-05-04T10:34:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (56, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T10:34:00' AS SmallDateTime), CAST(N'2023-05-04T19:54:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (57, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T19:54:00' AS SmallDateTime), CAST(N'2023-05-04T20:12:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (58, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T20:12:00' AS SmallDateTime), CAST(N'2023-05-04T20:21:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (59, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T20:21:00' AS SmallDateTime), CAST(N'2023-05-04T20:24:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (60, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T20:24:00' AS SmallDateTime), CAST(N'2023-05-04T20:27:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (61, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T20:27:00' AS SmallDateTime), CAST(N'2023-05-04T20:28:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (62, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-04T20:28:00' AS SmallDateTime), CAST(N'2023-05-07T00:45:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (63, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T00:45:00' AS SmallDateTime), CAST(N'2023-05-07T00:49:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (64, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T00:49:00' AS SmallDateTime), CAST(N'2023-05-07T00:56:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (65, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T00:56:00' AS SmallDateTime), CAST(N'2023-05-07T09:21:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (66, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T09:21:00' AS SmallDateTime), CAST(N'2023-05-07T09:39:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (67, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T09:39:00' AS SmallDateTime), CAST(N'2023-05-07T14:13:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (68, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T14:13:00' AS SmallDateTime), CAST(N'2023-05-07T15:01:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (69, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T15:01:00' AS SmallDateTime), CAST(N'2023-05-07T15:02:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (70, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-07T15:02:00' AS SmallDateTime), CAST(N'2023-05-10T11:34:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (71, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T11:34:00' AS SmallDateTime), CAST(N'2023-05-10T11:55:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (72, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T11:55:00' AS SmallDateTime), CAST(N'2023-05-10T12:02:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (73, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T12:02:00' AS SmallDateTime), CAST(N'2023-05-10T12:04:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (74, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T12:04:00' AS SmallDateTime), CAST(N'2023-05-10T12:26:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (75, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T12:26:00' AS SmallDateTime), CAST(N'2023-05-10T12:27:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (76, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T12:27:00' AS SmallDateTime), CAST(N'2023-05-10T12:31:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (77, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T12:31:00' AS SmallDateTime), CAST(N'2023-05-10T12:33:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (78, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-10T12:33:00' AS SmallDateTime), CAST(N'2023-05-11T00:27:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (79, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T00:27:00' AS SmallDateTime), CAST(N'2023-05-11T00:29:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (80, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T00:29:00' AS SmallDateTime), CAST(N'2023-05-11T00:34:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (81, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T00:34:00' AS SmallDateTime), CAST(N'2023-05-11T00:35:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (82, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T00:35:00' AS SmallDateTime), CAST(N'2023-05-11T19:54:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (83, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T19:54:00' AS SmallDateTime), CAST(N'2023-05-11T20:07:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (84, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T20:07:00' AS SmallDateTime), CAST(N'2023-05-11T21:26:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (85, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T21:26:00' AS SmallDateTime), CAST(N'2023-05-11T21:30:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (86, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T21:30:00' AS SmallDateTime), CAST(N'2023-05-11T21:34:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (87, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T21:34:00' AS SmallDateTime), CAST(N'2023-05-11T21:44:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (88, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T21:44:00' AS SmallDateTime), CAST(N'2023-05-11T23:04:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (89, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T23:04:00' AS SmallDateTime), CAST(N'2023-05-11T23:04:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (90, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-11T23:04:00' AS SmallDateTime), CAST(N'2023-05-12T06:55:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (91, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T06:55:00' AS SmallDateTime), CAST(N'2023-05-12T06:56:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (92, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T06:56:00' AS SmallDateTime), CAST(N'2023-05-12T06:59:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (93, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T06:59:00' AS SmallDateTime), CAST(N'2023-05-12T07:03:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (94, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T07:03:00' AS SmallDateTime), CAST(N'2023-05-12T07:42:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (95, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T07:42:00' AS SmallDateTime), CAST(N'2023-05-12T07:47:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (96, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T07:47:00' AS SmallDateTime), CAST(N'2023-05-12T07:49:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (97, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T07:49:00' AS SmallDateTime), CAST(N'2023-05-12T08:03:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (98, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:03:00' AS SmallDateTime), CAST(N'2023-05-12T08:03:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (99, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:03:00' AS SmallDateTime), CAST(N'2023-05-12T08:04:00' AS SmallDateTime), NULL, 0)
GO
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (100, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:04:00' AS SmallDateTime), CAST(N'2023-05-12T08:05:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (101, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:05:00' AS SmallDateTime), CAST(N'2023-05-12T08:10:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (102, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:10:00' AS SmallDateTime), CAST(N'2023-05-12T08:32:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (103, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:32:00' AS SmallDateTime), CAST(N'2023-05-12T08:33:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (104, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:33:00' AS SmallDateTime), CAST(N'2023-05-12T08:55:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (105, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T08:55:00' AS SmallDateTime), CAST(N'2023-05-12T09:05:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (106, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T09:05:00' AS SmallDateTime), CAST(N'2023-05-12T09:07:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (107, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T09:07:00' AS SmallDateTime), CAST(N'2023-05-12T09:08:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (108, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T09:08:00' AS SmallDateTime), CAST(N'2023-05-12T09:09:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (109, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T09:09:00' AS SmallDateTime), CAST(N'2023-05-12T09:21:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[Users_Log] ([ID], [UserId], [LoginTime], [LogoutTime], [UserIP], [IsLogin]) VALUES (110, N'18aea5a1-e74d-446f-bbdf-0220c34bc120', CAST(N'2023-05-12T09:21:00' AS SmallDateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users_Log] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address]) VALUES (9000, N'naveed', N'02', N'25', N'1', NULL)
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Contact_Person], [Vendor_Contact], [Vendor_Payment_Type], [Address]) VALUES (9001, N'imran', N'2', N'5', NULL, NULL)
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
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Grave] FOREIGN KEY([GraveId])
REFERENCES [dbo].[Grave] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Grave]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Grave_Size] FOREIGN KEY([GraveSizeId])
REFERENCES [dbo].[Grave_Size] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Grave_Size]
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
