create database MasterFloor
use MasterFloor

create table TypeMaterial
(
Id int primary key identity,
[Name] nvarchar(50),
[Percent] decimal(10,2)
)

create table TypeProduct
(
Id int primary key identity,
[Name] nvarchar(50),
Coefficient decimal(10,2)
)

create table TypePartner
(
Id int primary key identity,
[Name] nvarchar(50)
)

create table [Partner]
(
Id int primary key identity,
TypePartner int foreign key references TypePartner(Id),
[Name] nvarchar(100),
Director nvarchar(200),
Email nvarchar(100),
Phone nvarchar(20),
[Address] nvarchar(200),
INN nvarchar(10),
Rating int
)

create table Product
(
Id int primary key identity,
TypeProduct int foreign key references TypeProduct(Id),
[Name] nvarchar(200),
Articul nvarchar(50),
MinPrice decimal(10,2)
)

create table PartnerProduct
(
Id int primary key identity,
Product int foreign key references Product(Id),
[Partner] int foreign key references [Partner](Id),
CountProduct int,
DateSale date,
Employee int foreign key references Employee(Id),
)

create table MaterialProduct
(
Id int primary key identity,
Product int foreign key references Product(Id),
TypeMaterial int foreign key references TypeMaterial(Id)
)

create table [Role]
(
Id int primary key identity,
[Name] nvarchar(50)
)


create table Employee
(
Id int primary key identity,
LastName nvarchar(50),
FirstName nvarchar(50),
MiddleName nvarchar(50),
DateOfBirth date,
PassportSerial nvarchar(4),
PassportNumber nvarchar(6),
BankDetails nvarchar(100),
Family bit,
Health nvarchar(100),
[Role] int foreign key references [Role](Id)
)

create table [Order]
(
Id int primary key identity,
Product int foreign key references Product(Id),
)