
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


/* Table [Account] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1),
	[Email] [varchar](255) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Password] [char](64) NOT NULL,
	[RoleID] [char](50) NOT NULL,
CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Table [Employee] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1),
	[Position] [nvarchar](50) NOT NULL,
	[AccountId] [int] REFERENCES [Account](Id),
CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Table [Customer] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1),
	[AccountId] [int] REFERENCES [Account](Id),
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/* Table [Category] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Table [Product] */ 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1),
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[CategoryId] [int] NOT NULL REFERENCES [Category](Id),
CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Table [Order] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
    [Id] [int] IDENTITY(1,1),
    [CustomerId] [int] NOT NULL REFERENCES [Account](Id),
    [Date] [datetime] NOT NULL,
	[Status] [varchar](30) NULL,
CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Table [Order_Detail] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Id] [int] IDENTITY(1,1),
	[OrderId] [int] NOT NULL REFERENCES [Order](Id),
	[ProductId] [int] NOT NULL REFERENCES [Product](Id),
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NOT NULL,
CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/* ~~~ ADD VALUES INTO TABLE ~~~ */

/* data for table [Account]  */
SET IDENTITY_INSERT [Account] ON;
INSERT INTO [Account] ([Id],[Email],[FullName],[Password],[RoleID])
VALUES
(1,'admin@gmail.com','Admin','6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B','AD'),
(2,'user1@gmail.com','John','D4735E3A265E16EEE03F59718B9B5D03019C07D8B6C51F90DA3A666EEC13AB35','US'),
(3,'user2@gmail.com','Beck','4E07408562BEDB8B60CE05C1DECFE3AD16B72230967DE01F640B7E4729B49FCE','US')
SET IDENTITY_INSERT [Account] OFF;

/* data for table [Employee]  */
SET IDENTITY_INSERT [Employee] ON;
INSERT INTO [Employee] ([Id],[Position],[AccountId])
VALUES
(1,'Admin',1)
SET IDENTITY_INSERT [Employee] OFF;

/* data for table [Customer]  */
SET IDENTITY_INSERT [Customer] ON;
INSERT INTO [Customer] ([Id],[AccountId])
VALUES
(2,2),
(3,3)
SET IDENTITY_INSERT [Customer] OFF;

/* data for table [Category]  */
INSERT INTO [Category] 
VALUES
('1','Jordan'),
('2','Basketball'),
('3','Scoccer'),
('4','Lifestyle'),
('5','Running')

/* data for table [Product]  */
SET IDENTITY_INSERT [Product] ON;
INSERT INTO [Product]([Id],[Name],[Price],[Discount],[CategoryId])
VALUES
(1,N'Tatum 2',125,0.1,'1'),
(2,N'Air Jordan 1 Retro High OG',180,0.2,'1'),
(3,N'Air Jordan 13 Retro "Blue Grey"',200,0,'1'),
(4,N'Air Jordan 3 Retro Craft "Ivory"',210,0,'1'),
(5,N'Air Jordan 1 Mid',125,0,'1'),
(6,N'Air Jordan 1 Zoom CMFT 2',150,0,'1'),
(7,N'Air Jordan 1 Low SE',125,0.2,'1'),
(8,N'Air Jordan 1 Mid SE',135,0.1,'1'),

(9,N'Nike G.T. Jump 2 ASW',190,0.1,'2'),
(10,N'LeBron NXXT Gen AMPD IPS',170,0,'2'),
(11,N'Nike Elevate 3',85,0,'2'),
(12,N'Nike Precision 6',80,0,'2'),
(13,N'Air Jordan XXXVIII',200,0.2,'2'),
(14,N'Jordan Stay Loyal 3',115,0,'2'),
(15,N'KD Trey 5 X',100,0,'2'),
(16,N'Nike G.T. Jump',180,0,'2'),

(17,N'Nike Superfly 9 Elite Mercurial Dream Speed',295,0,'3'),
(18,N'Nike Phantom Luna 2 Elite',285,0.1,'3'),
(19,N'Nike Mercurial Superfly 9 Pro',170,0,'3'),
(20,N'Nike Phantom Luna 2 Elite LV8',295,0.2,'3'),
(21,N'Nike Phantom Luna Elite',285,0,'3'),
(22,N'Nike Phantom GX Pro',170,0,'3'),
(23,N'Nike Mercurial Superfly 9 Academy By You',130,0.1,'3'),
(24,N'Nike Phantom Luna 2 Elite By You',305,0,'3'),

(25,N'Nike Dunk Low Retro',115,0,'4'),
(26,N'Nike Air Max Plus Drift',185,0,'4'),
(27,N'Nike Air Max 90',140,0.3,'4'),
(28,N'Nike Air Force 1 ''07',115,0,'4'),
(29,N'Nike Air Max 90 GORE-TEX',160,0.1,'4'),
(30,N'Nike Air Max 270',160,0,'4'),
(31,N'Nike Dunk High Retro',130,0,'4'),
(32,N'Nike Blazer Mid ''77 Vintage',105,0.2,'4'),

(33,N'Nike InfinityRN 4',160,0,'5'),
(34,N'Nike Vaporfly 3',270,0,'5'),
(35,N'Nike InfinityRN 4 GORE-TEX',180,0.2,'5'),
(36,N'Nike Alphafly 3',285,0,'5'),
(37,N'Nike Pegasus FlyEase',130,0,'5'),
(38,N'Nike Pegasus Trail 3',140,0,'5'),
(39,N'Nike Pegasus Trail 4 GORE-TEX By You',190,0,'5'),
(40,N'Nike Pegasus FlyEase By You',160,0.2,'5')

SET IDENTITY_INSERT [Product] OFF;
