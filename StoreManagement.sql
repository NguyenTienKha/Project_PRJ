
SET NOCOUNT ON
USE master
GO

IF exists (select * from sysdatabases where name='StoreManagement')
BEGIN
  RAISERROR('Dropping existing StoreManagement database ....',0,1)
  DROP database StoreManagement
END
GO

CHECKPOINT
GO

RAISERROR('Creating StoreManagement database....',0,1)
GO
   CREATE DATABASE StoreManagement
GO

CHECKPOINT
GO

USE StoreManagement
GO


/* Object:  Table [Account] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Account](
	[id] [int] IDENTITY(1,1),
	[email] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[password] [char](64) NOT NULL,
	[roleID] [char](50) NOT NULL
CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Object:  Table [Brand] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Object:  Table [Product] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product](
	[id] [int] IDENTITY(1,1),
	[name] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[price] [money] NOT NULL,
	[category] [int] REFERENCES [Category](id) NOT NULL,
CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Object:  Table [Order] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order](
    [id] [int] IDENTITY(1,1),
    [customer_id] [int] REFERENCES [Account](id) NOT NULL,
    orderDate datetime,
    TotalAmount money
CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Object:  Table [Order_Detail] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Order_Detail](
	[id] [int] IDENTITY(1,1),
	[order_id] [int] REFERENCES [Order](id),
	[product_id] [int] REFERENCES [Product](id),
	[quantity] [int] NOT NULL,
	[price] money,
CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/* ~~~ ADD VALUES INTO TABLE ~~~ */

/* data for table [Account]  */
SET IDENTITY_INSERT [Account] ON;
INSERT INTO [Account] ([id],[email],[name],[password],[roleID])
VALUES
(1,'admin@gmail.com','Admin','6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B','ADMIN'),
(2,'user@gmail.com','John','D4735E3A265E16EEE03F59718B9B5D03019C07D8B6C51F90DA3A666EEC13AB35','USER'),
(3,'user2@gmail.com','Beck','4E07408562BEDB8B60CE05C1DECFE3AD16B72230967DE01F640B7E4729B49FCE','USER')

SET IDENTITY_INSERT [Account] OFF;

/* data for table [Brand]  */
INSERT INTO [Category] 
VALUES
('1','Jordan'),
('2','Basketball'),
('3','Scoccer'),
('4','Lifestyle'),
('5','Running')

/* data for table [Product]  */
SET IDENTITY_INSERT [Product] ON;
INSERT INTO [Product]([id],[name],[image],[price],[category])
VALUES
(1,N'Tatum 2',N'https://i.imgur.com/WYvLWCL.jpeg',125,'1'),
(2,N'Air Jordan 1 Retro High OG',N'https://i.imgur.com/E9SUUP3.jpeg',180,'1'),
(3,N'Air Jordan 13 Retro "Blue Grey"',N'https://i.imgur.com/XPZQAEr.jpeg',200,'1'),
(4,N'Air Jordan 3 Retro Craft "Ivory"',N'https://i.imgur.com/iwiY9Fj.jpeg',210,'1'),
(5,N'Air Jordan 1 Mid',N'https://i.imgur.com/2ebH1mM.jpeg',125,'1'),
(6,N'Air Jordan 1 Zoom CMFT 2',N'https://i.imgur.com/k5CuQQy.jpeg',150,'1'),
(7,N'Air Jordan 1 Low SE',N'https://i.imgur.com/VJJfvgK.jpeg',125,'1'),
(8,N'Air Jordan 1 Mid SE',N'https://i.imgur.com/0fT6JCZ.jpeg',135,'1'),

(9,N'Nike G.T. Jump 2 ASW',N'https://i.imgur.com/t2R41eI.jpeg',190,'2'),
(10,N'LeBron NXXT Gen AMPD IPS',N'https://i.imgur.com/daZdQuL.jpeg',170,'2'),
(11,N'Nike Elevate 3',N'https://i.imgur.com/svpdwhj.jpeg',85,'2'),
(12,N'Nike Precision 6',N'https://i.imgur.com/vEnGSYr.jpeg',80,'2'),
(13,N'Air Jordan XXXVIII',N'https://i.imgur.com/hkTAHoJ.jpeg',200,'2'),
(14,N'Jordan Stay Loyal 3',N'https://i.imgur.com/Z9UsMUP.jpeg',115,'2'),
(15,N'KD Trey 5 X',N'https://i.imgur.com/Obvlkh7.jpeg',100,'2'),
(16,N'Nike G.T. Jump',N'https://i.imgur.com/6JilT9X.jpeg',180,'2'),

(17,N'Nike Superfly 9 Elite Mercurial Dream Speed',N'https://i.imgur.com/tufUvjr.jpeg',295,'3'),
(18,N'Nike Phantom Luna 2 Elite',N'https://i.imgur.com/FNyhPYz.jpeg',285,'3'),
(19,N'Nike Mercurial Superfly 9 Pro',N'https://i.imgur.com/WjBiDLL.jpeg',170,'3'),
(20,N'Nike Phantom Luna 2 Elite LV8',N'https://i.imgur.com/fHJrf8v.jpeg',295,'3'),
(21,N'Nike Phantom Luna Elite',N'https://i.imgur.com/GOEANux.jpeg',285,'3'),
(22,N'Nike Phantom GX Pro',N'https://i.imgur.com/lnHf5B7.jpeg',170,'3'),
(23,N'Nike Mercurial Superfly 9 Academy By You',N'https://i.imgur.com/vxgqmMy.jpeg',130,'3'),
(24,N'Nike Phantom Luna 2 Elite By You',N'https://i.imgur.com/C9UOwx8.jpeg',305,'3'),

(25,N'Nike Dunk Low Retro',N'https://i.imgur.com/6XZX7n9.jpeg',115,'4'),
(26,N'Nike Air Max Plus Drift',N'https://i.imgur.com/Uj86aoU.jpeg',185,'4'),
(27,N'Nike Air Max 90',N'https://i.imgur.com/cJoHTaJ.jpeg',140,'4'),
(28,N'Nike Air Force 1 ''07',N'https://i.imgur.com/Zs8xdNi.jpeg',115,'4'),
(29,N'Nike Air Max 90 GORE-TEX',N'https://i.imgur.com/nhbuGrZ.jpeg',160,'4'),
(30,N'Nike Air Max 270',N'https://i.imgur.com/kFEdzZl.jpeg',160,'4'),
(31,N'Nike Dunk High Retro',N'https://i.imgur.com/iyzf6Zx.jpeg',130,'4'),
(32,N'Nike Blazer Mid ''77 Vintage',N'https://i.imgur.com/ZGmHV0Q.jpeg',105,'4'),

(33,N'Nike InfinityRN 4',N'https://i.imgur.com/NqgDKuc.jpeg',160,'5'),
(34,N'Nike Vaporfly 3',N'https://i.imgur.com/u3b8BDu.jpeg',270,'5'),
(35,N'Nike InfinityRN 4 GORE-TEX',N'https://i.imgur.com/XZQhriu.jpeg',180,'5'),
(36,N'Nike Alphafly 3',N'https://i.imgur.com/EiWb2WN.jpeg',285,'5'),
(37,N'Nike Pegasus FlyEase',N'https://i.imgur.com/Uk8nYPV.jpeg',130,'5'),
(38,N'Nike Pegasus Trail 3',N'https://i.imgur.com/07bxPhE.jpeg',140,'5'),
(39,N'Nike Pegasus Trail 4 GORE-TEX By You',N'https://i.imgur.com/G70WAzW.jpeg',190,'5'),
(40,N'Nike Pegasus FlyEase By You',N'https://i.imgur.com/lNFOu3I.jpeg',160,'5')

SET IDENTITY_INSERT [Product] OFF;
