USE [master]
GO
/****** Object:  Database [ProjectPRN291]    Script Date: 8/1/2023 1:43:37 AM ******/
CREATE DATABASE [ProjectPRN291]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRN291', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectPRN291.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRN291_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectPRN291_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectPRN291] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRN291].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRN291] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRN291] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRN291] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRN291] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRN291] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRN291] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectPRN291] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRN291] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRN291] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRN291] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRN291] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRN291] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRN291] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRN291] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRN291] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRN291] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRN291] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRN291] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRN291] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRN291] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRN291] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRN291] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRN291] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectPRN291] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRN291] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRN291] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRN291] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRN291] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRN291] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectPRN291] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectPRN291] SET QUERY_STORE = OFF
GO
USE [ProjectPRN291]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 8/1/2023 1:43:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](25) NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 8/1/2023 1:43:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [varchar](25) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[status] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 8/1/2023 1:43:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[orderdetail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[customer_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](255) NULL,
	[image] [varchar](200) NULL,
	[list_price] [float] NULL,
	[quantity_order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/1/2023 1:43:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[name_receiver] [nvarchar](255) NOT NULL,
	[phone_receiver] [nvarchar](20) NOT NULL,
	[address_receiver] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[date] [date] NOT NULL,
	[status] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/1/2023 1:43:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[list_price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[category_name] [nvarchar](255) NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([admin_id], [name], [phone], [username], [password]) VALUES (1, N'Đỗ Văn Đạt', N'0902121881', N'admin', N'123')
INSERT [dbo].[admin] ([admin_id], [name], [phone], [username], [password]) VALUES (2, N'Bùi Ngân Hàaaaa', N'0968519615', N'buinganha', N'123')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (1, N'Đỗ Văn Đạt', N'0902121881', N'Đan Phượng - Hà Nội', N'customer', N'123', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (2, N'Đỗ Thu Trang', N'0968519615', N'Đan Phượng - Hà Nội', N'dothutrang', N'123', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (3, N'Đỗ Văn Hiếu', N'0902121881', N'Đan Phượng - Hà Nội', N'dovanhieu', N'123', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (4, N'Nguyễn Thị Mai', N'0947934515', N'Đan Phượng - Hà Nội', N'nguyenthimai', N'123', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (5, N'Bùi Ngân Hà', N'0123456789', N'Hà Nội', N'buinganha', N'123', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (8, N'Bùi Văn Phi', N'0968686868', N'Hà Nội', N'phideptrai', N'123', N'Active')
INSERT [dbo].[customer] ([customer_id], [name], [phone], [address], [username], [password], [status]) VALUES (9, N'Hoàng Công Hiệpp', N'01234556', N'Hà Nội ', N'hoangconghiep', N'123', N'Active')
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (6, 2, 1, 3, N'LG GRAM 17ZD90R-G.AX73A5 (256GB/GREY)', N'latop.jpg', 10000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (7, 2, 1, 2, N'Denim shirt', N'denimshirt.jpg', 2000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (8, 4, 2, 2, N'Denim shirt', N'denimshirt.jpg', 2000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (9, 4, 2, 1, N'Hoodie Boxy', N'hoodieboxy.jpg', 1000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (10, 5, 9, 1, N'Hoodie Boxy', N'hoodieboxy.jpg', 1000, 1)
INSERT [dbo].[order_detail] ([orderdetail_id], [order_id], [customer_id], [product_id], [product_name], [image], [list_price], [quantity_order]) VALUES (11, 5, 9, 2, N'Denim shirt', N'denimshirt.jpg', 2000, 1)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [price], [date], [status]) VALUES (2, 1, N'Đỗ Văn Đạtt', N'0902121881', N'Đan Phượng - Hà Nội', 13000, CAST(N'2023-06-24' AS Date), N'Wait')
INSERT [dbo].[orders] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [price], [date], [status]) VALUES (3, 1, N'Đỗ Văn Đạtt', N'0902121881', N'Đan Phượng - Hà Nội', 12000, CAST(N'2023-06-24' AS Date), N'Process')
INSERT [dbo].[orders] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [price], [date], [status]) VALUES (4, 2, N'Đỗ Thu Trang', N'0968519615', N'Đan Phượng - Hà Nội', 3000, CAST(N'2023-07-11' AS Date), N'Wait')
INSERT [dbo].[orders] ([order_id], [customer_id], [name_receiver], [phone_receiver], [address_receiver], [price], [date], [status]) VALUES (5, 9, N'Hoàng Công Hiệp', N'01234556', N'Hà Nội ', 3000, CAST(N'2023-07-22' AS Date), N'Done')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name], [status]) VALUES (1, N'Hoodie Boxy', N'Made in VietNam', N'hoodieboxy.jpg', 1000, 0.2, N'Garment', N'Stocking')
INSERT [dbo].[product] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name], [status]) VALUES (2, N'Denim shirt', N'Made in Korea', N'denimshirt.jpg', 2000, 0.4, N'Garment', N'Stocking')
INSERT [dbo].[product] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name], [status]) VALUES (3, N'LG GRAM 17ZD90R-G.AX73A5 (256GB/GREY)', N'Made in America', N'latop.jpg', 10000, 0, N'Technology', N'Stocking')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
USE [master]
GO
ALTER DATABASE [ProjectPRN291] SET  READ_WRITE 
GO
