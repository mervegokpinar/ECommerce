USE [master]
GO
/****** Object:  Database [MyECommerce]    Script Date: 6.10.2019 12:24:08 ******/
CREATE DATABASE [MyECommerce] ON  PRIMARY 
( NAME = N'MyECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyECommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyECommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyECommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyECommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyECommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [MyECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [MyECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyECommerce] SET DB_CHAINING OFF 
GO
USE [MyECommerce]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[Address] [ntext] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[Address] [ntext] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[MemberId] [int] NULL,
	[IsPay] [bit] NULL,
	[TotalPrice] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[Stock] [int] NULL,
	[BrandId] [int] NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6.10.2019 12:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName], [Photo], [Description]) VALUES (3, N'Seoree', N'8efb6cd0013945cd9ace6fe7618a26f1.jpg', N'World Renowned Brand ')
SET IDENTITY_INSERT [dbo].[Brand] OFF
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description], [CreatedDate]) VALUES (N'24ec2f63-f61c-4389-9f62-df6e9d387749', N'Fruit', N'All kind of fruit', NULL)
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [OrderId], [PaymentTypeId], [PaymentDate], [Address]) VALUES (18, 52, 1, CAST(N'2019-10-06T11:59:32.173' AS DateTime), N'a')
INSERT [dbo].[Invoice] ([InvoiceId], [OrderId], [PaymentTypeId], [PaymentDate], [Address]) VALUES (19, 53, 2, CAST(N'2019-10-06T12:05:42.103' AS DateTime), N'a')
INSERT [dbo].[Invoice] ([InvoiceId], [OrderId], [PaymentTypeId], [PaymentDate], [Address]) VALUES (20, 54, 1, CAST(N'2019-10-06T12:07:21.133' AS DateTime), N'a')
INSERT [dbo].[Invoice] ([InvoiceId], [OrderId], [PaymentTypeId], [PaymentDate], [Address]) VALUES (21, 55, 1, CAST(N'2019-10-06T12:10:28.933' AS DateTime), N'a')
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([UserId], [FirstName], [LastName], [Email], [Password], [RoleId], [Address]) VALUES (8, N'Merve', N'Gokpinar', N'mervestore2@gmail.com', N'1', 1, N'a')
INSERT [dbo].[Member] ([UserId], [FirstName], [LastName], [Email], [Password], [RoleId], [Address]) VALUES (9, N'User', N'User', N'mervestore2@gmail.com', N'2', 2, N'a')
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderDate], [MemberId], [IsPay], [TotalPrice]) VALUES (52, CAST(N'2019-10-06T11:58:26.037' AS DateTime), 9, 1, 38.0000)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [MemberId], [IsPay], [TotalPrice]) VALUES (53, CAST(N'2019-10-06T12:04:44.760' AS DateTime), 9, 1, 39.0000)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [MemberId], [IsPay], [TotalPrice]) VALUES (54, CAST(N'2019-10-06T12:06:56.563' AS DateTime), 9, 1, 25.0000)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [MemberId], [IsPay], [TotalPrice]) VALUES (55, CAST(N'2019-10-06T12:10:15.813' AS DateTime), 9, 1, 8.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (52, 6, 1, 5.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (52, 8, 1, 16.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (52, 9, 1, 17.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (53, 6, 1, 10.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (53, 7, 1, 12.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (53, 9, 1, 17.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (54, 6, 1, 5.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (54, 7, 1, 12.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (54, 8, 1, 8.0000)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (55, 8, 1, 8.0000)
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [PaymentName]) VALUES (1, N'Direct Bank Transfer')
INSERT [dbo].[Payment] ([PaymentId], [PaymentName]) VALUES (2, N'Cheque Payment')
INSERT [dbo].[Payment] ([PaymentId], [PaymentName]) VALUES (3, N'Paypal')
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Stock], [BrandId], [CategoryId], [Photo]) VALUES (6, N'Apple', 5.0000, 10, 3, N'24ec2f63-f61c-4389-9f62-df6e9d387749', N'8adc07ae621243e28811f79e50e87176.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Stock], [BrandId], [CategoryId], [Photo]) VALUES (7, N'Watermelon', 12.0000, 4, 3, N'24ec2f63-f61c-4389-9f62-df6e9d387749', N'aaa6bd8e253a4d68950fc6a0ea478808.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Stock], [BrandId], [CategoryId], [Photo]) VALUES (8, N'Grape', 8.0000, 6, 3, N'24ec2f63-f61c-4389-9f62-df6e9d387749', N'c46e23f8713449d09c09dcca0e4154bf.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [Stock], [BrandId], [CategoryId], [Photo]) VALUES (9, N'Plum', 17.0000, 7, 3, N'24ec2f63-f61c-4389-9f62-df6e9d387749', N'ae723c8d28eb4637b71467aef220d9e9.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Order]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Payment] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[Payment] ([PaymentId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Payment]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_UserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRole] ([RoleId])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_UserRole]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [MyECommerce] SET  READ_WRITE 
GO
