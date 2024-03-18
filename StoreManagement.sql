
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
	[Gender] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[CategoryId] [int] NOT NULL REFERENCES [Category](Id),
CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Table [Product_Size] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size] (
    [ProductId] [int] REFERENCES [Product](Id),
    [Size] [nvarchar](10) NOT NULL
)
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
('3','Air Force 1'),
('4','Air Max'),
('5','Blazer')

/* data for table [Product]  */
SET IDENTITY_INSERT [Product] ON;
INSERT INTO [Product]([Id],[Name],[Gender],[Price],[Discount],[CategoryId])
VALUES
(1,N'Air Jordan 1 Retro High OG "Black/White"','Men',180,0.1,'1'),
(2,N'Air Jordan 5 Retro "Lucky Green"','Women',210,0.2,'1'),
(3,N'Air Jordan 3 Retro Craft "Ivory"','Men',210,0,'1'),
(4,N'Air Jordan 1 Retro High OG "White and Gold"','Women',180,0,'1'),
(5,N'Air Jordan 1 Mid','Men',125,0,'1'),
(6,N'Air Jordan 1 Low','Women',115,0,'1'),
(7,N'Air Jordan 1 Retro High OG "Yellow Ochre"','Men',180,0.2,'1'),
(8,N'Air Jordan 1 High Method of Make','Women',155,0.1,'1'),

(9,N'Sabrina 1 "BKLYN''s Finest"','Men',130,0,'2'),
(10,N'Nike G.T. Hustle 2','Women',170,0,'2'),
(11,N'Nike G.T. Jump 2','Men',180,0,'2'),
(12,N'Ja 1 "Bite"','Women',130,0,'2'),
(13,N'LeBron XXI "Queen Conch"','Men',210,0.2,'2'),
(14,N'LeBron NXXT Gen AMPD IPS','Women',170,0,'2'),
(15,N'Nike G.T. Jump','Men',180,0.14,'2'),
(16,N'Zion 3','Women',140,0,'2'),

(17,N'Nike Air Force 1 ''07','Men',115,0,'3'),
(18,N'Nike Air Force 1 ''07','Women',115,0,'3'),
(19,N'Nike Air Force 1 ''07 LV8','Men',125,0,'3'),
(20,N'Nike Air Force 1 Wild','Women',145,0.2,'3'),
(21,N'Nike Air Force 1 ''07 LX','Men',135,0,'3'),
(22,N'Nike Air Force 1 Shadow','Women',135,0,'3'),
(23,N'Nike Air Force 1 ''07 WB','Men',135,0.1,'3'),
(24,N'Nike Air Force 1 Premium','Women',130,0.24,'3'),

(25,N'Nike Air Max Dn','Men',160,0,'4'),
(26,N'Nike Air Max 90','Women',130,0,'4'),
(27,N'Nike Air Max Plus Drift','Men',185,0.3,'4'),
(28,N'Nike Air Max 1','Men',140,0,'4'),
(29,N'Nike Air Max 270','Women',160,0.1,'4'),
(30,N'Nike Air Max 90 GORE-TEX','Men',160,0,'4'),
(31,N'Nike Air Max SC','Women',90,0,'4'),
(32,N'Nike Air Max 90 LV8','Women',150,0.2,'4'),

(33,N'Nike Blazer Mid ''77 Vintage','Men',105,0.14,'5'),
(34,N'Nike Blazer Low ''77','Women',90,0,'5'),
(35,N'Nike Blazer Low ''77 Vintage','Men',90,0.2,'5'),
(36,N'Nike Blazer Mid ''77','Women',105,0,'5'),
(37,N'Nike SB Zoom Blazer Low Pro GT','Men',85,0,'5'),
(38,N'Nike Blazer Mid Victory','Women',120,0,'5'),
(39,N'Nike Blazer Mid ''77 Premium','Men',110,0,'5'),
(40,N'Nike Blazer Mid ''77 Canvas','Women',100,0.29,'5')

SET IDENTITY_INSERT [Product] OFF;


INSERT INTO [Product_Size] ([ProductId], [Size])
VALUES
(1, '38'), (1, '39'), (1, '40'), (1, '41'), (1, '42'), (1, '43'),
(2, '38'), (2, '39'), (2, '40'), (2, '41'), (2, '42'), (2, '43'),
(3, '38'), (3, '39'), (3, '40'), (3, '41'), (3, '42'), (3, '43'),
(4, '38'), (4, '39'), (4, '40'), (4, '41'), (4, '42'), (4, '43'),
(5, '38'), (5, '39'), (5, '40'), (5, '41'), (5, '42'), (5, '43'),
(6, '38'), (6, '39'), (6, '40'), (6, '41'), (6, '42'), (6, '43'),
(7, '38'), (7, '39'), (7, '40'), (7, '41'), (7, '42'), (7, '43'),
(8, '38'), (8, '39'), (8, '40'), (8, '41'), (8, '42'), (8, '43'),
(9, '38'), (9, '39'), (9, '40'), (9, '41'), (9, '42'), (9, '43'),
(10, '38'), (10, '39'), (10, '40'), (10, '41'), (10, '42'), (10, '43'),
(11, '38'), (11, '39'), (11, '40'), (11, '41'), (11, '42'), (11, '43'),
(12, '38'), (12, '39'), (12, '40'), (12, '41'), (12, '42'), (12, '43'),
(13, '38'), (13, '39'), (13, '40'), (13, '41'), (13, '42'), (13, '43'),
(14, '38'), (14, '39'), (14, '40'), (14, '41'), (14, '42'), (14, '43'),
(15, '38'), (15, '39'), (15, '40'), (15, '41'), (15, '42'), (15, '43'),
(16, '38'), (16, '39'), (16, '40'), (16, '41'), (16, '42'), (16, '43'),
(17, '38'), (17, '39'), (17, '40'), (17, '41'), (17, '42'), (17, '43'),
(18, '38'), (18, '39'), (18, '40'), (18, '41'), (18, '42'), (18, '43'),
(19, '38'), (19, '39'), (19, '40'), (19, '41'), (19, '42'), (19, '43'),
(20, '38'), (20, '39'), (20, '40'), (20, '41'), (20, '42'), (20, '43'),
(21, '38'), (21, '39'), (21, '40'), (21, '41'), (21, '42'), (21, '43'),
(22, '38'), (22, '39'), (22, '40'), (22, '41'), (22, '42'), (22, '43'),
(23, '38'), (23, '39'), (23, '40'), (23, '41'), (23, '42'), (23, '43'),
(24, '38'), (24, '39'), (24, '40'), (24, '41'), (24, '42'), (24, '43'),
(25, '38'), (25, '39'), (25, '40'), (25, '41'), (25, '42'), (25, '43'),
(26, '38'), (26, '39'), (26, '40'), (26, '41'), (26, '42'), (26, '43'),
(27, '38'), (27, '39'), (27, '40'), (27, '41'), (27, '42'), (27, '43'),
(28, '38'), (28, '39'), (28, '40'), (28, '41'), (28, '42'), (28, '43'),
(29, '38'), (29, '39'), (29, '40'), (29, '41'), (29, '42'), (29, '43'),
(30, '38'), (30, '39'), (30, '40'), (30, '41'), (30, '42'), (30, '43'),
(31, '38'), (31, '39'), (31, '40'), (31, '41'), (31, '42'), (31, '43'),
(32, '38'), (32, '39'), (32, '40'), (32, '41'), (32, '42'), (32, '43'),
(33, '38'), (33, '39'), (33, '40'), (33, '41'), (33, '42'), (33, '43'),
(34, '38'), (34, '39'), (34, '40'), (34, '41'), (34, '42'), (34, '43'),
(35, '38'), (35, '39'), (35, '40'), (35, '41'), (35, '42'), (35, '43'),
(36, '38'), (36, '39'), (36, '40'), (36, '41'), (36, '42'), (36, '43'),
(37, '38'), (37, '39'), (37, '40'), (37, '41'), (37, '42'), (37, '43'),
(38, '38'), (38, '39'), (38, '40'), (38, '41'), (38, '42'), (38, '43'),
(39, '38'), (39, '39'), (39, '40'), (39, '41'), (39, '42'), (39, '43'),
(40, '38'), (40, '39'), (40, '40'), (40, '41'), (40, '42'), (40, '43');


