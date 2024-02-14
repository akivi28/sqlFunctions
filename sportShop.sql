use master
go
create database[SportShop2]
go

use[SportShop2]
go

create table [TypeGoods]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null unique check ([Name] <> N'')
);
go
create table [Manufacturer]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null unique check ([Name] <> N'')
);
go
create table [JobPosition]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null unique check ([Name] <> N'')
);
go
create table [Goods]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null,
	[CountOfGoodsInStock]int,
	[Price] money not null,
	[CostPrice] money not null,
	[ManufacturerId]int not null,
	[TypeGoodsId]int not null
);
go 
create table [Seller]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null,
	[Surname]nvarchar(100) not null,
	[LastName]nvarchar(100) not null,
	[StartWorkDate] date not null,
	[Sex]nvarchar(100) not null,
	[Salary] money not null,
	[JobPositionId]int not null
);
go
create table [Client]
(
	[Id]int not null identity(1,1) primary key,
	[DateRegistration]date not null,
	[BirthDate]date not null,
	[Name]nvarchar(100) not null,
	[Surname]nvarchar(100) not null,
	[LastName]nvarchar(100) not null,
	[Email]nvarchar(100) not null,
	[Phone]nvarchar(100) not null,
	[Sex]nvarchar(100) not null,
	[Discount]int,
	[Subscribe]bit
);
go
create table [Sales]
(
	[Id]int not null identity(1,1) primary key,
	[GoodsId]int not null,
	[SellerId]int not null,
	[ClientId]int not null,
	[Count]int not null,
	[Date]date not null
);
go
create table [History]
(
	[Id]int not null identity(1,1) primary key,
	[GoodsId]int not null,
	[Date] date not null,
	[SellerId]int not null,
	[ClientId]int not null,
	[Count]int not null
);
go
create table [Archiv]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null,
	[Price] money not null,
	[CostPrice] money not null,
	[ManufacturerId]int not null,
	[TypeGoodsId]int not null
);
go
create table [LastGoods]
(
	[Id]int not null identity(1,1) primary key,
	[Name]nvarchar(100) not null,
	[CostPrice] money not null,
	[ManufacturerId]int not null,
	[TypeGoodsId]int not null
);
go

alter table [Goods]
add foreign key ([ManufacturerId]) references [Manufacturer]([Id])
on update cascade
on delete cascade
go

alter table [Goods]
add foreign key ([TypeGoodsId]) references [TypeGoods]([Id])
on update cascade
on delete cascade
go

alter table [Seller]
add foreign key ([JobPositionId]) references [JobPosition]([Id])
on update cascade
on delete cascade
go

alter table [Sales]
add foreign key ([GoodsId]) references [Goods]([Id])
on update cascade
on delete cascade
go

alter table [Sales]
add foreign key ([SellerId]) references [Seller]([Id])
on update cascade
on delete cascade
go

alter table [Sales]
add foreign key ([ClientId]) references [Client]([Id])
on update cascade
on delete cascade
go

alter table [History]
add foreign key ([GoodsId]) references [Goods]([Id])
on update cascade
on delete cascade
go

alter table [History]
add foreign key ([SellerId]) references [Seller]([Id])
on update cascade
on delete cascade
go

alter table [History]
add foreign key ([ClientId]) references [Client]([Id])
on update cascade
on delete cascade
go

alter table [Archiv]
add foreign key ([ManufacturerId]) references [Manufacturer]([Id])
on update cascade
on delete cascade
go

alter table [Archiv]
add foreign key ([TypeGoodsId]) references [TypeGoods]([Id])
on update cascade
on delete cascade
go

alter table [LastGoods]
add foreign key ([ManufacturerId]) references [Manufacturer]([Id])
on update cascade
on delete cascade
go

alter table [LastGoods]
add foreign key ([TypeGoodsId]) references [TypeGoods]([Id])
on update cascade
on delete cascade


