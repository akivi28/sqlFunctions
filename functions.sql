use SportShop2

--1

create function distinctClient()
returns int
as
begin
	return (select count(distinct ClientId)
			from Sales)
end

--2

create function avgPriceTypeOfGoods(@Type nvarchar(50))
returns money
as
begin
	return(select avg(Price)
		   from Goods
		   where TypeGoodsId = (select id from TypeGoods where Name = @Type))
end

--3

create function avgCostSalesByEachDate()
returns @result table(DateOfSale date,avgCostSales money)
as
begin
	insert @result
		select Sales.Date,round(avg(Goods.Price*Sales.Count),2)
		from Sales,Goods
		where Sales.GoodsId = Goods.Id
		group by Sales.Date
	return
end

--4

create function lastGoodsSold()
returns @result table(Name nvarchar(50),Price money,Count int,Manufacturer nvarchar(50))
as
begin
	declare @tmp table(Id int,GoodsId int,Count int,Date date)

	insert into @tmp
	select top 1 1 as 'Id', GoodsId,Count,Date
		from Sales,Goods,Manufacturer
		where Goods.ManufacturerId = Manufacturer.Id
		order by Date Desc

	insert into @result(Name,Price,Count,Manufacturer)
	values((select Name from Goods where Id = (select GoodsId from @tmp where Id = 1 )),
			(select Price from Goods where Id = (select GoodsId from @tmp where Id = 1 )),
			(select Count from @tmp where Id = 1),
			(select Name from Manufacturer where Id =
				(select ManufacturerId from Goods where Id = 
					(select GoodsId from @tmp where Id = 1))))
	return
end

--5

create function firstGoodsSold()
returns @result table(Name nvarchar(50),Price money,Count int,Manufacturer nvarchar(50))
as
begin
	declare @tmp table(Id int,GoodsId int,Count int,Date date)

	insert into @tmp
	select top 1 1 as 'Id', GoodsId,Count,Date
		from Sales,Goods,Manufacturer
		where Goods.ManufacturerId = Manufacturer.Id
		order by Date asc

	insert into @result(Name,Price,Count,Manufacturer)
	values((select Name from Goods where Id = (select GoodsId from @tmp where Id = 1 )),
			(select Price from Goods where Id = (select GoodsId from @tmp where Id = 1 )),
			(select Count from @tmp where Id = 1),
			(select Name from Manufacturer where Id =
				(select ManufacturerId from Goods where Id = 
					(select GoodsId from @tmp where Id = 1))))
	return
end

--6

create function infAboutTypeOfGoodFromManuf(@Type nvarchar(50),@Manufacturer nvarchar(50))
returns @result table(Name nvarchar(50),Price money,CostPrice money,TypeGoods nvarchar(50),Manufacturer nvarchar(50))
as
begin
	insert @result
		select Goods.Name,Goods.Price,Goods.CostPrice,TypeGoods.Name,Manufacturer.Name
		from Goods,TypeGoods,Manufacturer
		where TypeGoodsId = TypeGoods.Id and ManufacturerId = Manufacturer.Id
		and TypeGoodsId = (select id from TypeGoods where Name = @Type) 
		and ManufacturerId = (select id from Manufacturer where Name = @Manufacturer)
	return
end

--7

create function clientsWhoWillBe45InThisYear()
returns @result table(Name nvarchar(50),Surname nvarchar(50),LastName nvarchar(50),BirthDate date)
as
begin
	insert into @result
	select Name,Surname,LastName,BirthDate
	from Client
	where DATEDIFF(YEAR, BirthDate, GetDate()) = 45
	return
end
