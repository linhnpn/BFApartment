USE [master]
GO
/****** Object:  Database [BFApartment]    Script Date: 8/2/2022 8:33:13 PM ******/
CREATE DATABASE [BFApartment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BFApartment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BFApartment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BFApartment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BFApartment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BFApartment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BFApartment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BFApartment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BFApartment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BFApartment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BFApartment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BFApartment] SET ARITHABORT OFF 
GO
ALTER DATABASE [BFApartment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BFApartment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BFApartment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BFApartment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BFApartment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BFApartment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BFApartment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BFApartment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BFApartment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BFApartment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BFApartment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BFApartment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BFApartment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BFApartment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BFApartment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BFApartment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BFApartment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BFApartment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BFApartment] SET  MULTI_USER 
GO
ALTER DATABASE [BFApartment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BFApartment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BFApartment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BFApartment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BFApartment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BFApartment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BFApartment] SET QUERY_STORE = OFF
GO
USE [BFApartment]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[userId] [varchar](128) NOT NULL,
	[password] [varchar](512) NULL,
	[status] [bit] NULL,
	[roleId] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apart_Troubles]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apart_Troubles](
	[apartmentId] [varchar](25) NULL,
	[troubleId] [varchar](25) NULL,
	[date] [date] NULL,
	[detail] [nvarchar](2048) NULL,
	[status] [bit] NULL,
	[tranId] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tranId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[apartmentId] [varchar](25) NOT NULL,
	[size] [int] NULL,
	[image] [varchar](1024) NULL,
	[status] [bit] NULL,
	[apartmentTypeId] [varchar](25) NULL,
	[buildingId] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[apartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentTypes]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentTypes](
	[apartmentTypeId] [varchar](25) NOT NULL,
	[typeName] [nvarchar](512) NULL,
	[rentPrice] [float] NULL,
	[salePrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[apartmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[accountNum] [varchar](25) NULL,
	[cardNum] [varchar](25) NOT NULL,
	[PIN] [varchar](6) NULL,
	[cvv] [varchar](3) NULL,
	[name] [nvarchar](512) NULL,
	[accountBlance] [float] NULL,
	[bankId] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cardNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[bankId] [varchar](50) NOT NULL,
	[bankName] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[bankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[billId] [varchar](25) NOT NULL,
	[serviceId] [varchar](25) NOT NULL,
	[priceDetail] [float] NULL,
 CONSTRAINT [Ma2] PRIMARY KEY CLUSTERED 
(
	[billId] ASC,
	[serviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[billId] [varchar](25) NOT NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
	[date] [date] NULL,
	[apartmentId] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillServiceDetails]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillServiceDetails](
	[oldIndex] [int] NULL,
	[newIndex] [int] NULL,
	[usagaIndex] [int] NULL,
	[date] [date] NULL,
	[serviceId] [varchar](25) NOT NULL,
	[billId] [varchar](25) NOT NULL,
 CONSTRAINT [primaryBill] PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC,
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[buildingId] [varchar](25) NOT NULL,
	[buildingName] [nvarchar](512) NULL,
	[numberOfApartment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[buildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[contractId] [varchar](25) NOT NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[status] [bit] NULL,
	[ownerId] [varchar](25) NULL,
	[apartmentId] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[contractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[ownerId] [varchar](25) NOT NULL,
	[fullName] [nvarchar](512) NULL,
	[dob] [date] NULL,
	[sex] [nvarchar](32) NULL,
	[job] [nvarchar](128) NULL,
	[phone] [varchar](16) NULL,
	[email] [varchar](128) NULL,
	[status] [bit] NULL,
	[userId] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[ownerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[requestId] [varchar](25) NOT NULL,
	[action] [nvarchar](32) NULL,
	[status] [bit] NULL,
	[ownerId] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Residents]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residents](
	[residentId] [varchar](25) NOT NULL,
	[fullName] [nvarchar](256) NULL,
	[dob] [date] NULL,
	[sex] [nvarchar](32) NULL,
	[job] [nvarchar](256) NULL,
	[phone] [varchar](16) NULL,
	[status] [bit] NULL,
	[requestId] [varchar](25) NULL,
	[ownerId] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[residentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [varchar](25) NOT NULL,
	[roleName] [nvarchar](128) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[serviceId] [varchar](25) NOT NULL,
	[serviceName] [nvarchar](256) NULL,
	[servicePrice] [float] NULL,
	[status] [bit] NULL,
	[date] [date] NULL,
	[typeId] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceTypes]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceTypes](
	[typeId] [varchar](20) NOT NULL,
	[typeName] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Troubles]    Script Date: 8/2/2022 8:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Troubles](
	[troubleId] [varchar](25) NOT NULL,
	[troubleName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[troubleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'abc', N'202cb962ac59075b964b07152d234b70', 0, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'admin', N'202cb962ac59075b964b07152d234b70', 1, N'AD')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'employee', N'202cb962ac59075b964b07152d234b70', 1, N'EM')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'employee_2', N'202cb962ac59075b964b07152d234b70', 1, N'EM')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'hoanghdm', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'khoadn', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'linhnpn', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'quanmd', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'thinhdnp', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'trieudh', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'user', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'zxc', N'202cb962ac59075b964b07152d234b70', 1, N'US')
GO
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM69', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 0, N'TRAN1')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM27', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 1, N'TRAN10')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM47', N'TB03', CAST(N'2022-11-11' AS Date), N'Mạng yếu', 1, N'TRAN11')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM67', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 0, N'TRAN12')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM39', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 1, N'TRAN13')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM35', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN14')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM47', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 0, N'TRAN15')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM73', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN16')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM27', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 0, N'TRAN17')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM15', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 0, N'TRAN18')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM26', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 0, N'TRAN19')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM45', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN2')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM62', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 1, N'TRAN20')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM33', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN21')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM37', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 1, N'TRAN22')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM5', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 0, N'TRAN23')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM62', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 0, N'TRAN24')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM57', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 1, N'TRAN25')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM10', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 1, N'TRAN26')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM37', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 1, N'TRAN27')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM19', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN28')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM29', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN29')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM8', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 1, N'TRAN3')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM14', N'TB03', CAST(N'2022-11-11' AS Date), N'Mạng yếu', 1, N'TRAN30')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM71', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 0, N'TRAN31')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM68', N'TB03', CAST(N'2022-11-11' AS Date), N'Mạng yếu', 1, N'TRAN32')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM71', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 0, N'TRAN33')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM45', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 0, N'TRAN34')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM28', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 1, N'TRAN35')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM13', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN36')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM61', N'TB03', CAST(N'2022-11-11' AS Date), N'Mạng yếu', 0, N'TRAN37')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM16', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN38')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM43', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN39')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM22', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN4')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM64', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 1, N'TRAN40')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM4', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 1, N'TRAN41')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM56', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 1, N'TRAN42')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM75', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN43')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM43', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN44')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM14', N'TB04', CAST(N'2022-11-11' AS Date), N'Mất TV', 0, N'TRAN45')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM15', N'TB05', CAST(N'2022-11-11' AS Date), N'Tróc sơn tường', 1, N'TRAN46')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM73', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 1, N'TRAN47')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM62', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 0, N'TRAN48')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM75', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 1, N'TRAN49')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM28', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 1, N'TRAN5')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM3', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 0, N'TRAN50')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM35', N'TB03', CAST(N'2022-06-11' AS Date), N'Mạng siêu yếu', 1, N'TRAN51')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM35', N'TB04', CAST(N'2022-06-12' AS Date), N'Mất cắp', 1, N'TRAN52')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM35', N'TB03', CAST(N'2022-06-21' AS Date), N'Intenet yếu', 1, N'TRAN53')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM35', N'TB03', CAST(N'2022-07-05' AS Date), N'Hihi', 0, N'TRAN54')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM53', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 0, N'TRAN6')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM17', N'TB06', CAST(N'2022-11-11' AS Date), N'Lỗi sai thông tin', 0, N'TRAN7')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM48', N'TB02', CAST(N'2022-11-11' AS Date), N'Bễ ống nước', 1, N'TRAN8')
INSERT [dbo].[Apart_Troubles] ([apartmentId], [troubleId], [date], [detail], [status], [tranId]) VALUES (N'APM16', N'TB01', CAST(N'2022-11-11' AS Date), N'Mất điện', 1, N'TRAN9')
GO
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM1', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 0, N'AP01', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM10', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 0, N'AP01', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM11', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 0, N'AP01', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM12', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM13', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM14', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 0, N'AP01', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM15', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM16', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM17', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM18', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM19', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 0, N'AP01', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM2', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM20', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM21', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM22', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM23', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM24', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM25', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM26', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM27', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM28', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM29', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM3', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM30', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM31', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM32', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM33', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM34', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM35', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM36', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM37', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM38', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM39', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM4', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM40', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM41', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM42', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM43', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM44', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM45', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP02', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM46', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP04', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM47', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP04', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM48', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP04', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM49', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP04', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM5', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM50', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP04', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM51', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM52', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM53', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM54', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM55', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU01')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM56', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM57', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM58', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM59', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM6', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM60', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM61', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM62', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM63', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM64', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM65', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU03')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM66', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM67', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM68', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM69', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM7', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM70', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU04')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM71', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM72', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM73', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 0, N'AP03', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM74', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM75', 120, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP03', N'BU05')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM8', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU02')
INSERT [dbo].[Apartments] ([apartmentId], [size], [image], [status], [apartmentTypeId], [buildingId]) VALUES (N'APM9', 100, N'https://noithatviet24h.vn/wp-content/uploads/2020/08/hinh-anh-can-ho-chung-cu-dep-3.jpg', 1, N'AP01', N'BU02')
GO
INSERT [dbo].[ApartmentTypes] ([apartmentTypeId], [typeName], [rentPrice], [salePrice]) VALUES (N'AP01', N'Căn hộ cao cấp', 3000000, 3000000000)
INSERT [dbo].[ApartmentTypes] ([apartmentTypeId], [typeName], [rentPrice], [salePrice]) VALUES (N'AP02', N'Căn hộ trung cấp', 1, 1)
INSERT [dbo].[ApartmentTypes] ([apartmentTypeId], [typeName], [rentPrice], [salePrice]) VALUES (N'AP03', N'Căn hộ thông minh', 1, 1)
INSERT [dbo].[ApartmentTypes] ([apartmentTypeId], [typeName], [rentPrice], [salePrice]) VALUES (N'AP04', N'Căn hộ cao ốc', 4500000, 2500000000)
GO
INSERT [dbo].[BankAccounts] ([accountNum], [cardNum], [PIN], [cvv], [name], [accountBlance], [bankId]) VALUES (N'01238454', N'4238643463422', N'123456', N'465', N'Nguyễn Phương Nhật Linh', 3010500000, N'BANK01')
INSERT [dbo].[BankAccounts] ([accountNum], [cardNum], [PIN], [cvv], [name], [accountBlance], [bankId]) VALUES (N'01238464', N'4238643463423', N'654321', N'985', N'Đặng Nguyễn Phú Thịnh', 2000000000, N'BANK02')
INSERT [dbo].[BankAccounts] ([accountNum], [cardNum], [PIN], [cvv], [name], [accountBlance], [bankId]) VALUES (N'01238474', N'4238643463424', N'234567', N'242', N'Huỳnh Đỗ Minh Hoàng', 4000000000, N'BANK02')
INSERT [dbo].[BankAccounts] ([accountNum], [cardNum], [PIN], [cvv], [name], [accountBlance], [bankId]) VALUES (N'01238484', N'4238643463425', N'765432', N'454', N'Đỗ Hải Triều', 2989498000, N'BANK01')
GO
INSERT [dbo].[Banks] ([bankId], [bankName]) VALUES (N'BANK01', N'VietcomBank')
INSERT [dbo].[Banks] ([bankId], [bankName]) VALUES (N'BANK02', N'Tien Phong Bank')
GO
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'1', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'1', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'10', N'E01', 2600)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'10', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'10', N'W01', 13000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'11', N'E01', 2600)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'11', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'11', N'W01', 13000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'2', N'E01', 100000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'2', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'2', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'2', N'W01', 100000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'3', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'3', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'4', N'E01', 30000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'4', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'4', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'4', N'W01', 144000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'5', N'E01', 47500)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'5', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'5', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'5', N'W01', 276000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'6', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'6', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'7', N'E01', 30000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'7', N'W01', 144000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'8', N'E01', 2500)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'8', N'W01', 12000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'9', N'E01', 30000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'9', N'S01', 300000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'9', N'S02', 220000)
INSERT [dbo].[BillDetails] ([billId], [serviceId], [priceDetail]) VALUES (N'9', N'W01', 144000)
GO
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'1', 1450000, 0, CAST(N'2022-07-29' AS Date), N'APM17')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'10', 15600, 0, CAST(N'2022-08-02' AS Date), N'APM17')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'11', 15600, 0, CAST(N'2022-08-02' AS Date), N'APM37')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'2', 520000, 0, CAST(N'2022-01-02' AS Date), N'APM37')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'3', 394000, 0, CAST(N'2022-07-29' AS Date), N'APM59')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'4', 174000, 0, CAST(N'2022-07-29' AS Date), N'APM64')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'5', 323500, 0, CAST(N'2022-07-29' AS Date), N'APM59')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'6', 174000, 0, CAST(N'2022-07-29' AS Date), N'APM17')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'7', 174000, 0, CAST(N'2022-07-29' AS Date), N'APM17')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'8', 14500, 0, CAST(N'2022-07-29' AS Date), N'APM59')
INSERT [dbo].[Bills] ([billId], [total], [status], [date], [apartmentId]) VALUES (N'9', 174000, 1, CAST(N'2022-07-30' AS Date), N'APM35')
GO
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (12, 13, 1, CAST(N'2022-08-02' AS Date), N'E01', N'10')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (9, 10, 1, CAST(N'2022-08-02' AS Date), N'E01', N'11')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 40, 40, CAST(N'2001-01-01' AS Date), N'E01', N'2')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 12, 12, CAST(N'2022-07-29' AS Date), N'E01', N'4')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 19, 19, CAST(N'2022-07-29' AS Date), N'E01', N'5')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 12, 12, CAST(N'2022-07-29' AS Date), N'E01', N'7')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (23, 24, 1, CAST(N'2022-07-29' AS Date), N'E01', N'8')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 12, 12, CAST(N'2022-07-30' AS Date), N'E01', N'9')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (12, 13, 1, CAST(N'2022-08-02' AS Date), N'W01', N'10')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (40, 41, 1, CAST(N'2022-08-02' AS Date), N'W01', N'11')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 9, 9, CAST(N'2001-01-01' AS Date), N'W01', N'2')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 12, 12, CAST(N'2022-07-29' AS Date), N'W01', N'4')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 23, 23, CAST(N'2022-07-29' AS Date), N'W01', N'5')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 12, 12, CAST(N'2022-07-29' AS Date), N'W01', N'7')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (19, 20, 1, CAST(N'2022-07-29' AS Date), N'W01', N'8')
INSERT [dbo].[BillServiceDetails] ([oldIndex], [newIndex], [usagaIndex], [date], [serviceId], [billId]) VALUES (0, 12, 12, CAST(N'2022-07-30' AS Date), N'W01', N'9')
GO
INSERT [dbo].[Buildings] ([buildingId], [buildingName], [numberOfApartment]) VALUES (N'BU01', N'Tòa nhà 01', 3)
INSERT [dbo].[Buildings] ([buildingId], [buildingName], [numberOfApartment]) VALUES (N'BU02', N'Tòa nhà 02', 3)
INSERT [dbo].[Buildings] ([buildingId], [buildingName], [numberOfApartment]) VALUES (N'BU03', N'Tòa nhà 03', 3)
INSERT [dbo].[Buildings] ([buildingId], [buildingName], [numberOfApartment]) VALUES (N'BU04', N'Tòa nhà 04', 3)
INSERT [dbo].[Buildings] ([buildingId], [buildingName], [numberOfApartment]) VALUES (N'BU05', N'Tòa nhà 05', 3)
GO
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT01', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-13' AS Date), 1, N'OWN1', N'APM35')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT02', CAST(N'2022-08-04' AS Date), NULL, 1, N'OWN3', N'APM37')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT023', CAST(N'2022-07-23' AS Date), CAST(N'2022-08-07' AS Date), 1, N'OWN6', N'APM17')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT03', CAST(N'2022-06-21' AS Date), NULL, 1, N'OWN4', N'APM49')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT04', CAST(N'1999-01-01' AS Date), NULL, 1, N'OWN2', N'APM59')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT05', CAST(N'1999-01-01' AS Date), NULL, 1, N'OWN5', N'APM64')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT06', CAST(N'2022-08-24' AS Date), NULL, 1, N'OWN7', N'APM10')
INSERT [dbo].[Contracts] ([contractId], [startDate], [endDate], [status], [ownerId], [apartmentId]) VALUES (N'CT071', CAST(N'2022-08-15' AS Date), CAST(N'2022-08-26' AS Date), 1, N'OWN8', N'APM73')
GO
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN1', N'Nguyễn Thanh Tùng', CAST(N'2001-01-01' AS Date), N'male', N'Diễn viên', N'+84373568944', N'linhkjds@gmail.com', 1, N'user')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN2', N'Nguyễn Phương Nhật Linh', CAST(N'2001-03-10' AS Date), N'male', N'Cầu thủ', N'01234568', N'linhnpn@gmail.com', 1, N'linhnpn')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN3', N'Đỗ Hải Triều', CAST(N'2001-03-11' AS Date), N'male', N'Kỹ sư', N'01234569', N'trieudh@gmail.com', 1, N'trieudh')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN4', N'Đặng Nguyễn Phú Thịnh', CAST(N'2001-03-12' AS Date), N'male', N'Cầu thủ', N'01234561', N'thinhdnp@gmail.com', 1, N'thinhdnp')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN5', N'Huỳnh Đỗ Minh Hoàng', CAST(N'2001-01-13' AS Date), N'male', N'Nha sĩ', N'01234562', N'hoanghdm@gmail.com', 1, N'hoanghdm')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN6', N'Nguyễn Đăng Khoa', CAST(N'2001-01-01' AS Date), N'male', N'Cộng việc', N'3232425422', N'dfghtehhgfefwe', 1, N'khoadn')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN7', N'Đỗ Minh Quân', CAST(N'2001-01-01' AS Date), N'male', N'Học sinh', N'2324556767', N'lukyfgdfe', 1, N'quanmd')
INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], [sex], [job], [phone], [email], [status], [userId]) VALUES (N'OWN8', N'Lê Chí Hùng', CAST(N'2001-01-01' AS Date), N'male', N'Học sinh', N'3232425411', N'adfaasd', 1, N'zxc')
GO
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'22', N'delete', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'26', N'delete', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ001', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ002', N'add', 1, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ003', N'delete', 1, N'OWN3')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ004', N'delete', 1, N'OWN4')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ005', N'add', 1, N'OWN5')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ006', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ007', N'delete', 1, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ008', N'delete', 1, N'OWN3')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ009', N'add', 1, N'OWN4')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ010', N'add', 1, N'OWN5')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ011', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ012', N'add', 1, N'OWN3')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ013', N'delete', 1, N'OWN4')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ014', N'add', 1, N'OWN5')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ015', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ016', N'delete', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ017', N'add', 1, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ018', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ019', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ020', N'add', 1, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ021', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ023', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ024', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ025', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ027', N'delete', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ028', N'add', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ029', N'delete', 1, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ030', N'delete', 1, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ031', N'add', 1, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ032', N'delete', 0, N'OWN1')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ033', N'add', 0, N'OWN2')
INSERT [dbo].[Requests] ([requestId], [action], [status], [ownerId]) VALUES (N'REQ034', N'add', 1, N'OWN1')
GO
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES1', N'Nuỳnh Ngọc Hải Em', CAST(N'2001-01-01' AS Date), N'male', N'Công nhân', N'038424523', 1, N'REQ002', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES10', N'Nguyễn Văn Chí', CAST(N'2001-07-09' AS Date), N'male', N'Sinh viên', N'0857442281', 1, N'REQ006', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES11', N'Chí Thị Na', CAST(N'2001-01-09' AS Date), N'female', N'Bác si', N'0857442282', 1, N'REQ006', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES12', N'Đỗ Tấn Trung', CAST(N'2001-02-10' AS Date), N'male', N'Sinh viên', N'0857442283', 0, N'REQ006', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES13', N'Nguyễn Văn Phong', CAST(N'2001-01-09' AS Date), N'male', N'Y tá', N'0857442284', 1, N'REQ009', N'OWN4')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES14', N'Khánh Ly', CAST(N'2001-02-09' AS Date), N'female', N'Bác si', N'0857442285', 1, N'REQ009', N'OWN4')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES15', N'Trần Trung Hiếu', CAST(N'2001-03-09' AS Date), N'male', N'Ca si', N'0857442286', 1, N'REQ010', N'OWN5')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES16', N'Khánh Vy', CAST(N'2001-04-09' AS Date), N'female', N'Bác si', N'0857442287', 1, N'REQ010', N'OWN5')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES17', N'Hữu Chí', CAST(N'2001-05-09' AS Date), N'male', N'Sinh viên', N'0857442288', 0, N'REQ016', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES18', N'Thúy Ngân', CAST(N'2001-06-09' AS Date), N'female', N'FPT Boi', N'0857442289', 1, N'REQ011', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES19', N'Hữu Vĩnh', CAST(N'2001-07-09' AS Date), N'male', N'HUTECH Boi', N'0857442290', 1, N'REQ012', N'OWN3')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES2', N'Nguyễn Đào Anh Lâm', CAST(N'2001-06-09' AS Date), N'male', N'Sinh viên', N'0857442279', 1, N'REQ030', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES20', N'Kim Ngân', CAST(N'2001-08-09' AS Date), N'female', N'Bác sĩ', N'0857442291', 1, N'REQ012', N'OWN3')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES21', N'Bùi Hữu Đông', CAST(N'1999-09-09' AS Date), N'male', N'Giảng viên', N'0857442292', 0, N'REQ014', N'OWN5')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES22', N'Hữu Trà', CAST(N'2001-07-10' AS Date), N'male', N'HUTECH Boi', N'0857442293', 0, N'REQ003', N'OWN3')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES23', N'Hà Tiên', CAST(N'2001-08-11' AS Date), N'female', N'Bác si', N'0857442294', 0, N'REQ003', N'OWN3')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES24', N'Xi Măng', CAST(N'2001-07-12' AS Date), N'male', N'HUTECH Boi', N'0857442295', 1, N'REQ004', N'OWN4')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES25', N'Công Thanh', CAST(N'2001-08-13' AS Date), N'female', N'Bác si', N'0857442296', 1, N'REQ004', N'OWN4')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES26', N'Thanh Nhàn', CAST(N'2001-07-14' AS Date), N'male', N'HUTECH Boi', N'0857442297', 0, N'REQ007', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES27', N'Nhàn Hạ', CAST(N'2001-08-15' AS Date), N'female', N'Bác si', N'0857442298', 0, N'REQ007', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES28', N'Hạ Thu', CAST(N'2001-07-16' AS Date), N'male', N'HUTECH Boi', N'0857442299', 0, N'REQ008', N'OWN3')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES29', N'Thu Tiền', CAST(N'2001-08-17' AS Date), N'female', N'Bác si', N'0857442100', 0, N'REQ008', N'OWN3')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES3', N'Cong Dnah', CAST(N'2001-06-10' AS Date), N'female', N'Sinh viÃªn', N'0857442280', 0, N'REQ002', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES30', N'Tiền Của', CAST(N'2001-07-18' AS Date), N'male', N'HUTECH Boi', N'0857442101', 0, N'REQ013', N'OWN4')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES31', N'Của Cải', CAST(N'2001-08-19' AS Date), N'female', N'Bác si', N'0857442102', 0, N'REQ013', N'OWN4')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES32', N'N''Nguyen Van Hai Toan''', CAST(N'2001-01-01' AS Date), N'male', N'Coder', N'0952527423', 0, N'REQ023', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES33', N'Nguyễn Đăng Khoa', CAST(N'2001-06-04' AS Date), N'male', N'Sinh viên', N'0783874561', 1, N'REQ024', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES34', N'Đỗ Ngạn', CAST(N'2001-01-01' AS Date), N'female', N'Nhân viên', N'0758762432', 0, N'REQ027', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES35', N'Văn Sỹ Hoài', CAST(N'2004-01-01' AS Date), N'male', N'Sinh viên', N'0823462323', 1, N'REQ032', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES36', N'Đỗ Minh Quân', CAST(N'2001-01-28' AS Date), N'male', N'Sinh viên', N'0295826422', 1, N'REQ032', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES37', N'Đỗ Hải Triều', CAST(N'2001-02-11' AS Date), N'male', N'FPT boi', N'0287462425', 0, N'REQ031', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES38', N'Nguyễn Đăng Khoa', CAST(N'2001-06-04' AS Date), N'male', N'SPKT Boi', N'0756239432', 0, N'REQ033', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES39', N'Lê Văn Đoan', CAST(N'2001-06-12' AS Date), N'male', N'SPKT Boi', N'0985423642', 0, N'REQ033', N'OWN2')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES4', N'Nguyễn Thế Hiển', CAST(N'2001-07-09' AS Date), N'male', N'Sinh viên', N'0857442281', 0, N'REQ016', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES40', N'Nhat Linh', CAST(N'2001-01-01' AS Date), N'male', N'Học sinh', N'3232425411+', 0, N'REQ034', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES5', N'Lê Chí Hùng', CAST(N'2001-11-09' AS Date), N'male', N'Sinh viên', N'0857442282', 0, N'26', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES6', N'Đỗ Tấn Phát', CAST(N'2001-10-10' AS Date), N'male', N'Sinh viên', N'0857442283', 0, N'26', N'OWN1')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES7', N'Minh Thơ', CAST(N'2001-07-09' AS Date), N'female', N'Học sinh', N'0857442254', 1, N'REQ005', N'OWN5')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES8', N'Trúc Quỳnh', CAST(N'2001-08-09' AS Date), N'female', N'Sinh viên', N'0857442265', 1, N'REQ005', N'OWN5')
INSERT [dbo].[Residents] ([residentId], [fullName], [dob], [sex], [job], [phone], [status], [requestId], [ownerId]) VALUES (N'RES9', N'Trang Trứng', CAST(N'2001-09-10' AS Date), N'female', N'Sinh viên', N'0857442286', 1, N'REQ005', N'OWN5')
GO
INSERT [dbo].[Roles] ([roleId], [roleName], [status]) VALUES (N'AD', N'Admin', 1)
INSERT [dbo].[Roles] ([roleId], [roleName], [status]) VALUES (N'EM', N'Employee', 1)
INSERT [dbo].[Roles] ([roleId], [roleName], [status]) VALUES (N'US', N'User', 1)
GO
INSERT [dbo].[Services] ([serviceId], [serviceName], [servicePrice], [status], [date], [typeId]) VALUES (N'E01', N'Tiền Điện', 2600, 1, CAST(N'2022-01-01' AS Date), N'SV01')
INSERT [dbo].[Services] ([serviceId], [serviceName], [servicePrice], [status], [date], [typeId]) VALUES (N'S01', N'Tiền Wifi', 300000, 1, CAST(N'2022-01-01' AS Date), N'SV03')
INSERT [dbo].[Services] ([serviceId], [serviceName], [servicePrice], [status], [date], [typeId]) VALUES (N'S02', N'Tiền Gym', 220000, 1, CAST(N'2022-01-01' AS Date), N'SV04')
INSERT [dbo].[Services] ([serviceId], [serviceName], [servicePrice], [status], [date], [typeId]) VALUES (N'S03', N'Tiền Vệ sinh', 310000, 0, CAST(N'2022-07-09' AS Date), N'SV03')
INSERT [dbo].[Services] ([serviceId], [serviceName], [servicePrice], [status], [date], [typeId]) VALUES (N'W01', N'Tiền Nước', 13000, 1, CAST(N'2022-01-01' AS Date), N'SV02')
GO
INSERT [dbo].[ServiceTypes] ([typeId], [typeName]) VALUES (N'SV01', N'Điện')
INSERT [dbo].[ServiceTypes] ([typeId], [typeName]) VALUES (N'SV02', N'Nước')
INSERT [dbo].[ServiceTypes] ([typeId], [typeName]) VALUES (N'SV03', N'Dịch vụ công cộng')
INSERT [dbo].[ServiceTypes] ([typeId], [typeName]) VALUES (N'SV04', N'Phí quản lí')
INSERT [dbo].[ServiceTypes] ([typeId], [typeName]) VALUES (N'SV05', N'Dịch vụ khác')
GO
INSERT [dbo].[Troubles] ([troubleId], [troubleName]) VALUES (N'TB01', N'Sự cố điện')
INSERT [dbo].[Troubles] ([troubleId], [troubleName]) VALUES (N'TB02', N'Sự cố nước')
INSERT [dbo].[Troubles] ([troubleId], [troubleName]) VALUES (N'TB03', N'Sự cố internet')
INSERT [dbo].[Troubles] ([troubleId], [troubleName]) VALUES (N'TB04', N'Sự cố an ninh')
INSERT [dbo].[Troubles] ([troubleId], [troubleName]) VALUES (N'TB05', N'Sự cố cơ sở vật chất')
INSERT [dbo].[Troubles] ([troubleId], [troubleName]) VALUES (N'TB06', N'Sự cố khác')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Contract__7E4B714D1920993D]    Script Date: 8/2/2022 8:33:13 PM ******/
ALTER TABLE [dbo].[Contracts] ADD UNIQUE NONCLUSTERED 
(
	[ownerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Owners__CB9A1CFE3C11D113]    Script Date: 8/2/2022 8:33:13 PM ******/
ALTER TABLE [dbo].[Owners] ADD UNIQUE NONCLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Apart_Troubles]  WITH CHECK ADD FOREIGN KEY([apartmentId])
REFERENCES [dbo].[Apartments] ([apartmentId])
GO
ALTER TABLE [dbo].[Apart_Troubles]  WITH CHECK ADD FOREIGN KEY([troubleId])
REFERENCES [dbo].[Troubles] ([troubleId])
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD FOREIGN KEY([apartmentTypeId])
REFERENCES [dbo].[ApartmentTypes] ([apartmentTypeId])
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD FOREIGN KEY([buildingId])
REFERENCES [dbo].[Buildings] ([buildingId])
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD FOREIGN KEY([bankId])
REFERENCES [dbo].[Banks] ([bankId])
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD FOREIGN KEY([billId])
REFERENCES [dbo].[Bills] ([billId])
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD FOREIGN KEY([serviceId])
REFERENCES [dbo].[Services] ([serviceId])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([apartmentId])
REFERENCES [dbo].[Apartments] ([apartmentId])
GO
ALTER TABLE [dbo].[BillServiceDetails]  WITH CHECK ADD FOREIGN KEY([billId], [serviceId])
REFERENCES [dbo].[BillDetails] ([billId], [serviceId])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([apartmentId])
REFERENCES [dbo].[Apartments] ([apartmentId])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([ownerId])
REFERENCES [dbo].[Owners] ([ownerId])
GO
ALTER TABLE [dbo].[Owners]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Accounts] ([userId])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([ownerId])
REFERENCES [dbo].[Owners] ([ownerId])
GO
ALTER TABLE [dbo].[Residents]  WITH CHECK ADD FOREIGN KEY([ownerId])
REFERENCES [dbo].[Owners] ([ownerId])
GO
ALTER TABLE [dbo].[Residents]  WITH CHECK ADD FOREIGN KEY([requestId])
REFERENCES [dbo].[Requests] ([requestId])
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[ServiceTypes] ([typeId])
GO
USE [master]
GO
ALTER DATABASE [BFApartment] SET  READ_WRITE 
GO
