
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
(2,'user@gmail.com','John','2','USER'),
(3,'user2@gmail.com','Beck','3','USER')

SET IDENTITY_INSERT [Account] OFF;

/* data for table [Brand]  */
INSERT INTO [Brand] 
VALUES
('101','HP'),
('102','APPLE'),
('103','LENOVO'),
('104','ASUS'),
('105','DELL')

/* data for table [Product]  */
SET IDENTITY_INSERT [Product] ON;
INSERT INTO [Product]([pID],[pName],[pImage],[pPrice],[bID])
VALUES
(1,'Laptop HP Pavilion 14-DV2073TU 7C0P2PA',N'https://i.imgur.com/hdOsXKX.jpg',16490000,'101'),
(2,'Laptop HP Victus 15-FA1155TX 952R1PA',N'https://i.imgur.com/OgxzatB.jpg',17990000,'101'),
(3,'Laptop HP Pavilion 15-EG2089TU 7C0R1PA',N'https://i.imgur.com/YQJCml6.jpg',17990000,'101'),
(4,'Laptop HP Envy X360 BF0112TU 7C0N9PA',N'https://i.imgur.com/IcKYiBT.jpg',22990000,'101'),
(5,'Laptop HP Gaming Victus 15-FB1023AX 94F20PA',N'https://i.imgur.com/hkYIoKm.jpg',17590000,'101'),
(6,'Laptop HP 14S DQ2644TU',N'https://i.imgur.com/X0dOn50.jpg',8990000,'101'),
(7,'Laptop HP Envy X360 2IN1 14-ES0013',N'https://i.imgur.com/gCLBfUq.jpg',17990000,'101'),
(8,'Laptop HP Gaming Victus 15-FA0031DX 6503849',N'https://i.imgur.com/HeDtjBP.jpg',160990000,'101'),

(9,'iMac M3 24 inch 8GB 256GB 8GPU',N'https://i.imgur.com/0M3dZVb.jpg',35990000,'102'),
(10,'Apple MacBook Air M1 256GB 2020',N'https://i.imgur.com/joeyyAn.jpg',18290000,'102'),
(11,'Apple Macbook Air M2 2022 8GB 256GB',N'https://i.imgur.com/T2G5Nmh.jpg',26390000,'102'),
(12,'Macbook Pro 14 M3 Pro 18GB - 512GB',N'https://i.imgur.com/s6h5PGB.jpg',49990000,'102'),
(13,'Apple Macbook Pro 13 M2 2022 8GB 256GB',N'https://i.imgur.com/Epa9Pfs.jpg',29590000,'102'),
(14,'Apple MacBook Pro 13 M2 2022 16GB 256GB',N'https://i.imgur.com/fvjAVey.jpg',35390000,'102'),
(15,'Macbook Air 15 inch M2 2023 8GB 256GB',N'https://i.imgur.com/Km9q9iM.jpg',28990000,'102'),
(16,'Apple Macbook Air M2 2022 16GB 512GB',N'https://i.imgur.com/8GJrHKL.jpg',36990000,'102'),

(17,'Laptop Lenovo Yoga Duet 7 13ITL6 82MA009NVN',N'https://i.imgur.com/TWbOp7s.jpg',18990000,'103'),
(18,'Laptop Lenovo IdeaPad Gaming 3 15ACH6 82K2027QVN',N'https://i.imgur.com/6gyfYVf.jpg',14990000,'103'),
(19,'Laptop Lenovo Ideapad Gaming 3 15ARH7 82SB00BBVN',N'https://i.imgur.com/qQFClMH.jpg',17490000,'103'),
(20,'Laptop Lenovo LOQ 15APH8 82XT00BTVN',N'https://i.imgur.com/jEGpwcS.jpeg',22990000,'103'),
(21,'Laptop Lenovo Ideapad Flex 5 14ALC7 82R900ECVN',N'https://i.imgur.com/N5o848c.jpeg',15490000,'103'),
(22,'Laptop Lenovo Yoga Duet 7 13ITL6 82MA009PVN',N'https://i.imgur.com/9QmqLu4.jpeg',25990000,'103'),
(23,'Laptop Lenovo LOQ 15IAX9 83GS000FVN',N'https://i.imgur.com/jsi7dE2.jpeg',19490000,'103'),
(24,'Laptop Lenovo Yoga Slim 7 14ACN6 82N7002MVN',N'https://i.imgur.com/VxgPPmT.jpeg',20490000,'103'),

(25,'Laptop Asus TUF GAMING F15 FX506HF-HN014W',N'https://i.imgur.com/x9Vasdh.jpeg',1590000,'104'),
(26,'Laptop Asus TUF Gaming F15 FX507ZC4-HN099W',N'https://i.imgur.com/okXXX4q.jpeg',20990000,'104'),
(27,'Laptop Asus Zenbook 14 OLED UM3402YA-KM405W',N'https://i.imgur.com/Ka0K4YI.jpeg',20490000,'104'),
(28,'Laptop Asus Zenbook 14 Oled UX3405MA-PP151W',N'https://i.imgur.com/35L7yTE.jpeg',27390000,'104'),
(29,'Laptop Asus VivoBook 14X OLED S3405VA-KM071W',N'https://i.imgur.com/4Ix2BYe.jpeg',22330000,'104'),
(30,'Laptop Asus ROG Strix G16 G614JU-N3135W',N'https://i.imgur.com/M9JafrG.jpeg',31990000,'104'),
(31,'Laptop Asus TUF Gaming A15 FA507NU-LP131W',N'https://i.imgur.com/hm45sJp.jpeg',22490000,'104'),
(32,'Laptop ASUS ROG Flow X13 GV301RC-LJ050W',N'https://i.imgur.com/dzPCPH4.jpeg',26490000,'104'),

(33,'Laptop Dell Inspiron 14 I7430-7374SLV CN29D',N'https://i.imgur.com/9oqggSi.jpeg',21490000,'105'),
(34,'Laptop Dell Inspiron 15 3520-5810BLK 102F0',N'https://i.imgur.com/GzceoqY.jpeg',11990000,'105'),
(35,'Laptop Dell Inspiron 15 3520 D5N53',N'https://i.imgur.com/UKs7Nsl.jpeg',9990000,'105'),
(36,'Laptop Dell Inspiron 15 3520 YTC9K',N'https://i.imgur.com/4kMvuSD.jpeg',12590000,'105'),
(37,'Laptop Dell Latitude 5330 27KJ4',N'https://i.imgur.com/wgxb2WZ.jpeg',16990000,'105'),
(38,'Laptop Dell Vostro 3520 GD02R',N'https://i.imgur.com/QFpIbUl.jpeg',13490000,'105'),
(39,'Laptop Dell Latidude 7320 9PPWV',N'https://i.imgur.com/0Kk0OlP.jpeg',16990000,'105'),
(40,'Laptop Dell Inspiron 7506-5903SLV',N'https://i.imgur.com/J89mw8W.jpeg',17990000,'105')

SET IDENTITY_INSERT [Product] OFF;
