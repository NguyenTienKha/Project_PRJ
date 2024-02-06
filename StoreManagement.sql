set nocount on
USE master
GO

print('Creating the database StoreManagement....')
CREATE DATABASE StoreManagement
GO

USE StoreManagement
GO

create table Account(
	Id [int] identity primary key,
	Email [varchar](50) NOT NULL,
	Name [nvarchar](50) NOT NULL,
	RoleId [char](50) NOT NULL,
	Password [varchar](20) NOT NULL
)
GO
raiserror('Creating Table Brand....',0,1)
create table Brand
(
	Id	char(3) primary key clustered,
	Name	varchar(20) not null,
)
go
create table Product
(
	Id int identity primary key,				
	Name varchar(50) not null,
	Brand	char(3) references Brand(Id),
	Price money not null
)
GO
print('Populating data into tables....')

/* data for account  */
insert into Account values
('admin@gmail.com','Nguyen Tien Kha','ADMIN','1'),
('user@gmail.com','John','USER','2')
GO
/* data for brand  */
insert into Brand values('001','HP')
insert into Brand values('002','Apple')

/* data for product  */
insert into Product values
('Laptop HP Pavilion','001',100),
('Macbook Pro M1','002',99),
('Macbook Air M2','002',98)
GO
print('The database StudentManagement now ready for use.')