CREATE DATABASE [WaxStoreDB]
GO
USE [WaxStoreDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/04/2021 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 20/04/2021 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20/04/2021 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [nvarchar](10) NOT NULL,
	[user_id] [nvarchar](10) NULL,
	[order_date] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 20/04/2021 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[id] [nvarchar](10) NOT NULL,
	[order_id] [nvarchar](10) NULL,
	[product_id] [nvarchar](10) NULL,
	[product_name] [nvarchar](50) NULL,
	[product_price] [float] NULL,
	[product_image] [nvarchar](50) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/04/2021 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [float] NULL,
	[rate] [float] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[category_id] [nvarchar](10) NULL,
	[company_id] [nvarchar](10) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/04/2021 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[addresss] [nvarchar](50) NULL,
	[account] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Order]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
