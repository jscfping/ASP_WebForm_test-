GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asp_demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asp_demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asp_demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asp_demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asp_demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asp_demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [asp_demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asp_demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asp_demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asp_demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asp_demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asp_demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asp_demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asp_demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asp_demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asp_demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [asp_demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asp_demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asp_demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asp_demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asp_demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asp_demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asp_demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asp_demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [asp_demo] SET  MULTI_USER 
GO
ALTER DATABASE [asp_demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asp_demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asp_demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asp_demo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [asp_demo]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 2020/2/15 下午 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment_id] [uniqueidentifier] NOT NULL,
	[author_id] [uniqueidentifier] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[created_time] [datetime] NOT NULL,
	[edited_time] [datetime] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[items]    Script Date: 2020/2/15 下午 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_items_item_id]  DEFAULT (newid()),
	[item_name] [nvarchar](256) NULL,
	[item_desc] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[price] [float] NULL,
	[category] [nvarchar](256) NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order_details]    Script Date: 2020/2/15 下午 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_detail_id] [uniqueidentifier] NOT NULL,
	[order_id] [uniqueidentifier] NULL,
	[item_id] [uniqueidentifier] NULL,
	[price] [float] NULL,
	[quantity] [float] NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 2020/2/15 下午 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [uniqueidentifier] NOT NULL,
	[datetime] [datetime] NULL,
	[customer_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[shop_carts]    Script Date: 2020/2/15 下午 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_carts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shop_cart_id] [uniqueidentifier] NOT NULL,
	[customer_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_shop_carts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 2020/2/15 下午 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](256) NULL,
	[nickname] [nvarchar](50) NULL,
	[description] [nvarchar](256) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[items] ON 

INSERT [dbo].[items] ([id], [item_id], [item_name], [item_desc], [img], [price], [category]) VALUES (1, N'b44aa71d-c598-4483-aeec-20f234954062', N'笑臉', N'表示快樂', N'\public\imgs\happy.png', 100, N'emoticon')
INSERT [dbo].[items] ([id], [item_id], [item_name], [item_desc], [img], [price], [category]) VALUES (2, N'4fae08a9-694b-44b7-9e2a-7cfcfaa51ea2', N'笑而不語', N'尷尬又不失禮貌的微笑', N'\public\imgs\pa.png', 150, N'emoticon')
INSERT [dbo].[items] ([id], [item_id], [item_name], [item_desc], [img], [price], [category]) VALUES (3, N'69fcec9a-f205-47d9-9b95-44923bc5c738', N'淡定', N'你要喝杯紅茶嗎', N'\public\imgs\redtea.png', 300, N'emoticon')
INSERT [dbo].[items] ([id], [item_id], [item_name], [item_desc], [img], [price], [category]) VALUES (4, N'cdd242a6-4699-4926-945a-8b288035d61c', N'九星大禮', N'有錢也買不到', N'\public\imgs\sur_00.png', 999, N'sur')
INSERT [dbo].[items] ([id], [item_id], [item_name], [item_desc], [img], [price], [category]) VALUES (5, N'5af0c149-ee62-4572-9ff1-6499c0e161ed', N'大發現', N'原來如此...', N'\public\imgs\str_01.png', 30, N'gold_string')
SET IDENTITY_INSERT [dbo].[items] OFF
ALTER TABLE [dbo].[comments] ADD  CONSTRAINT [DF_comments_comment_id]  DEFAULT (newid()) FOR [comment_id]
GO
ALTER TABLE [dbo].[comments] ADD  CONSTRAINT [DF_comments_datetime]  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[order_details] ADD  CONSTRAINT [DF_order_details_order_detail_id]  DEFAULT (newid()) FOR [order_detail_id]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_order_id]  DEFAULT (newid()) FOR [order_id]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_Table_1_order_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[shop_carts] ADD  CONSTRAINT [DF_shop_carts_shop_cart_id]  DEFAULT (newid()) FOR [shop_cart_id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_uid]  DEFAULT (newid()) FOR [uid]
GO
USE [master]
GO
ALTER DATABASE [asp_demo] SET  READ_WRITE 
GO
