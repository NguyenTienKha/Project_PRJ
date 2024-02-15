
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
CREATE TABLE [Account](
	[uID] [int] IDENTITY(1,1)  PRIMARY KEY,
	[uEmail] [varchar](255) NULL,
	[uName] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[roleID] [char](50) NOT NULL
)
GO

/* Object:  Table [Brand] */ 
CREATE TABLE [Brand](
	[bID] [int] PRIMARY KEY,
	[bName] [nvarchar](50) NOT NULL
)
GO

/* Object:  Table [Product] */ 
CREATE TABLE [Product](
	[pID] [int] IDENTITY(1,1) PRIMARY KEY,
	[pName] [nvarchar](max) NULL,
	[pImage] [nvarchar](max) NULL,
	[pPrice] [money] NULL,
	[bID] [int] REFERENCES [Brand](bID)
)
GO

/* Object:  Table [Cart] */
CREATE TABLE [Cart](
	[uID] [int] NOT NULL REFERENCES [Account](uID),
	[pID] [int] NOT NULL REFERENCES [Product](pID),
	[amount] [int] NOT NULL,
	PRIMARY KEY ([uID],[pID])
)
GO



/* ~~~ ADD VALUES INTO TABLE ~~~ */

/* data for table [Account]  */
SET IDENTITY_INSERT [Account] ON;
INSERT INTO [Account] ([uID],[uEmail],[uName],[password],[roleID])
VALUES
(1,'admin@gmail.com','Nguyen Tien Kha','1','ADMIN'),
(2,'user@gmail.com','John','2','USER')
SET IDENTITY_INSERT [Account] OFF;

/* data for table [Brand]  */
INSERT INTO [Brand] 
VALUES
('101','HP'),
('102','Apple')

/* data for table [Product]  */
SET IDENTITY_INSERT [Product] ON;
INSERT INTO [Product]([pID],[pName],[pImage],[pPrice],[bID])
VALUES
(1,'Laptop HP Pavilion',N'https://i.imgur.com/zbQaCMH_d.jpg?maxwidth=520&shape=thumb&fidelity=high',100,'101'),
(2,'Macbook Pro M1',N'https://i.imgur.com/etIVUHD_d.jpg?maxwidth=520&shape=thumb&fidelity=high',99,'102'),
(3,'Macbook Air M2',N'https://i.imgur.com/uWrem2m_d.jpg?maxwidth=520&shape=thumb&fidelity=high',98,'102')
SET IDENTITY_INSERT [Product] OFF;
