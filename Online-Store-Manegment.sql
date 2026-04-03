--------**CREATING DATABASE


create database OnlineStore10
go
use OnlineStore10

------**CREATING TABLES


create table Customers ( CustomerId int primary key identity (1,1),
 First_Name varchar (50) not null, Last_Name varchar (50) not null, 
 Email varchar (100) not null unique, Phone varchar (20),
 Registration_Date datetime default getdate())
--**Customers table 

create table Categories  ( CategoryId int primary key identity (1,1),
Category_Name varchar (50) not null unique, Descriptionn varchar (225))
--**Categoris table 


create table Suppliers ( SupplierId int primary key identity (1,1), 
SupplierName varchar (100) not null, ContactName varchar (50), Phone
varchar (20))
--**Suppliers table


create table Products (ProductID int primary key identity (1,1), ProductName 
varchar (100) not null, CategoryID int references Categories, SupplierId int references 
Suppliers, Price money not null, Stock int default 0)
--Products table,connected to categories table(categoryId as foreign key) and suppliers
--(supplierId as foreing key)


create table Orders (OrderId int primary key identity (1,1), CustomerId int references Customers,
OrderDate datetime default getdate (), OrderStatus varchar (50) check 
(OrderStatus IN ('Pending','Shipped','Delivered','Cancelled')))
--Orders table, connected to customers table(customerId as foreing key)


create table OrderDetails (OrderDetailID int primary key identity (1,1), OrderID int references Orders,
ProductID int references Products, Quantity int check (Quantity > 0), PriceAtOrder money not null)
--Order details table, connected to orders table(orderId as foreing key) and products table
--(productId as foreing key)


create table Payments ( PaymentID int primary key identity, OrderID int references Orders, PaymentDate	
datetime default getdate(), Amount money not null, PaymentMethod varchar (50) 
CHECK (PaymentMethod IN ('Credit Card','PayPal','Bank Transfer')))
--Payments table, connected to Orders table (orderId as foreing key)


create table Shipping ( ShippingID int primary key identity (1,1), OrderId int references Orders, 
ShippingDate date, ShippingAddress varchar (255) not null, TrackingNumber varchar (50))
--Shippings table, connected to Orders table(orderId as foreing key)


--------*ADDING DATA TO TABLES 


--------ADDING INFO TO CUSTOMERS TABLE 


insert into customers (First_Name, Last_Name, Email, Phone, Registration_Date)
values 

('Daniel', 'Levi', 'daniel.levi@example.com', 0501234567, 2024-01-15),
('Yael', 'Cohen', 'yael.cohen@example.com', 0527654321, 2024-02-10),
('Amir', 'Shalom', 'amir.shalom@example.com', 0549988776, 2024-03-05),
('Lior', 'Biton', 'lior.biton@example.com',	0531122334,	2024-01-28),
('Michal', 'Bar', 'michal.bar@example.com',	0545566778,	2024-02-15),
('Tomer', 'Azulay', 'tomer.azulay@example.com',	0504455667,	2024-03-01),
('Oren', 'Katz', 'oren.katz@example.com', 0523344556, 2024-01-12),
('Shira', 'Mor', 'shira.mor@example.com', 0535566778, 2024-02-25),
('Hila', 'Peretz', 'hila.peretz@example.com', 0546677889, 2024-03-10),
('Erez', 'Levi', 'erez.levi@example.com', 0507788990, 2024-03-18),
('Dana', 'Azulay',	'dana.azulay@example.com', 0541122334,	2024-01-10),
('Gil',	'Shaked', 'gil.shaked@example.com',	0525566778,	2024-02-20)


--------ADDING INFO TO CATEGORIES TABLE 


insert into Categories (category_name, descriptionn)
values 
('Electronics', 'Electric items'),
('Clothing', 'cloths and accessories'),
('Books', 'Books and Printing'),
('Home & Kitchen', 'Home and kitchen equipment'),
('Sports', 'Sports equipment'),
('Toys & Games', 'Toys and Games'),
('Beauty & Health',	'Beauty and health products'),
('Automotive',	'Automotive parts and accessories'),
('Garden & Outdoors', 'Garden and outdoor supplies'),
('Music & Instruments',	'Music and musical instruments'),
('Office Supplies',	'Office supplies and stationery'),
('Pet Supplies',	'Pet products and accessorie')



------ ADDING INFO TO TABLE SUUPPLIERS 


insert into suppliers (SupplierName, ContactName, Phone)
 values 
	('TechWorld Ltd', 'Ron Biton', '03-5551234'),
	('FashionHub',	'Dana Levi', '09-8884567'),
	('BookZone', 'Moshe Peretz', '02-3337890'),
	('HomePro',	'Rina Shani' , '04-7776655'),
	('SportMax', 'Gal Itzhak',	'08-9991122'),
	('ToyFactory',	'Sara Cohen', '03-6667788'),
	('HealthPlus',	'Maya Levi', '09-4445566'),
	('AutoParts Ltd', 'Avi Katz', '02-5556677'),
	('GardenGoods',	'Tomer Bar', '04-9993344'),
	('MusicWorld',	'Neta Mor',	'03-2224455'),
	('OfficeLine',	'Eli Sharon', '02-1112233'),
	('PetShop',	'Anat Peretz', '09-7778899')


----**ADDING INFO TO PRODUCTS TABLE 


INSERT INTO Products (ProductName, CategoryID, SupplierID, Price, Stock)
VALUES
('Gaming Laptop ASUS ROG',  1, 1, 7200.00, 8),
('Mechanical Keyboard Razer', 1, 2, 450.00, 30),
('Running Shoes Adidas', 2, 3, 349.90, 50),
('Leather Jacket', 2, 4, 899.90, 20),
('The Lord of the Rings Book', 3, 5, 79.90, 100),
('Espresso Machine DeLonghi', 4, 6, 1299.90, 15),
('Air Fryer Philips', 4, 7, 599.90, 25),
('Soccer Ball Nike', 5, 8, 249.90, 40),
('Yoga Mat Manduka', 5, 9, 199.90, 60),
('Smartwatch Apple', 1, 10, 1499.90, 25),
('Doll Barbie Dreamhouse', 6, 11, 399.90, 40),
('Puzzle 1000 Pieces',6, 12, 149.90, 80)



----**ADDING INFO TO ORDERS TABLE 



INSERT INTO Orders (CustomerId,OrderDate,OrderStatus) 
values
(1,	'2024-03-15',	'Pending'),
(2,	'2024-03-20',	'Shipped'),
(3,	'2024-03-22',	'Delivered'),
(5,	'2024-03-25',	'Pending'),
(7,	'2024-03-28',	'Shipped'),
(9,	'2024-04-01',	'Delivered'),
(4,	'2024-04-03',	'Cancelled'),
(8,	'2024-04-05',	'Pending'),
(11,	'2024-04-06',	'Shipped'),
(12, '2024-04-07',	'Pending'),
(6,	'2024-04-08',	'Delivered'),
(10, '2024-04-09',	'Shipped')


--ADDING INFO TO OrderDetails TABLE


insert into OrderDetails  (OrderID, ProductID, Quantity, PriceAtOrder)
values
(1,	1,	1,	'5200.00'),
(1,	2,	2,	'120.00'),
(2,	3,	3,	'89.90'),
(3,	5,	1,	'59.90'),
(3,	4,	1,	'299.90'),
(4,	6,	1,	'399.90'),
(5,	9,	2,	'349.90'),
(6,	8,	1,	'199.90'),
(7,	10,	1,	'999.90'),
(8,	11,	1,	'499.90'),
(9,	12,	2,	'159.90'),
(10, 7,	1, '249.90')


--**ADDING INFO TO PAYMENTS TABLE


INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod)
VALUES
(1, '2024-03-15', 5200.00, 'Credit Card'),
(2, '2024-03-16', 120.00, 'PayPal'),
(3, '2024-03-17', 89.90, 'Credit Card'),
(4, '2024-03-18', 299.90, 'Bank Transfer'),
(5, '2024-03-19', 59.90, 'PayPal'),
(6, '2024-03-20', 399.90, 'Credit Card'),
(7, '2024-03-21', 249.90, 'Bank Transfer'),
(8, '2024-03-22', 199.90, 'PayPal'),
(9, '2024-03-23', 349.90, 'Credit Card'),
(10, '2024-03-24', 999.90, 'Bank Transfer'),
(11, '2024-03-25', 499.90, 'Credit Card'),
(12, '2024-03-26', 159.90, 'PayPal')


--**ADDING INFO TO SHIPPINGS TABLE


INSERT INTO Shipping (OrderID, ShippingDate, ShippingAddress, TrackingNumber)
VALUES
(1, '2024-03-16', 'Herzl 15, Tel Aviv', 'TRK123456'),
(2, '2024-03-17', 'Weizmann 10, Haifa', 'TRK654321'),
(3, '2024-03-18', 'Ben Gurion 5, Jerusalem', 'TRK987654'),
(4, '2024-03-19', 'Arlozorov 22, Beersheba', 'TRK112233'),
(5, '2024-03-20', 'Rabin 8, Eilat', 'TRK445566'),
(6, '2024-03-21', 'Hahistadrut 77, Ashdod', 'TRK778899'),
(7, '2024-03-22', 'Allenby 10, Ramat Gan', 'TRK223344'),
(8, '2024-03-23', 'Dizengoff 100, Tel Aviv', 'TRK334455'),
(9, '2024-03-24', 'King George 5, Jerusalem', 'TRK445577'),
(10, '2024-03-25', 'Rothschild 25, Tel Aviv', 'TRK556688'),
(11, '2024-03-26', 'Balfour 12, Haifa', 'TRK667799'),
(12, '2024-03-27', 'Herzl 100, Beersheba', 'TRK778811')
