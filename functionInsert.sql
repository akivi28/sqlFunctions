use SportShop2

INSERT INTO TypeGoods(Name)
VALUES ('Одежда'),
       ('Обувь'),
       ('Спортивное снаряжение'),
       ('Защитное снаряжение')

INSERT INTO Manufacturer(Name)
VALUES ('Nike'),
       ('Adidas'),
       ('Puma'),
       ('Under Armour'),
       ('Reebok'),
	   ('Спорт, солнце и штанга')

INSERT INTO JobPosition(Name)
VALUES ('Менеджер по продажам'),
       ('Продавец-консультант'),
       ('Администратор магазина')

INSERT INTO Goods(Name,CountOfGoodsInStock,Price,CostPrice,ManufacturerId,TypeGoodsId)
VALUES  ('Футболка',100,700,500,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Шотры',150,750,550,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Шотры',150,900,750,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Шотры',150,1200,900,(select id from Manufacturer where Name = 'Puma'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Футболка',50,800,600,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Одежда')),
		('Кроссовки',40,2000,1500,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Обувь')),
		('Кроссовки',20,3000,2000,(select id from Manufacturer where Name = 'Nike'),
								(select id from TypeGoods where Name = 'Обувь')),
		('Боксёрские перчатки',20,1700,1200,(select id from Manufacturer where Name = 'Puma'),
								(select id from TypeGoods where Name = 'Спортивное снаряжение')),
		('Гантели',10,1000,800,(select id from Manufacturer where Name = 'Under Armour'),
								(select id from TypeGoods where Name = 'Спортивное снаряжение')),
		('Наколенники',40,500,400,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = 'Защитное снаряжение')),
		('Шлем',50,900,700,(select id from Manufacturer where Name = 'Reebok'),
								(select id from TypeGoods where Name = 'Защитное снаряжение')),
		('Гантели',100,1000,600,(select id from Manufacturer where Name = 'Nike'),
							(select id from TypeGoods where Name = 'Спортивное снаряжение')),
		('Очки для плавания',50,900,700,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Защитное снаряжение')),
		('Шапочка для плавания',50,1000,700,(select id from Manufacturer where Name = 'Adidas'),
								(select id from TypeGoods where Name = 'Защитное снаряжение'))


INSERT INTO Seller(Name,Surname,LastName,Salary,Sex,StartWorkDate,JobPositionId)
VALUES  ('Александра','Кузнецова','Игоревна',10000,'женский','2020-06-12',
		(select id from JobPosition where Name = 'Продавец-консультант')),

		('Максим','Иванов','Сергеевич',10000,'мужской','2021-03-10',
		(select id from JobPosition where Name = 'Продавец-консультант')),

		('Екатерина','Петрова','Александровна',25000,'женский','2014-01-11',
		(select id from JobPosition where Name = 'Менеджер по продажам')),

		('Андрей','Смирнов','Владимирович',20000,'мужской','2013-08-08',
		(select id from JobPosition where Name = 'Администратор магазина'))

insert into Client(Name,Surname,LastName,Phone,Email,Sex,Discount,Subscribe,DateRegistration,BirthDate)
values('Александр','Сергеев','Иванович','289083827','alex@gmail.com','мужской',10,0,'2020-06-05','1978-08-12'),
		('Анастасия','Новикова','Дмитриевна','38076362562','anna231@gmail.com','женский',0,0,'2018-01-01','1978-09-15'),
		('Сергей','Петров','Семенович','398348503','gsdgs@gmail.com','мужской',5,1,'2019-08-05','2000-01-01'),
		('Ольга','Лебедева','Николаевна','3809576236','olgaL09@gmail.com','женский',30,1,'2021-01-05','1995-04-13'),
		('Игорь','Воробьёв','Андреевич','23423452','alfdghjex@gmail.com','мужской',0,0,'2021-02-02','1985-04-23'),
		('Николай','Романов','Сергеевич','5665464356','sdfgse@gmail.com','мужской',12,1,'2022-04-08','1983-07-13'),
		('Андрей','Сидоров','Петрович','76534553','srgsdfg@gmail.com','мужской',33,1,'2023-03-03','1990-04-19')

insert into Sales(ClientId,SellerId,GoodsId,Count,Date)
values((select id from Client where Name = 'Александр' and Surname = 'Сергеев'),
	   (select id from Seller where Name = 'Александра' and Surname = 'Кузнецова'),
	   (select id from Goods where Name = 'Футболка' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Nike')),10,'2023-01-05'),

	   ((select id from Client where Name = 'Александр' and Surname = 'Сергеев'),
	   (select id from Seller where Name = 'Александра' and Surname = 'Кузнецова'),
	   (select id from Goods where Name = 'Шотры' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Nike')),10,'2023-01-05'),

	   ((select id from Client where Name = 'Анастасия' and Surname = 'Новикова'),
	   (select id from Seller where Name = 'Александра' and Surname = 'Кузнецова'),
	   (select id from Goods where Name = 'Футболка' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Adidas')),5,'2023-01-05'),

	   ((select id from Client where Name = 'Сергей' and Surname = 'Петров'),
	   (select id from Seller where Name = 'Максим' and Surname = 'Иванов'),
	   (select id from Goods where Name = 'Кроссовки' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Adidas')),2,'2023-01-07'),

	   ((select id from Client where Name = 'Ольга' and Surname = 'Лебедева'),
	   (select id from Seller where Name = 'Максим' and Surname = 'Иванов'),
	   (select id from Goods where Name = 'Кроссовки' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Adidas')),1,'2023-01-07'),

	   ((select id from Client where Name = 'Николай' and Surname = 'Романов'),
	   (select id from Seller where Name = 'Екатерина' and Surname = 'Петрова'),
	   (select id from Goods where Name = 'Наколенники' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Reebok')),20,'2023-01-10'),

	   ((select id from Client where Name = 'Николай' and Surname = 'Романов'),
	   (select id from Seller where Name = 'Андрей' and Surname = 'Смирнов'),
	   (select id from Goods where Name = 'Шлем' and ManufacturerId = 
	   (select id from Manufacturer where Name = 'Reebok')),15,'2023-01-10')


