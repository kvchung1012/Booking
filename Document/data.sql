USE [master]
GO
/****** Object:  Database [Booking]    Script Date: 5/10/2021 1:23:04 PM ******/
CREATE DATABASE [Booking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Booking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHUATCHUNG\MSSQL\DATA\Booking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Booking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHUATCHUNG\MSSQL\DATA\Booking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Booking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Booking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Booking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Booking] SET  MULTI_USER 
GO
ALTER DATABASE [Booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Booking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Booking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Booking] SET QUERY_STORE = OFF
GO
USE [Booking]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Image] [nvarchar](500) NULL,
	[Password] [nvarchar](max) NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Admins__3214EC0744EEFFEF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingForRent]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingForRent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Image] [nvarchar](max) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](1000) NULL,
	[Position] [nvarchar](max) NULL,
	[Description] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[TheLessorId] [int] NULL,
	[CategoryHouseId] [int] NULL,
	[DestinationHouseId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingForRentImages]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingForRentImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingForRentId] [int] NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingForRentUtilitis]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingForRentUtilitis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingForRentId] [int] NULL,
	[UtilitiId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryHouse]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryHouse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](64) NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinationPlace]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinationPlace](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[ProvinceId] [int] NULL,
	[DistrictId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Destinat__3214EC07726B3357] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Prefix] [nvarchar](20) NULL,
	[ProvinceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemInRoom]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemInRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](500) NULL,
	[UnitId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRoom]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[RoomInBuildingId] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Stock] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__OrderRoo__3214EC079047DDD8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Code] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomInBuilding]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInBuilding](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[BuildingForRentId] [int] NULL,
	[MaxPeople] [int] NULL,
	[Acreage] [int] NULL,
	[Stock] [int] NULL,
	[Price] [decimal](10, 0) NULL,
	[OrderBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomInBuildingImages]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInBuildingImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomInBuildingId] [int] NULL,
	[Image] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomInBuildingItems]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInBuildingItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomInBuildingId] [int] NULL,
	[ItemId] [int] NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomInBuildingUtilities]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInBuildingUtilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomInBuildingId] [int] NULL,
	[UtilitiId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLessor]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLessor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](64) NULL,
	[Name] [nvarchar](500) NULL,
	[Image] [nvarchar](max) NULL,
	[IdCard] [nvarchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Address] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utiliti]    Script Date: 5/10/2021 1:23:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utiliti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[SubName] [nvarchar](250) NULL,
	[Image] [nvarchar](500) NULL,
	[HasPrice] [bit] NULL,
	[ParentId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [UserName], [Image], [Password], [Name], [Email], [Phone], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'adminrole', N'/Content/Upload/Product/everychooseC%23.jpg', N'48507fb9999c00bf515dd3867f578c25c82584c45e981352762a4cea529dac56', N'Khuất Văn Chung', N'khuatchung1012@gmail.com', N'0962165244', NULL, CAST(N'2021-04-24T16:37:22.980' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[Admins] ([Id], [UserName], [Image], [Password], [Name], [Email], [Phone], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'son123', N'/Content/Upload/no-image.png', N'575315504f79519588bce65512148a6e58660f210558bda8bfeb107ea884ddd4', N'son12', N'nguyenhuyson11123@gmail.com', N'09632621312', CAST(N'2021-05-10T12:22:16.653' AS DateTime), NULL, 1, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[BuildingForRent] ON 

INSERT [dbo].[BuildingForRent] ([Id], [Name], [Image], [Phone], [Address], [Position], [Description], [Content], [TheLessorId], [CategoryHouseId], [DestinationHouseId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Vung Tau Melody Apartment', N'/Content/Upload/Product/Ana%20villas.jpg', N'0962165244', N'Thị Trấn Tam Đảo', N'1,1', N'The Imperial Hotel Vung Tau có khu vực bãi biển riêng và cung cấp chỗ nghỉ với lối trang trí thời Victoria ở khu vực Bãi Sau. Khách sạn có hồ bơi ngoài trời và 4 địa điểm ăn uống. The Imperial Hotel Vung Tau có khu vực bãi biển riêng và cung cấp chỗ nghỉ với lối trang trí thời Victoria ở khu vực Bãi Sau. Khách sạn có hồ bơi ngoài trời và 4 địa điểm ăn uống.', N'<p>Tọa lạc tại vị tr&iacute; đắc địa ở th&agrave;nh phố Vũng T&agrave;u, c&aacute;ch B&atilde;i Sau một qu&atilde;ng ngắn, Vung Tau Melody Apartment c&oacute; tầm nh&igrave;n ra quang cảnh th&agrave;nh phố v&agrave; s&acirc;n hi&ecirc;n.</p>

<p>C&aacute;c căn tại đ&acirc;y c&oacute; m&aacute;y điều h&ograve;a, s&agrave;n gỗ parquet, ph&ograve;ng tắm ri&ecirc;ng, TV m&agrave;n h&igrave;nh phẳng, WiFi miễn ph&iacute;, b&agrave;n l&agrave;m việc, ph&ograve;ng kh&aacute;ch, bếp đi k&egrave;m vật dụng, ban c&ocirc;ng v&agrave; tầm nh&igrave;n ra hồ nước. Tất cả căn hộ đều được bố tr&iacute; khu vực tiếp kh&aacute;ch v&agrave; ăn uống.</p>

<p>Căn hộ n&agrave;y nằm c&aacute;ch Tượng Ch&uacute;a Ki-t&ocirc; Vua 1,7 km v&agrave; Mũi Nghinh Phong 2,2 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, nằm trong b&aacute;n k&iacute;nh 72 km từ Vung Tau Melody Apartment.</p>

<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>9,0</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>

<p>Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn!</p>

<p>Vung Tau Melody Apartment đ&atilde; ch&agrave;o đ&oacute;n kh&aacute;ch Booking.com từ Ng&agrave;y 23 Th&aacute;ng 4 Năm 2019.</p>

<p>Tọa lạc tại vị tr&iacute; đắc địa ở th&agrave;nh phố Vũng T&agrave;u, c&aacute;ch B&atilde;i Sau một qu&atilde;ng ngắn, Vung Tau Melody Apartment c&oacute; tầm nh&igrave;n ra quang cảnh th&agrave;nh phố v&agrave; s&acirc;n hi&ecirc;n.</p>

<p>C&aacute;c căn tại đ&acirc;y c&oacute; m&aacute;y điều h&ograve;a, s&agrave;n gỗ parquet, ph&ograve;ng tắm ri&ecirc;ng, TV m&agrave;n h&igrave;nh phẳng, WiFi miễn ph&iacute;, b&agrave;n l&agrave;m việc, ph&ograve;ng kh&aacute;ch, bếp đi k&egrave;m vật dụng, ban c&ocirc;ng v&agrave; tầm nh&igrave;n ra hồ nước. Tất cả căn hộ đều được bố tr&iacute; khu vực tiếp kh&aacute;ch v&agrave; ăn uống.</p>

<p>Căn hộ n&agrave;y nằm c&aacute;ch Tượng Ch&uacute;a Ki-t&ocirc; Vua 1,7 km v&agrave; Mũi Nghinh Phong 2,2 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, nằm trong b&aacute;n k&iacute;nh 72 km từ Vung Tau Melody Apartment.</p>

<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>9,0</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>

<p>Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn!</p>

<p>Vung Tau Melody Apartment đ&atilde; ch&agrave;o đ&oacute;n kh&aacute;ch Booking.com từ Ng&agrave;y 23 Th&aacute;ng 4 Năm 2019.</p>
', 1, 2, 1, CAST(N'2021-05-10T11:16:19.847' AS DateTime), CAST(N'2021-05-10T13:21:30.250' AS DateTime), 0, 1, 1, 0)
INSERT [dbo].[BuildingForRent] ([Id], [Name], [Image], [Phone], [Address], [Position], [Description], [Content], [TheLessorId], [CategoryHouseId], [DestinationHouseId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'The Chill Suites- (The Chill Suites- City Center )', N'/Content/Upload/Product/BungalowDL.jpg', N'0962165244', N'90 Thị Trấn Tam Đảo, Vĩnh Phúc', N'1,1', N'"Cứ nghĩ giá tiền rẻ sẽ không được chất lượng tốt, nhưng khi đến đây mọi suy nghĩ đó đều sai. Nv nhiệt tình, hiếu khách, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đó mang giấy tờ ra tận bàn cho khách kí tên, lần này đi một mình nên đợi tại quầy kí luôn cho tiện. Phòng đẹp, giường khá êm,', N'<p>&quot;Cứ nghĩ gi&aacute; tiền rẻ sẽ kh&ocirc;ng được chất lượng tốt, nhưng khi đến đ&acirc;y mọi suy nghĩ đ&oacute; đều sai. Nv nhiệt t&igrave;nh, hiếu kh&aacute;ch, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đ&oacute; mang giấy tờ ra tận b&agrave;n cho kh&aacute;ch k&iacute; t&ecirc;n, lần n&agrave;y đi một m&igrave;nh n&ecirc;n đợi tại quầy k&iacute; lu&ocirc;n cho tiện. Ph&ograve;ng đẹp, giường kh&aacute; &ecirc;m, m&aacute;y lạnh d&ugrave; nh&igrave;n cũ cũ nhưng vẫn tốt, ph&ograve;ng vệ sinh cũng sạch đẹp với nh&agrave; tắm c&oacute; v&ograve;i sen đứng. Điểm yếu duy nhất l&agrave; kh&ocirc;ng c&oacute; SmartTV n&ecirc;n cũng bất tiện cho nhu cầu giải tr&iacute; của kh&aacute;ch, c&ograve;n lại qu&aacute; tốt so với tầm tiền. Đ&atilde; quay lại lần hai v&agrave; đ&acirc;y vẫn l&agrave; kh&aacute;ch sạn y&ecirc;u th&iacute;ch.&quot;</p>

<p>&quot;Cứ nghĩ gi&aacute; tiền rẻ sẽ kh&ocirc;ng được chất lượng tốt, nhưng khi đến đ&acirc;y mọi suy nghĩ đ&oacute; đều sai. Nv nhiệt t&igrave;nh, hiếu kh&aacute;ch, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đ&oacute; mang giấy tờ ra tận b&agrave;n cho kh&aacute;ch k&iacute; t&ecirc;n, lần n&agrave;y đi một m&igrave;nh n&ecirc;n đợi tại quầy k&iacute; lu&ocirc;n cho tiện. Ph&ograve;ng đẹp, giường kh&aacute; &ecirc;m, m&aacute;y lạnh d&ugrave; nh&igrave;n cũ cũ nhưng vẫn tốt, ph&ograve;ng vệ sinh cũng sạch đẹp với nh&agrave; tắm c&oacute; v&ograve;i sen đứng. Điểm yếu duy nhất l&agrave; kh&ocirc;ng c&oacute; SmartTV n&ecirc;n cũng bất tiện cho nhu cầu giải tr&iacute; của kh&aacute;ch, c&ograve;n lại qu&aacute; tốt so với tầm tiền. Đ&atilde; quay lại lần hai v&agrave; đ&acirc;y vẫn l&agrave; kh&aacute;ch sạn y&ecirc;u th&iacute;ch.&quot;</p>

<p>&quot;Cứ nghĩ gi&aacute; tiền rẻ sẽ kh&ocirc;ng được chất lượng tốt, nhưng khi đến đ&acirc;y mọi suy nghĩ đ&oacute; đều sai. Nv nhiệt t&igrave;nh, hiếu kh&aacute;ch, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đ&oacute; mang giấy tờ ra tận b&agrave;n cho kh&aacute;ch k&iacute; t&ecirc;n, lần n&agrave;y đi một m&igrave;nh n&ecirc;n đợi tại quầy k&iacute; lu&ocirc;n cho tiện. Ph&ograve;ng đẹp, giường kh&aacute; &ecirc;m, m&aacute;y lạnh d&ugrave; nh&igrave;n cũ cũ nhưng vẫn tốt, ph&ograve;ng vệ sinh cũng sạch đẹp với nh&agrave; tắm c&oacute; v&ograve;i sen đứng. Điểm yếu duy nhất l&agrave; kh&ocirc;ng c&oacute; SmartTV n&ecirc;n cũng bất tiện cho nhu cầu giải tr&iacute; của kh&aacute;ch, c&ograve;n lại qu&aacute; tốt so với tầm tiền. Đ&atilde; quay lại lần hai v&agrave; đ&acirc;y vẫn l&agrave; kh&aacute;ch sạn y&ecirc;u th&iacute;ch.&quot;</p>

<p>&quot;Cứ nghĩ gi&aacute; tiền rẻ sẽ kh&ocirc;ng được chất lượng tốt, nhưng khi đến đ&acirc;y mọi suy nghĩ đ&oacute; đều sai. Nv nhiệt t&igrave;nh, hiếu kh&aacute;ch, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đ&oacute; mang giấy tờ ra tận b&agrave;n cho kh&aacute;ch k&iacute; t&ecirc;n, lần n&agrave;y đi một m&igrave;nh n&ecirc;n đợi tại quầy k&iacute; lu&ocirc;n cho tiện. Ph&ograve;ng đẹp, giường kh&aacute; &ecirc;m, m&aacute;y lạnh d&ugrave; nh&igrave;n cũ cũ nhưng vẫn tốt, ph&ograve;ng vệ sinh cũng sạch đẹp với nh&agrave; tắm c&oacute; v&ograve;i sen đứng. Điểm yếu duy nhất l&agrave; kh&ocirc;ng c&oacute; SmartTV n&ecirc;n cũng bất tiện cho nhu cầu giải tr&iacute; của kh&aacute;ch, c&ograve;n lại qu&aacute; tốt so với tầm tiền. Đ&atilde; quay lại lần hai v&agrave; đ&acirc;y vẫn l&agrave; kh&aacute;ch sạn y&ecirc;u th&iacute;ch.&quot;</p>

<p>&quot;Cứ nghĩ gi&aacute; tiền rẻ sẽ kh&ocirc;ng được chất lượng tốt, nhưng khi đến đ&acirc;y mọi suy nghĩ đ&oacute; đều sai. Nv nhiệt t&igrave;nh, hiếu kh&aacute;ch, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đ&oacute; mang giấy tờ ra tận b&agrave;n cho kh&aacute;ch k&iacute; t&ecirc;n, lần n&agrave;y đi một m&igrave;nh n&ecirc;n đợi tại quầy k&iacute; lu&ocirc;n cho tiện. Ph&ograve;ng đẹp, giường kh&aacute; &ecirc;m, m&aacute;y lạnh d&ugrave; nh&igrave;n cũ cũ nhưng vẫn tốt, ph&ograve;ng vệ sinh cũng sạch đẹp với nh&agrave; tắm c&oacute; v&ograve;i sen đứng. Điểm yếu duy nhất l&agrave; kh&ocirc;ng c&oacute; SmartTV n&ecirc;n cũng bất tiện cho nhu cầu giải tr&iacute; của kh&aacute;ch, c&ograve;n lại qu&aacute; tốt so với tầm tiền. Đ&atilde; quay lại lần hai v&agrave; đ&acirc;y vẫn l&agrave; kh&aacute;ch sạn y&ecirc;u th&iacute;ch.&quot;</p>

<p>&quot;Cứ nghĩ gi&aacute; tiền rẻ sẽ kh&ocirc;ng được chất lượng tốt, nhưng khi đến đ&acirc;y mọi suy nghĩ đ&oacute; đều sai. Nv nhiệt t&igrave;nh, hiếu kh&aacute;ch, lần đầu đến đi theo cặp nv mời ra ngồi sofa sau đ&oacute; mang giấy tờ ra tận b&agrave;n cho kh&aacute;ch k&iacute; t&ecirc;n, lần n&agrave;y đi một m&igrave;nh n&ecirc;n đợi tại quầy k&iacute; lu&ocirc;n cho tiện. Ph&ograve;ng đẹp, giường kh&aacute; &ecirc;m, m&aacute;y lạnh d&ugrave; nh&igrave;n cũ cũ nhưng vẫn tốt, ph&ograve;ng vệ sinh cũng sạch đẹp với nh&agrave; tắm c&oacute; v&ograve;i sen đứng. Điểm yếu duy nhất l&agrave; kh&ocirc;ng c&oacute; SmartTV n&ecirc;n cũng bất tiện cho nhu cầu giải tr&iacute; của kh&aacute;ch, c&ograve;n lại qu&aacute; tốt so với tầm tiền. Đ&atilde; quay lại lần hai v&agrave; đ&acirc;y vẫn l&agrave; kh&aacute;ch sạn y&ecirc;u th&iacute;ch.&quot;</p>
', 1, 7, 1, CAST(N'2021-05-10T11:47:15.517' AS DateTime), CAST(N'2021-05-10T11:47:37.840' AS DateTime), 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[BuildingForRent] OFF
GO
SET IDENTITY_INSERT [dbo].[BuildingForRentImages] ON 

INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (19, 12, N'/Content/Upload/Product/everychooseC%23.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (36, 11, N'/Content/Upload/Product/image2.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (37, 11, N'/Content/Upload/Product/image1.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (38, 11, N'/Content/Upload/Product/image2.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (39, 11, N'/Content/Upload/Product/Ana%20villas.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (40, 11, N'/Content/Upload/Product/Apartment-3.png')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (41, 11, N'/Content/Upload/Product/apartment-osaka.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (42, 11, N'/Content/Upload/Product/BungalowDL.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (43, 11, N'/Content/Upload/Product/HaNoi.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (55, 2, N'/Content/Upload/Product/22HOUSING.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (56, 2, N'/Content/Upload/Product/Ana%20villas.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (57, 2, N'/Content/Upload/Product/Apartment-3.png')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (58, 2, N'/Content/Upload/Product/apartment-osaka.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (59, 2, N'/Content/Upload/Product/CanTho.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (60, 1, N'/Content/Upload/Product/Ana%20villas.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (61, 1, N'/Content/Upload/Product/Apartment-3.png')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (62, 1, N'/Content/Upload/Product/entire-bungalow.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (63, 1, N'/Content/Upload/Product/entire-house.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (64, 1, N'/Content/Upload/Product/HCM-CITY.jpg')
INSERT [dbo].[BuildingForRentImages] ([Id], [BuildingForRentId], [Image]) VALUES (65, 1, N'/Content/Upload/Product/HaNoi.jpg')
SET IDENTITY_INSERT [dbo].[BuildingForRentImages] OFF
GO
SET IDENTITY_INSERT [dbo].[BuildingForRentUtilitis] ON 

INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (3, 12, 3)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (4, 12, 5)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (5, 12, 6)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (8, 11, 16)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (9, 11, 17)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (10, 11, 18)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (11, 11, 19)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (12, 11, 20)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (13, 11, 21)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (14, 11, 22)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (15, 11, 23)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (16, 11, 24)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (17, 11, 25)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (18, 11, 26)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (19, 11, 27)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (20, 11, 28)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (21, 11, 29)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (22, 11, 30)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (23, 11, 31)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (35, 2, 16)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (36, 2, 17)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (37, 2, 18)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (38, 2, 19)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (39, 2, 20)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (40, 2, 21)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (41, 2, 24)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (42, 2, 25)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (43, 2, 26)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (44, 2, 29)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (45, 2, 30)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (46, 1, 16)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (47, 1, 17)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (48, 1, 18)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (49, 1, 19)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (50, 1, 20)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (51, 1, 21)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (52, 1, 22)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (53, 1, 23)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (54, 1, 24)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (55, 1, 25)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (56, 1, 26)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (57, 1, 27)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (58, 1, 28)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (59, 1, 29)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (60, 1, 30)
INSERT [dbo].[BuildingForRentUtilitis] ([Id], [BuildingForRentId], [UtilitiId]) VALUES (61, 1, 31)
SET IDENTITY_INSERT [dbo].[BuildingForRentUtilitis] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryHouse] ON 

INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Villa', N'/Content/Upload/Product/image1.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:18:18.517' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'Khách sạn', N'/Content/Upload/Product/image2.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:07:43.067' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'Căn hộ', N'/Content/Upload/Product/image3.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:07:48.630' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, N'Resort', N'/Content/Upload/Product/image4.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:07:54.277' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (5, N'Biệt Thự', N'/Content/Upload/Product/image5.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:08:00.763' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (6, N'Nhà Gỗ', N'/Content/Upload/Product/image2.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:08:10.373' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[CategoryHouse] ([Id], [Name], [Image], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (7, N'Home stay', N'/Content/Upload/Product/image5.jpg', CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T15:08:18.490' AS DateTime), NULL, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[CategoryHouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [UserName], [Password], [Name], [Email], [Phone], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, NULL, NULL, N'Chung', N'khuatchung1012@gmail.com', N'0962165244', NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[DestinationPlace] ON 

INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Tam đảo', N'/Content/Upload/Product/HaNoi.jpg', 2, 25, CAST(N'2021-04-20T16:44:11.170' AS DateTime), CAST(N'2021-05-08T22:01:45.907' AS DateTime), NULL, 1, 1, 0)
INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'Đà lạt', N'/Content/Upload/Product/CanTho.jpg', 2, 25, CAST(N'2021-04-20T17:59:32.017' AS DateTime), CAST(N'2021-05-08T22:01:54.847' AS DateTime), 0, 1, 1, 0)
INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'Đại Đồng', N'/Content/Upload/Product/HoiAn.jpg', 2, 49, CAST(N'2021-05-05T15:57:41.787' AS DateTime), CAST(N'2021-05-08T22:02:03.413' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, N'Hồ Chí Minh', N'/Content/Upload/Product/HCM-CITY.jpg', 1, 13, CAST(N'2021-05-08T22:02:38.133' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (5, N'Đà Nẵng', N'/Content/Upload/Product/DaLat.jpg', 3, 55, CAST(N'2021-05-08T22:03:29.083' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (6, N'Sầm sơn', N'/Content/Upload/Product/Hue.jpg', 19, 256, CAST(N'2021-05-08T22:04:17.010' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[DestinationPlace] ([Id], [Name], [Image], [ProvinceId], [DistrictId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (7, N'Cố đô huế', N'/Content/Upload/Product/Hue.jpg', 15, 193, CAST(N'2021-05-08T22:04:44.337' AS DateTime), NULL, 1, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[DestinationPlace] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (1, N'Bình Chánh', N'Huyện', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (2, N'Bình Tân', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (3, N'Bình Thạnh', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (4, N'Cần Giờ', N'Huyện', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (5, N'Củ Chi', N'Huyện', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (6, N'Gò Vấp', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (7, N'Hóc Môn', N'Huyện', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (8, N'Nhà Bè', N'Huyện', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (9, N'Phú Nhuận', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (10, N'Quận 1', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (11, N'Quận 10', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (12, N'Quận 11', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (13, N'Quận 12', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (14, N'Quận 2', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (15, N'Quận 3', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (16, N'Quận 4', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (17, N'Quận 5', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (18, N'Quận 6', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (19, N'Quận 7', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (20, N'Quận 8', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (21, N'Quận 9', N'', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (22, N'Tân Bình', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (23, N'Tân Phú', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (24, N'Thủ Đức', N'Quận', 1)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (25, N'Ba Đình', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (26, N'Ba Vì', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (27, N'Bắc Từ Liêm', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (28, N'Cầu Giấy', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (29, N'Chương Mỹ', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (30, N'Đan Phượng', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (31, N'Đông Anh', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (32, N'Đống Đa', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (33, N'Gia Lâm', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (34, N'Hà Đông', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (35, N'Hai Bà Trưng', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (36, N'Hoài Đức', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (37, N'Hoàn Kiếm', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (38, N'Hoàng Mai', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (39, N'Long Biên', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (40, N'Mê Linh', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (41, N'Mỹ Đức', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (42, N'Nam Từ Liêm', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (43, N'Phú Xuyên', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (44, N'Phúc Thọ', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (45, N'Quốc Oai', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (46, N'Sóc Sơn', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (47, N'Sơn Tây', N'Thị xã', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (48, N'Tây Hồ', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (49, N'Thạch Thất', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (50, N'Thanh Oai', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (51, N'Thanh Trì', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (52, N'Thanh Xuân', N'Quận', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (53, N'Thường Tín', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (54, N'Ứng Hòa', N'Huyện', 2)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (55, N'Cẩm Lệ', N'Quận', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (56, N'Hải Châu', N'Quận', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (57, N'Hòa Vang', N'Huyện', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (58, N'Hoàng Sa', N'Huyện', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (59, N'Liên Chiểu', N'Quận', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (60, N'Ngũ Hành Sơn', N'Quận', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (61, N'Sơn Trà', N'Quận', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (62, N'Thanh Khê', N'Quận', 3)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (63, N'Bàu Bàng', N'Huyện', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (64, N'Bến Cát', N'Thị xã', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (65, N'Dầu Tiếng', N'Huyện', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (66, N'Dĩ An', N'Thị xã', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (67, N'Phú Giáo', N'Huyện', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (68, N'Tân Uyên', N'Huyện', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (69, N'Thủ Dầu Một', N'Thị xã', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (70, N'Thuận An', N'Huyện', 4)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (71, N'Biên Hòa', N'Thành phố', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (72, N'Cẩm Mỹ', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (73, N'Định Quán', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (74, N'Long Khánh', N'Thị xã', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (75, N'Long Thành', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (76, N'Nhơn Trạch', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (77, N'Tân Phú', N'Quận', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (78, N'Thống Nhất', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (79, N'Trảng Bom', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (80, N'Vĩnh Cửu', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (81, N'Xuân Lộc', N'Huyện', 5)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (82, N'Cam Lâm', N'Huyện', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (83, N'Cam Ranh', N'Thành phố', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (84, N'Diên Khánh', N'Huyện', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (85, N'Khánh Sơn', N'Huyện', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (86, N'Khánh Vĩnh', N'Huyện', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (87, N'Nha Trang', N'Thành phố', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (88, N'Ninh Hòa', N'Thị xã', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (89, N'Trường Sa', N'Huyện', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (90, N'Vạn Ninh', N'Huyện', 6)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (91, N'An Dương', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (92, N'An Lão', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (93, N'Bạch Long Vĩ', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (94, N'Cát Hải', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (95, N'Đồ Sơn', N'Quận', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (96, N'Dương Kinh', N'Quận', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (97, N'Hải An', N'Quận', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (98, N'Hồng Bàng', N'Quận', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (99, N'Kiến An', N'Quận', 7)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (100, N'Kiến Thụy', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (101, N'Lê Chân', N'Quận', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (102, N'Ngô Quyền', N'Quận', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (103, N'Thủy Nguyên', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (104, N'Tiên Lãng', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (105, N'Vĩnh Bảo', N'Huyện', 7)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (106, N'Bến Lức', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (107, N'Cần Đước', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (108, N'Cần Giuộc', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (109, N'Châu Thành', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (110, N'Đức Hòa', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (111, N'Đức Huệ', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (112, N'Kiến Tường', N'Thị xã', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (113, N'Mộc Hóa', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (114, N'Tân An', N'Thành phố', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (115, N'Tân Hưng', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (116, N'Tân Thạnh', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (117, N'Tân Trụ', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (118, N'Thạnh Hóa', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (119, N'Thủ Thừa', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (120, N'Vĩnh Hưng', N'Huyện', 8)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (121, N'Bắc Trà My', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (122, N'Đại Lộc', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (123, N'Điện Bàn', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (124, N'Đông Giang', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (125, N'Duy Xuyên', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (126, N'Hiệp Đức', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (127, N'Hội An', N'Thành phố', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (128, N'Nam Giang', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (129, N'Nam Trà My', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (130, N'Nông Sơn', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (131, N'Núi Thành', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (132, N'Phú Ninh', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (133, N'Phước Sơn', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (134, N'Quế Sơn', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (135, N'Tam Kỳ', N'Thành phố', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (136, N'Tây Giang', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (137, N'Thăng Bình', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (138, N'Tiên Phước', N'Huyện', 9)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (139, N'Bà Rịa', N'Thị xã', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (140, N'Châu Đức', N'Huyện', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (141, N'Côn Đảo', N'Huyện', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (142, N'Đất Đỏ', N'Huyện', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (143, N'Long Điền', N'Huyện', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (144, N'Tân Thành', N'Huyện', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (145, N'Vũng Tàu', N'Thành phố', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (146, N'Xuyên Mộc', N'Huyện', 10)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (147, N'Buôn Đôn', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (148, N'Buôn Hồ', N'Thị xã', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (149, N'Buôn Ma Thuột', N'Thành phố', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (150, N'Cư Kuin', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (151, N'Cư Mgar', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (152, N'Ea HLeo', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (153, N'Ea Kar', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (154, N'Ea Súp', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (155, N'Krông Ana', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (156, N'Krông Bông', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (157, N'Krông Buk', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (158, N'Krông Năng', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (159, N'Krông Pắc', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (160, N'Lăk', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (161, N'MĐrăk', N'Huyện', 11)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (162, N' Thới Lai', N'Huyện', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (163, N'Bình Thủy', N'Quận', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (164, N'Cái Răng', N'Quận', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (165, N'Cờ Đỏ', N'Huyện', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (166, N'Ninh Kiều', N'Quận', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (167, N'Ô Môn', N'Quận', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (168, N'Phong Điền', N'Huyện', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (169, N'Thốt Nốt', N'Quận', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (170, N'Vĩnh Thạnh', N'Huyện', 12)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (171, N'Bắc Bình', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (172, N'Đảo Phú Quý', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (173, N'Đức Linh', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (174, N'Hàm Tân', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (175, N'Hàm Thuận Bắc', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (176, N'Hàm Thuận Nam', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (177, N'La Gi', N'Thị xã', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (178, N'Phan Thiết', N'Thành phố', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (179, N'Tánh Linh', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (180, N'Tuy Phong', N'Huyện', 13)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (181, N'Bảo Lâm', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (182, N'Bảo Lộc', N'Thành phố', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (183, N'Cát Tiên', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (184, N'Đạ Huoai', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (185, N'Đà Lạt', N'Thành phố', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (186, N'Đạ Tẻh', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (187, N'Đam Rông', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (188, N'Di Linh', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (189, N'Đơn Dương', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (190, N'Đức Trọng', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (191, N'Lạc Dương', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (192, N'Lâm Hà', N'Huyện', 14)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (193, N'A Lưới', N'Huyện', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (194, N'Huế', N'Thành phố', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (195, N'Hương Thủy', N'Thị xã', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (196, N'Hương Trà', N'Huyện', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (197, N'Nam Đông', N'Huyện', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (198, N'Phong Điền', N'Huyện', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (199, N'Phú Lộc', N'Huyện', 15)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (200, N'Phú Vang', N'Huyện', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (201, N'Quảng Điền', N'Huyện', 15)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (202, N'An Biên', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (203, N'An Minh', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (204, N'Châu Thành', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (205, N'Giang Thành', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (206, N'Giồng Riềng', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (207, N'Gò Quao', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (208, N'Hà Tiên', N'Thị xã', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (209, N'Hòn Đất', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (210, N'Kiên Hải', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (211, N'Kiên Lương', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (212, N'Phú Quốc', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (213, N'Rạch Giá', N'Thành phố', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (214, N'Tân Hiệp', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (215, N'U minh Thượng', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (216, N'Vĩnh Thuận', N'Huyện', 16)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (217, N'Bắc Ninh', N'Thành phố', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (218, N'Gia Bình', N'Huyện', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (219, N'Lương Tài', N'Huyện', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (220, N'Quế Võ', N'Huyện', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (221, N'Thuận Thành', N'Huyện', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (222, N'Tiên Du', N'Huyện', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (223, N'Từ Sơn', N'Thị xã', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (224, N'Yên Phong', N'Huyện', 17)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (225, N'Ba Chẽ', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (226, N'Bình Liêu', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (227, N'Cẩm Phả', N'Thành phố', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (228, N'Cô Tô', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (229, N'Đầm Hà', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (230, N'Đông Triều', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (231, N'Hạ Long', N'Thành phố', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (232, N'Hải Hà', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (233, N'Hoành Bồ', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (234, N'Móng Cái', N'Thành phố', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (235, N'Quảng Yên', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (236, N'Tiên Yên', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (237, N'Uông Bí', N'Thị xã', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (238, N'Vân Đồn', N'Huyện', 18)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (239, N'Bá Thước', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (240, N'Bỉm Sơn', N'Thị xã', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (241, N'Cẩm Thủy', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (242, N'Đông Sơn', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (243, N'Hà Trung', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (244, N'Hậu Lộc', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (245, N'Hoằng Hóa', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (246, N'Lang Chánh', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (247, N'Mường Lát', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (248, N'Nga Sơn', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (249, N'Ngọc Lặc', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (250, N'Như Thanh', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (251, N'Như Xuân', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (252, N'Nông Cống', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (253, N'Quan Hóa', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (254, N'Quan Sơn', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (255, N'Quảng Xương', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (256, N'Sầm Sơn', N'Thị xã', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (257, N'Thạch Thành', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (258, N'Thanh Hóa', N'Thành phố', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (259, N'Thiệu Hóa', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (260, N'Thọ Xuân', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (261, N'Thường Xuân', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (262, N'Tĩnh Gia', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (263, N'Triệu Sơn', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (264, N'Vĩnh Lộc', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (265, N'Yên Định', N'Huyện', 19)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (266, N'Anh Sơn', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (267, N'Con Cuông', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (268, N'Cửa Lò', N'Thị xã', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (269, N'Diễn Châu', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (270, N'Đô Lương', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (271, N'Hoàng Mai', N'Thị xã', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (272, N'Hưng Nguyên', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (273, N'Kỳ Sơn', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (274, N'Nam Đàn', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (275, N'Nghi Lộc', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (276, N'Nghĩa Đàn', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (277, N'Quế Phong', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (278, N'Quỳ Châu', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (279, N'Quỳ Hợp', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (280, N'Quỳnh Lưu', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (281, N'Tân Kỳ', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (282, N'Thái Hòa', N'Thị xã', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (283, N'Thanh Chương', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (284, N'Tương Dương', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (285, N'Vinh', N'Thành phố', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (286, N'Yên Thành', N'Huyện', 20)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (287, N'Bình Giang', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (288, N'Cẩm Giàng', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (289, N'Chí Linh', N'Thị xã', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (290, N'Gia Lộc', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (291, N'Hải Dương', N'Thành phố', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (292, N'Kim Thành', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (293, N'Kinh Môn', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (294, N'Nam Sách', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (295, N'Ninh Giang', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (296, N'Thanh Hà', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (297, N'Thanh Miện', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (298, N'Tứ Kỳ', N'Huyện', 21)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (299, N'An Khê', N'Thị xã', 22)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (300, N'AYun Pa', N'Thị xã', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (301, N'Chư Păh', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (302, N'Chư Pưh', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (303, N'Chư Sê', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (304, N'ChưPRông', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (305, N'Đăk Đoa', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (306, N'Đăk Pơ', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (307, N'Đức Cơ', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (308, N'Ia Grai', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (309, N'Ia Pa', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (310, N'KBang', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (311, N'Kông Chro', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (312, N'Krông Pa', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (313, N'Mang Yang', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (314, N'Phú Thiện', N'Huyện', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (315, N'Plei Ku', N'Thành phố', 22)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (316, N'Bình Long', N'Thị xã', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (317, N'Bù Đăng', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (318, N'Bù Đốp', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (319, N'Bù Gia Mập', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (320, N'Chơn Thành', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (321, N'Đồng Phú', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (322, N'Đồng Xoài', N'Thị xã', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (323, N'Hớn Quản', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (324, N'Lộc Ninh', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (325, N'Phú Riềng', N'Huyện', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (326, N'Phước Long', N'Thị xã', 23)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (327, N'Ân Thi', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (328, N'Hưng Yên', N'Thành phố', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (329, N'Khoái Châu', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (330, N'Kim Động', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (331, N'Mỹ Hào', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (332, N'Phù Cừ', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (333, N'Tiên Lữ', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (334, N'Văn Giang', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (335, N'Văn Lâm', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (336, N'Yên Mỹ', N'Huyện', 24)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (337, N'An Lão', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (338, N'An Nhơn', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (339, N'Hoài Ân', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (340, N'Hoài Nhơn', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (341, N'Phù Cát', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (342, N'Phù Mỹ', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (343, N'Quy Nhơn', N'Thành phố', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (344, N'Tây Sơn', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (345, N'Tuy Phước', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (346, N'Vân Canh', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (347, N'Vĩnh Thạnh', N'Huyện', 25)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (348, N'Cái Bè', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (349, N'Cai Lậy', N'Thị xã', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (350, N'Châu Thành', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (351, N'Chợ Gạo', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (352, N'Gò Công', N'Thị xã', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (353, N'Gò Công Đông', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (354, N'Gò Công Tây', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (355, N'Huyện Cai Lậy', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (356, N'Mỹ Tho', N'Thành phố', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (357, N'Tân Phú Đông', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (358, N'Tân Phước', N'Huyện', 26)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (359, N'Đông Hưng', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (360, N'Hưng Hà', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (361, N'Kiến Xương', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (362, N'Quỳnh Phụ', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (363, N'Thái Bình', N'Thành phố', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (364, N'Thái Thuỵ', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (365, N'Tiền Hải', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (366, N'Vũ Thư', N'Huyện', 27)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (367, N'Bắc Giang', N'Thành phố', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (368, N'Hiệp Hòa', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (369, N'Lạng Giang', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (370, N'Lục Nam', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (371, N'Lục Ngạn', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (372, N'Sơn Động', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (373, N'Tân Yên', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (374, N'Việt Yên', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (375, N'Yên Dũng', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (376, N'Yên Thế', N'Huyện', 28)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (377, N'Cao Phong', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (378, N'Đà Bắc', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (379, N'Hòa Bình', N'Thành phố', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (380, N'Kim Bôi', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (381, N'Kỳ Sơn', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (382, N'Lạc Sơn', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (383, N'Lạc Thủy', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (384, N'Lương Sơn', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (385, N'Mai Châu', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (386, N'Tân Lạc', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (387, N'Yên Thủy', N'Huyện', 29)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (388, N'An Phú', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (389, N'Châu Đốc', N'Thị xã', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (390, N'Châu Phú', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (391, N'Châu Thành', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (392, N'Chợ Mới', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (393, N'Long Xuyên', N'Thành phố', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (394, N'Phú Tân', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (395, N'Tân Châu', N'Thị xã', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (396, N'Thoại Sơn', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (397, N'Tịnh Biên', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (398, N'Tri Tôn', N'Huyện', 30)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (399, N'Bình Xuyên', N'Huyện', 31)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (400, N'Lập Thạch', N'Huyện', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (401, N'Phúc Yên', N'Thị xã', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (402, N'Sông Lô', N'Huyện', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (403, N'Tam Đảo', N'Huyện', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (404, N'Tam Dương', N'Huyện', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (405, N'Vĩnh Tường', N'Huyện', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (406, N'Vĩnh Yên', N'Thành phố', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (407, N'Yên Lạc', N'Huyện', 31)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (408, N'Bến Cầu', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (409, N'Châu Thành', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (410, N'Dương Minh Châu', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (411, N'Gò Dầu', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (412, N'Hòa Thành', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (413, N'Tân Biên', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (414, N'Tân Châu', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (415, N'Tây Ninh', N'Thị xã', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (416, N'Trảng Bàng', N'Huyện', 32)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (417, N'Đại Từ', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (418, N'Định Hóa', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (419, N'Đồng Hỷ', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (420, N'Phổ Yên', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (421, N'Phú Bình', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (422, N'Phú Lương', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (423, N'Sông Công', N'Thị xã', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (424, N'Thái Nguyên', N'Thành phố', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (425, N'Võ Nhai', N'Huyện', 33)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (426, N'Bắc Hà', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (427, N'Bảo Thắng', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (428, N'Bảo Yên', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (429, N'Bát Xát', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (430, N'Lào Cai', N'Thành phố', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (431, N'Mường Khương', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (432, N'Sa Pa', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (433, N'Văn Bàn', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (434, N'Xi Ma Cai', N'Huyện', 34)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (435, N'Giao Thủy', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (436, N'Hải Hậu', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (437, N'Mỹ Lộc', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (438, N'Nam Định', N'Thành phố', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (439, N'Nam Trực', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (440, N'Nghĩa Hưng', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (441, N'Trực Ninh', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (442, N'Vụ Bản', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (443, N'Xuân Trường', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (444, N'Ý Yên', N'Huyện', 35)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (445, N'Ba Tơ', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (446, N'Bình Sơn', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (447, N'Đức Phổ', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (448, N'Lý Sơn', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (449, N'Minh Long', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (450, N'Mộ Đức', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (451, N'Nghĩa Hành', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (452, N'Quảng Ngãi', N'Thành phố', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (453, N'Sơn Hà', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (454, N'Sơn Tây', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (455, N'Sơn Tịnh', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (456, N'Tây Trà', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (457, N'Trà Bồng', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (458, N'Tư Nghĩa', N'Huyện', 36)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (459, N'Ba Tri', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (460, N'Bến Tre', N'Thành phố', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (461, N'Bình Đại', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (462, N'Châu Thành', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (463, N'Chợ Lách', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (464, N'Giồng Trôm', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (465, N'Mỏ Cày Bắc', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (466, N'Mỏ Cày Nam', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (467, N'Thạnh Phú', N'Huyện', 37)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (468, N'Cư Jút', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (469, N'Dăk GLong', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (470, N'Dăk Mil', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (471, N'Dăk RLấp', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (472, N'Dăk Song', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (473, N'Gia Nghĩa', N'Thị xã', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (474, N'Krông Nô', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (475, N'Tuy Đức', N'Huyện', 38)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (476, N'Cà Mau', N'Thành phố', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (477, N'Cái Nước', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (478, N'Đầm Dơi', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (479, N'Năm Căn', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (480, N'Ngọc Hiển', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (481, N'Phú Tân', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (482, N'Thới Bình', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (483, N'Trần Văn Thời', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (484, N'U Minh', N'Huyện', 39)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (485, N'Bình Minh', N'Huyện', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (486, N'Bình Tân', N'Quận', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (487, N'Long Hồ', N'Huyện', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (488, N'Mang Thít', N'Huyện', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (489, N'Tam Bình', N'Huyện', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (490, N'Trà Ôn', N'Huyện', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (491, N'Vĩnh Long', N'Thành phố', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (492, N'Vũng Liêm', N'Huyện', 40)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (493, N'Gia Viễn', N'Huyện', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (494, N'Hoa Lư', N'Huyện', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (495, N'Kim Sơn', N'Huyện', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (496, N'Nho Quan', N'Huyện', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (497, N'Ninh Bình', N'Thành phố', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (498, N'Tam Điệp', N'Thị xã', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (499, N'Yên Khánh', N'Huyện', 41)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (500, N'Yên Mô', N'Huyện', 41)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (501, N'Cẩm Khê', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (502, N'Đoan Hùng', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (503, N'Hạ Hòa', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (504, N'Lâm Thao', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (505, N'Phù Ninh', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (506, N'Phú Thọ', N'Thị xã', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (507, N'Tam Nông', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (508, N'Tân Sơn', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (509, N'Thanh Ba', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (510, N'Thanh Sơn', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (511, N'Thanh Thủy', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (512, N'Việt Trì', N'Thành phố', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (513, N'Yên Lập', N'Huyện', 42)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (514, N'Bác Ái', N'Huyện', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (515, N'Ninh Hải', N'Huyện', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (516, N'Ninh Phước', N'Huyện', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (517, N'Ninh Sơn', N'Huyện', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (518, N'Phan Rang - Tháp Chàm', N'Thành phố', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (519, N'Thuận Bắc', N'Huyện', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (520, N'Thuận Nam', N'Huyện', 43)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (521, N'Đông Hòa', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (522, N'Đồng Xuân', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (523, N'Phú Hòa', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (524, N'Sơn Hòa', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (525, N'Sông Cầu', N'Thị xã', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (526, N'Sông Hinh', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (527, N'Tây Hòa', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (528, N'Tuy An', N'Huyện', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (529, N'Tuy Hòa', N'Thành phố', 44)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (530, N'Bình Lục', N'Huyện', 45)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (531, N'Duy Tiên', N'Huyện', 45)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (532, N'Kim Bảng', N'Huyện', 45)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (533, N'Lý Nhân', N'Huyện', 45)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (534, N'Phủ Lý', N'Thành phố', 45)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (535, N'Thanh Liêm', N'Huyện', 45)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (536, N'Cẩm Xuyên', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (537, N'Can Lộc', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (538, N'Đức Thọ', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (539, N'Hà Tĩnh', N'Thành phố', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (540, N'Hồng Lĩnh', N'Thị xã', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (541, N'Hương Khê', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (542, N'Hương Sơn', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (543, N'Kỳ Anh', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (544, N'Lộc Hà', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (545, N'Nghi Xuân', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (546, N'Thạch Hà', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (547, N'Vũ Quang', N'Huyện', 46)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (548, N'Cao Lãnh', N'Thành phố', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (549, N'Châu Thành', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (550, N'Hồng Ngự', N'Thị xã', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (551, N'Huyện Cao Lãnh', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (552, N'Huyện Hồng Ngự', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (553, N'Lai Vung', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (554, N'Lấp Vò', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (555, N'Sa Đéc', N'Thị xã', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (556, N'Tam Nông', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (557, N'Tân Hồng', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (558, N'Thanh Bình', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (559, N'Tháp Mười', N'Huyện', 47)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (560, N'Châu Thành', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (561, N'Cù Lao Dung', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (562, N'Kế Sách', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (563, N'Long Phú', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (564, N'Mỹ Tú', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (565, N'Mỹ Xuyên', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (566, N'Ngã Năm', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (567, N'Sóc Trăng', N'Thành phố', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (568, N'Thạnh Trị', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (569, N'Trần Đề', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (570, N'Vĩnh Châu', N'Huyện', 48)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (571, N'Đăk Glei', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (572, N'Đăk Hà', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (573, N'Đăk Tô', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (574, N'Ia HDrai', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (575, N'Kon Plông', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (576, N'Kon Rẫy', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (577, N'KonTum', N'Thành phố', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (578, N'Ngọc Hồi', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (579, N'Sa Thầy', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (580, N'Tu Mơ Rông', N'Huyện', 49)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (581, N'Ba Đồn', N'Thị xã', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (582, N'Bố Trạch', N'Huyện', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (583, N'Đồng Hới', N'Thành phố', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (584, N'Lệ Thủy', N'Huyện', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (585, N'Minh Hóa', N'Huyện', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (586, N'Quảng Ninh', N'Huyện', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (587, N'Quảng Trạch', N'Huyện', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (588, N'Tuyên Hóa', N'Huyện', 50)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (589, N'Cam Lộ', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (590, N'Đa Krông', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (591, N'Đảo Cồn cỏ', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (592, N'Đông Hà', N'Thành phố', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (593, N'Gio Linh', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (594, N'Hải Lăng', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (595, N'Hướng Hóa', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (596, N'Quảng Trị', N'Thị xã', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (597, N'Triệu Phong', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (598, N'Vĩnh Linh', N'Huyện', 51)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (599, N'Càng Long', N'Huyện', 52)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (600, N'Cầu Kè', N'Huyện', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (601, N'Cầu Ngang', N'Huyện', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (602, N'Châu Thành', N'Huyện', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (603, N'Duyên Hải', N'Huyện', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (604, N'Tiểu Cần', N'Huyện', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (605, N'Trà Cú', N'Huyện', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (606, N'Trà Vinh', N'Thành phố', 52)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (607, N'Châu Thành', N'Huyện', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (608, N'Châu Thành A', N'Huyện', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (609, N'Long Mỹ', N'Huyện', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (610, N'Ngã Bảy', N'Thị xã', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (611, N'Phụng Hiệp', N'Huyện', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (612, N'Vị Thanh', N'Thành phố', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (613, N'Vị Thủy', N'Huyện', 53)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (614, N'Bắc Yên', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (615, N'Mai Sơn', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (616, N'Mộc Châu', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (617, N'Mường La', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (618, N'Phù Yên', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (619, N'Quỳnh Nhai', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (620, N'Sơn La', N'Thành phố', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (621, N'Sông Mã', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (622, N'Sốp Cộp', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (623, N'Thuận Châu', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (624, N'Vân Hồ', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (625, N'Yên Châu', N'Huyện', 54)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (626, N'Bạc Liêu', N'Thành phố', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (627, N'Đông Hải', N'Huyện', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (628, N'Giá Rai', N'Huyện', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (629, N'Hòa Bình', N'Huyện', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (630, N'Hồng Dân', N'Huyện', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (631, N'Phước Long', N'Huyện', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (632, N'Vĩnh Lợi', N'Huyện', 55)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (633, N'Lục Yên', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (634, N'Mù Cang Chải', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (635, N'Nghĩa Lộ', N'Thị xã', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (636, N'Trạm Tấu', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (637, N'Trấn Yên', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (638, N'Văn Chấn', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (639, N'Văn Yên', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (640, N'Yên Bái', N'Thành phố', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (641, N'Yên Bình', N'Huyện', 56)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (642, N'Chiêm Hóa', N'Huyện', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (643, N'Hàm Yên', N'Huyện', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (644, N'Lâm Bình', N'Huyện', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (645, N'Na Hang', N'Huyện', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (646, N'Sơn Dương', N'Huyện', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (647, N'Tuyên Quang', N'Thành phố', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (648, N'Yên Sơn', N'Huyện', 57)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (649, N'Điện Biên', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (650, N'Điện Biên Đông', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (651, N'Điện Biên Phủ', N'Thành phố', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (652, N'Mường Ảng', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (653, N'Mường Chà', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (654, N'Mường Lay', N'Thị xã', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (655, N'Mường Nhé', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (656, N'Nậm Pồ', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (657, N'Tủa Chùa', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (658, N'Tuần Giáo', N'Huyện', 58)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (659, N'Lai Châu', N'Thị xã', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (660, N'Mường Tè', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (661, N'Nậm Nhùn', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (662, N'Phong Thổ', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (663, N'Sìn Hồ', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (664, N'Tam Đường', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (665, N'Tân Uyên', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (666, N'Than Uyên', N'Huyện', 59)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (667, N'Bắc Sơn', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (668, N'Bình Gia', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (669, N'Cao Lộc', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (670, N'Chi Lăng', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (671, N'Đình Lập', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (672, N'Hữu Lũng', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (673, N'Lạng Sơn', N'Thành phố', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (674, N'Lộc Bình', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (675, N'Tràng Định', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (676, N'Văn Lãng', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (677, N'Văn Quan', N'Huyện', 60)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (678, N'Bắc Mê', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (679, N'Bắc Quang', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (680, N'Đồng Văn', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (681, N'Hà Giang', N'Thành phố', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (682, N'Hoàng Su Phì', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (683, N'Mèo Vạc', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (684, N'Quản Bạ', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (685, N'Quang Bình', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (686, N'Vị Xuyên', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (687, N'Xín Mần', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (688, N'Yên Minh', N'Huyện', 61)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (689, N'Ba Bể', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (690, N'Bắc Kạn', N'Thị xã', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (691, N'Bạch Thông', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (692, N'Chợ Đồn', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (693, N'Chợ Mới', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (694, N'Na Rì', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (695, N'Ngân Sơn', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (696, N'Pác Nặm', N'Huyện', 62)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (697, N'Bảo Lạc', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (698, N'Bảo Lâm', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (699, N'Cao Bằng', N'Thị xã', 63)
GO
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (700, N'Hạ Lang', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (701, N'Hà Quảng', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (702, N'Hòa An', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (703, N'Nguyên Bình', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (704, N'Phục Hòa', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (705, N'Quảng Uyên', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (706, N'Thạch An', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (707, N'Thông Nông', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (708, N'Trà Lĩnh', N'Huyện', 63)
INSERT [dbo].[District] ([Id], [Name], [Prefix], [ProvinceId]) VALUES (709, N'Trùng Khánh', N'Huyện', 63)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemInRoom] ON 

INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Giường Đôi', N'/Content/Upload/no-image.png', 2, CAST(N'2021-04-21T07:03:44.623' AS DateTime), CAST(N'2021-04-21T07:04:50.317' AS DateTime), 0, 0, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'Giường Chiếc', N'/Content/Upload/no-image.png', 1, CAST(N'2021-04-21T07:03:56.127' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'Khăn mặt', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:00:16.643' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, N'Tivi', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:00:22.683' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (5, N'Laptop', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:00:29.740' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (6, N'Ấm nước', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:00:35.587' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (7, N'Cây nước', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:00:40.163' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (8, N'Đồ vệ sinh cá nhân', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:01:50.233' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (9, N'Máy sấy tóc', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:02:00.170' AS DateTime), NULL, 1, NULL, 1, 0)
INSERT [dbo].[ItemInRoom] ([Id], [Name], [Image], [UnitId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (10, N'Tủ lạnh', N'/Content/Upload/no-image.png', 1, CAST(N'2021-05-05T16:02:07.187' AS DateTime), NULL, 1, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ItemInRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderRoom] ON 

INSERT [dbo].[OrderRoom] ([Id], [CustomerId], [RoomInBuildingId], [StartDate], [EndDate], [Stock], [Price], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, 1, 1, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-14T00:00:00.000' AS DateTime), 2, CAST(10000000 AS Decimal(18, 0)), CAST(N'2021-05-10T11:33:46.263' AS DateTime), NULL, 1, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[OrderRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (1, N'Hồ Chí Minh', N'SG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (2, N'Hà Nội', N'HN')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (3, N'Đà Nẵng', N'DDN')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (4, N'Bình Dương', N'BD')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (5, N'Đồng Nai', N'DNA')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (6, N'Khánh Hòa', N'KH')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (7, N'Hải Phòng', N'HP')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (8, N'Long An', N'LA')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (9, N'Quảng Nam', N'QNA')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (10, N'Bà Rịa Vũng Tàu', N'VT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (11, N'Đắk Lắk', N'DDL')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (12, N'Cần Thơ', N'CT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (13, N'Bình Thuận N', N'BTH')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (14, N'Lâm Đồng', N'LDD')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (15, N'Thừa Thiên Huế', N'TTH')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (16, N'Kiên Giang', N'KG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (17, N'Bắc Ninh', N'BN')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (18, N'Quảng Ninh', N'QNI')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (19, N'Thanh Hóa', N'TH')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (20, N'Nghệ An', N'NA')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (21, N'Hải Dương', N'HD')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (22, N'Gia Lai', N'GL')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (23, N'Bình Phước', N'BP')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (24, N'Hưng Yên', N'HY')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (25, N'Bình Định', N'BDD')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (26, N'Tiền Giang', N'TG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (27, N'Thái Bình', N'TB')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (28, N'Bắc Giang', N'BG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (29, N'Hòa Bình', N'HB')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (30, N'An Giang', N'AG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (31, N'Vĩnh Phúc', N'VP')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (32, N'Tây Ninh', N'TNI')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (33, N'Thái Nguyên', N'TN')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (34, N'Lào Cai', N'LCA')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (35, N'Nam Định', N'NDD')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (36, N'Quảng Ngãi', N'QNG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (37, N'Bến Tre', N'BTR')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (38, N'Đắk Nông', N'DNO')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (39, N'Cà Mau', N'CM')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (40, N'Vĩnh Long', N'VL')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (41, N'Ninh Bình', N'NB')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (42, N'Phú Thọ', N'PT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (43, N'Ninh Thuận', N'NT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (44, N'Phú Yên', N'PY')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (45, N'Hà Nam', N'HNA')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (46, N'Hà Tĩnh', N'HT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (47, N'Đồng Tháp', N'DDT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (48, N'Sóc Trăng', N'ST')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (49, N'Kon Tum', N'KT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (50, N'Quảng Bình', N'QB')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (51, N'Quảng Trị', N'QT')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (52, N'Trà Vinh', N'TV')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (53, N'Hậu Giang', N'HGI')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (54, N'Sơn La', N'SL')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (55, N'Bạc Liêu', N'BL')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (56, N'Yên Bái', N'YB')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (57, N'Tuyên Quang', N'TQ')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (58, N'Điện Biên', N'DDB')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (59, N'Lai Châu', N'LCH')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (60, N'Lạng Sơn', N'LS')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (61, N'Hà Giang', N'HG')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (62, N'Bắc Kạn', N'BK')
INSERT [dbo].[Province] ([Id], [Name], [Code]) VALUES (63, N'Cao Bằng', N'CB')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomInBuilding] ON 

INSERT [dbo].[RoomInBuilding] ([Id], [Name], [BuildingForRentId], [MaxPeople], [Acreage], [Stock], [Price], [OrderBy], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Phòng cao cấp', 1, 10, 100, 1, CAST(10000000 AS Decimal(10, 0)), 0, CAST(N'2021-05-10T11:18:23.310' AS DateTime), CAST(N'2021-05-10T11:22:37.630' AS DateTime), 0, 0, 1, 0)
INSERT [dbo].[RoomInBuilding] ([Id], [Name], [BuildingForRentId], [MaxPeople], [Acreage], [Stock], [Price], [OrderBy], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'Phòng tiêu chuẩn', 1, 5, 60, 1, CAST(600000 AS Decimal(10, 0)), 1, CAST(N'2021-05-10T11:50:17.837' AS DateTime), NULL, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[RoomInBuilding] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomInBuildingImages] ON 

INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (2, 2, N'/Content/Upload/Product/everychooseC%23.jpg')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (6, 3, N'/Content/Upload/Product/22HOUSING.jpg')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (7, 3, N'/Content/Upload/Product/Ana%20villas.jpg')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (8, 3, N'/Content/Upload/Product/entire-house.jpg')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (9, 1, N'/Content/Upload/Product/Apartment-3.png')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (10, 1, N'/Content/Upload/Product/22HOUSING.jpg')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (11, 1, N'/Content/Upload/Product/VungTau.jpg')
INSERT [dbo].[RoomInBuildingImages] ([Id], [RoomInBuildingId], [Image]) VALUES (12, 1, N'/Content/Upload/Product/NhaTrang.jpg')
SET IDENTITY_INSERT [dbo].[RoomInBuildingImages] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomInBuildingItems] ON 

INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (2, 2, 1, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (3, 2, 2, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (14, 4, 1, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (15, 4, 4, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (16, 4, 3, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (17, 4, 6, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (18, 4, 8, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (19, 5, 4, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (20, 5, 3, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (21, 5, 6, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (22, 5, 8, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (23, 5, 2, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (34, 3, 1, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (35, 3, 2, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (36, 3, 3, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (37, 3, 4, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (38, 3, 5, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (39, 3, 6, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (40, 3, 7, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (41, 3, 8, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (42, 3, 9, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (43, 3, 10, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (54, 1, 1, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (55, 1, 2, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (56, 1, 4, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (57, 1, 3, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (58, 1, 5, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (59, 1, 6, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (60, 1, 7, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (61, 1, 8, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (62, 1, 9, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (63, 1, 10, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (64, 2, 1, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (65, 2, 3, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (66, 2, 5, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (67, 2, 6, 1)
INSERT [dbo].[RoomInBuildingItems] ([Id], [RoomInBuildingId], [ItemId], [Stock]) VALUES (68, 2, 8, 1)
SET IDENTITY_INSERT [dbo].[RoomInBuildingItems] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomInBuildingUtilities] ON 

INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (16, 3, 16)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (17, 3, 17)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (18, 3, 18)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (19, 3, 19)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (20, 3, 20)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (21, 3, 23)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (22, 3, 24)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (23, 3, 25)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (39, 1, 16)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (40, 1, 17)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (41, 1, 18)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (42, 1, 20)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (43, 1, 21)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (44, 1, 22)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (45, 1, 23)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (46, 1, 24)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (47, 1, 25)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (48, 1, 26)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (49, 1, 27)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (50, 1, 28)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (51, 1, 29)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (52, 1, 30)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (53, 1, 31)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (54, 2, 16)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (55, 2, 17)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (56, 2, 18)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (57, 2, 19)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (58, 2, 20)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (59, 2, 21)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (60, 2, 28)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (61, 2, 29)
INSERT [dbo].[RoomInBuildingUtilities] ([Id], [RoomInBuildingId], [UtilitiId]) VALUES (62, 2, 31)
SET IDENTITY_INSERT [dbo].[RoomInBuildingUtilities] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLessor] ON 

INSERT [dbo].[TheLessor] ([Id], [UserName], [Password], [Name], [Image], [IdCard], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'tobiii', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', N'Khuất Văn Chung', NULL, N'12397327434', N'khuatchung1012@gmail.com', N'0962165244', N'Hà Nội', CAST(N'2021-04-27T14:48:43.253' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[TheLessor] ([Id], [UserName], [Password], [Name], [Image], [IdCard], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'admin1', N'5d57fec45882fa9df9d543deca18b59267b7eaea9b6e3b26fd323acc0821d243', N'Khuất Văn Chung', NULL, N'12397327434', N'nguyenhuyson24102000@gmail.com', N'0962165245', N'Thanh trì hà nội', CAST(N'2021-05-10T11:55:18.280' AS DateTime), NULL, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[TheLessor] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Chiếc', CAST(N'2021-04-17T16:03:44.693' AS DateTime), CAST(N'2021-04-18T00:20:35.177' AS DateTime), NULL, 0, 1, 0)
INSERT [dbo].[Unit] ([Id], [Name], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'Đôi', CAST(N'2021-04-17T16:03:44.693' AS DateTime), CAST(N'2021-04-20T19:14:08.270' AS DateTime), 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[Utiliti] ON 

INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (8, N'Ngoài trời', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:13:08.533' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (9, N'Vật nuôi', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:13:20.930' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (10, N'Hoạt động', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:13:32.687' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (11, N'Internet', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:13:41.913' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (12, N'Chỗ đậu xe', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:13:50.507' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (13, N'Phương tiện đi lại', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:13:59.963' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (14, N'Dịch vụ lau dọn', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:14:19.587' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (15, N'Tổng quát', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 0, CAST(N'2021-05-10T01:14:32.600' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (16, N'Bàn ghế ngoài trời', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 8, CAST(N'2021-05-10T01:14:53.720' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (17, N'Mang theo vật nuôi', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 9, CAST(N'2021-05-10T01:16:26.650' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (18, N'Cho thuê xe đạp', N'có phí', N'/Content/Upload/no-image.png', NULL, 10, CAST(N'2021-05-10T01:16:49.260' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (19, N'Wi-fi có ở toàn bộ khách sạn và miễn phí.', N'tiện ích', N'/Content/Upload/no-image.png', NULL, 10, CAST(N'2021-05-10T01:17:08.057' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (20, N'Có bãi đỗ riêng miễn phí tại chỗ (cần đặt chỗ trước).', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 12, CAST(N'2021-05-10T01:17:25.970' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (21, N' Bãi đậu xe an toàn', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 12, CAST(N'2021-05-10T01:17:34.760' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (22, N' Đưa khách ra sân bay', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 13, CAST(N'2021-05-10T01:17:49.490' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (23, N'Đón khách tại sân bay', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 13, CAST(N'2021-05-10T01:17:56.393' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (24, N'Dọn phòng hàng ngày', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 14, CAST(N'2021-05-10T01:18:12.603' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (25, N' Dịch vụ là (ủi)', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 14, CAST(N'2021-05-10T01:18:19.213' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (26, N' Giặt khô', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 14, CAST(N'2021-05-10T01:18:24.777' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (27, N'Giặt ủi', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 14, CAST(N'2021-05-10T01:18:30.680' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (28, N' Dịch vụ đưa đón', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 15, CAST(N'2021-05-10T01:18:46.200' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (29, N' Khu vực xem TV/sảnh chung', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 15, CAST(N'2021-05-10T01:18:53.580' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (30, N' Dịch vụ đưa đón sân bay (có thu phí)', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 15, CAST(N'2021-05-10T01:19:01.140' AS DateTime), NULL, 0, NULL, 1, 0)
INSERT [dbo].[Utiliti] ([Id], [Name], [SubName], [Image], [HasPrice], [ParentId], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status], [IsDeleted]) VALUES (31, N'Dịch vụ xe đưa đón (có thu phí)', N'miễn phí', N'/Content/Upload/no-image.png', NULL, 15, CAST(N'2021-05-10T01:19:08.693' AS DateTime), NULL, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Utiliti] OFF
GO
ALTER TABLE [dbo].[Admins] ADD  CONSTRAINT [DF__Admins__CreatedD__5CD6CB2B]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Admins] ADD  CONSTRAINT [DF__Admins__UpdatedD__5DCAEF64]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[BuildingForRent] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BuildingForRent] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[CategoryHouse] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CategoryHouse] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[DestinationPlace] ADD  CONSTRAINT [DF__Destinati__Creat__24927208]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DestinationPlace] ADD  CONSTRAINT [DF__Destinati__Updat__25869641]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[ItemInRoom] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ItemInRoom] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[OrderRoom] ADD  CONSTRAINT [DF__OrderRoom__Creat__4E88ABD4]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderRoom] ADD  CONSTRAINT [DF__OrderRoom__Updat__4F7CD00D]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[RoomInBuilding] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RoomInBuilding] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[TheLessor] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TheLessor] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Unit] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Unit] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Utiliti] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Utiliti] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
USE [master]
GO
ALTER DATABASE [Booking] SET  READ_WRITE 
GO
