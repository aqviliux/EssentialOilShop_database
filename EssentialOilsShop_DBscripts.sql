DROP database IF EXISTS EssentialOilsShop;
CREATE DATABASE EssentialOilsShop;
USE EssentialOilsShop;
CREATE TABLE Products(ID INT NOT NULL AUTO_INCREMENT, ProductName varchar(50), ProductNameISCI varchar(255), Category INT,
	Type varchar(50), OriginalCountry varchar(50), ExpirationDate DATE, Quantity integer unsigned, Price FLOAT, CONSTRAINT PK_Products PRIMARY KEY (ID));
CREATE TABLE Customer(ID INT NOT NULL AUTO_INCREMENT, CustomerName varchar(100), CustomerCountry varchar(100), CustomerAdress varchar(255), CONSTRAINT PK_CustomerID PRIMARY KEY (ID));
CREATE TABLE Orders(ID INT NOT NULL AUTO_INCREMENT, CustomerID INT NOT NULL, OrderDate DATE, OrderStatus varchar(100), DeliveryDate DATE, CONSTRAINT PK_OrderID PRIMARY KEY (ID));
CREATE TABLE Cart(CustomerID INT NOT NULL, ProductID INT NOT NULL, ProductQuantity INT, ProductPrice FLOAT);
CREATE TABLE OrderItems(OrderID int NOT NULL, ProductID Int, ProductQuantity INT,  OrderStatus VARCHAR(50));
CREATE TABLE Payment(ID INT NOT NULL AUTO_INCREMENT, OrderID INT NOT NULL, PaymentStatus VARCHAR(50), PaymentType VARCHAR(100), Date DATE, CONSTRAINT PK_PaymentID PRIMARY KEY (ID));


INSERT INTO EssentialOilsShop.Products(ProductName, ProductNameISCI, Category, Type, OriginalCountry, ExpirationDate, Quantity, Price)
VALUES
("flowery", NULL, NULL, "EssentialOil", NULL, NULL, NULL, NULL),
("fruity", NULL, NULL, "EssentialOil", NULL, NULL, NULL, NULL),
("wooden", NULL, NULL, "EssentialOil", NULL, NULL, NULL, NULL),
("rare and precious", NULL, NULL, "EssentialOil", NULL, NULL, NULL, NULL),
("German Chamomile", "Matricaria recutita", 1, "EssentialOil",  "India", "2023-12-01", 100, 8.50),
("Roman Chamomile", "Chamaemelum nobile", 1, "EssentialOil",  "France", "2024-12-01", 50, 10.50),
("Bourbon Geranium", "Pelargonium graveolens var. Bourbon", 1, "EssentialOil",  "Madagascar", "2022-12-01", 75,7.60),
("Lavender", "Lavandula latifolia", 1, "EssentialOil",  "Spain", "2024-06-01", 150, 4.50),
("Lavender Provence", "Lavandula angustifolia", 1,  "EssentialOil", "France (Provence)", "2023-12-01", 200, 4.20),
( "Palmarosa", "Cymbopogon martinii", 1,  "EssentialOil", "India", "2025-01-01", 60, 7.20),
("Patchouli", "Pogostemon cablin", 1, "EssentialOil",  "Sri Lanka", "2024-12-01", 160, 5.20),
("Ylang-Ylang", "Cananga odorata totum", 1, "EssentialOil",  "Madagascar", "2025-06-01", 135, 8.60),
("Anise", "Pimpinella anisum", 2, "Spain", "EssentialOil",  "2024-12-01", 160, 10.20),
("Calabrian Bergamot", "Citrus bergamia", 2, "EssentialOil",  "Italy (Calabria)", "2024-12-01", 130, 7.30),                                                                                                                                         
("Sicilian Lemon", "Citrus limonum", 2, "EssentialOil",  "Italy (Sicily)", "2023-12-01", 90, 5.40),
("Lime", "Citrus aurantifolium", 2, "EssentialOil",  "Mexico", "2024-12-01", 78, 5.00),
( "Mandarin", "Citrus reticulata blanco", 2, "EssentialOil",  "Spain", "2024-12-01", 75, 4.20),
( "Sweet Orange", "Citrus sinensis var. pera", 2, "EssentialOil",  "Brazil", "2024-12-01", 69, 4.00),
( "Grapefruit", "Citrus paradisi", 2, "EssentialOil",  "Italy", "2024-12-01", 85, 5.20),
("Petitgrain Bigarade", "Citrus aurantium var. amara", 2, "EssentialOil", "Paraguay", "2024-12-01", 87, 3.20),
( "Corsican Pomelo", "Citrus x paradisi", 2, "EssentialOil",  "France (Corsica)", "2024-12-01", 75, 5.20),
( "Amyris", "Amyris balsamifera", 3, "EssentialOil",  "Haiti", "2023-10-01", 40, 9.50),
("Gaiac Wood", "Bulnesia sarmienti ", 3, "EssentialOil",  "Paraguay", "2024-12-01", 100, 9.20),
( "Rosewood", "Aniba rosaeodora", 3, "EssentialOil", "Brazil", "2024-12-01", 20, 10.50),
("Atlas Cedar", "Cedrus atlantica", 3, "EssentialOil",  "Morocco", "2024-12-01", 80, 10.50),
( "Evergreen Cypress", "Cupressus sempervirens", 3, "EssentialOil",  "Spain", "2023-12-01", 90, 7.20),
( "Kunzea", "Kunzea ambigua", 3, "EssentialOil",  "Australia", "2023-12-01", 40, 5.20),
( "Sandalwood Alba", "Santalum album", 3, "EssentialOil",  "Indonesia", "2024-10-01", 10, 10.40),
("Siberian Fir", "Abies sibirica", 3,  "EssentialOil", "Russia", "2022-10-01", 100, 5.20),                                       
( "Frankincense", "Boswellia carterii", 4,  "EssentialOil", "Somalia", "2023-10-01", 40, 6.20),
( "Yarrow", "Achillea millefolium", 4, "EssentialOil",  "Bulgaria", "2022-10-01", 50, 12.50),
( "Elemi", "Canarium luzonicum", 4, "EssentialOil",  "Philippines", "2023-10-01", 20, 10.50),
( "Fragrant Inule", "Inula graveolens", 4, "EssentialOil",  "Morocco", "2023-10-01", 46, 12.50),
( "Pistachio Lentisk", "Pistacia lentiscus", 4,  "EssentialOil", "Morocco", "2023-10-01", 50, 14.50);
#34

INSERT INTO Customer(CustomerName, CustomerCountry, CustomerAdress)
VALUES 
( "Tom Johson", "France", "Rue de l'Eglise 42-51, 4320 Paris"),
( "Maria Anderson", "France", "Rue de la Fontaine 12, 4587 Lyon "),
( "Alexis Star", "Switzerland", "Aarbergergasse 85, 8692 Bern"),
( "Julia Magnus", "Switzerland", "Langstrasse 25, 8796 Zurich"),
( "Melvin Senker", "Germany", "Chausseestrasse 45-14, 78956 Berlin");

INSERT INTO Orders(CustomerID, OrderDate, OrderStatus, DeliveryDate)
VALUES
(1, "2021-10-10", "Delivered", "2021-10-20"),
(1, "2021-11-10", "Delivered", "2021-11-20"),
(2, "2021-11-11", "Delivered", "2021-11-21"),
(3, "2021-11-15", "Delivered", "2021-11-25"),
(4, "2021-11-15", "Delivered", "2021-11-30"),
(4, "2021-11-18", "Delivered", "2021-11-25"),
(1, "2021-11-20", "Delivered", "2021-11-25"),
(4, "2021-12-01", "Accepted", NULL),
(3, "2021-12-02", "Accepted", NULL),
(4, "2021-12-03", "Accepted", NULL);
#7 + 3

INSERT INTO OrderItems(OrderID, ProductID, ProductQuantity,  OrderStatus)
VALUES 
(1, 5, 1, "Delivered"),
(1, 14, 2, "Delivered"),
(1, 10, 3, "Delivered"),
(1, 11, 1, "Delivered"),
(1, 8, 1, "Delivered"),
(1, 9, 1, "Delivered"),
(1, 22, 2, "Delivered"),
(1, 5, 2, "Delivered"),
(2, 13, 3, "Delivered"),
(2, 18, 1, "Delivered"),
(2, 17, 1, "Delivered"),
(2, 32, 1, "Delivered"),
(2, 30, 2, "Delivered"),
(2, 27, 1, "Delivered"),
(3, 11, 2, "Delivered"),
(3, 18, 2, "Delivered"),
(3, 23, 1, "Delivered"),
(3, 31, 2, "Delivered"),
(3, 30, 2, "Delivered"),
(3, 27, 3, "Delivered"),
(3, 18, 1, "Delivered"),
(3, 14, 1, "Delivered"),
(3, 7, 3, "Delivered"),
(3, 8, 2, "Delivered"),
(4, 23, 2, "Delivered"),
(4, 24, 1, "Delivered"),
(4, 11, 1, "Delivered"),
(4, 15, 4, "Delivered"),
(4, 12, 2, "Delivered"),
(4, 7, 1, "Delivered"),
(5, 21, 1, "Delivered"),
(5, 7, 1, "Delivered"),
(5, 13, 1, "Delivered"),
(5, 11, 1, "Delivered"),
(5, 22, 3, "Delivered"),
(5, 33, 1, "Delivered"),
(6, 31, 3, "Delivered"),
(6, 30, 3, "Delivered"),
(7, 31, 2, "Delivered"),
(7, 28, 1, "Delivered"),
(7, 6, 3, "Delivered"),
(7, 11, 1, "Delivered"),
(8, 11, 1, "Accepted"),
(8, 26, 1, "Accepted"),
(8, 25, 1, "Accepted"),
(8, 6, 1, "Accepted"),
(8, 8, 1, "Accepted"),
(8, 15, 1, "Accepted"),
(8, 9, 1, "Accepted"),
(9, 11, 1, "Accepted"),
(9, 25, 1, "Accepted"),
(9, 26, 1, "Accepted"),
(9, 22, 1, "Accepted"),
(9, 17, 1, "Accepted"),
(9, 13, 1, "Accepted"),
(9, 32, 1, "Accepted"),
(9, 33, 1, "Accepted"),
(10, 33, 1, "Accepted"),
(10, 13, 3, "Accepted"),
(10, 14, 1, "Accepted"),
(10, 8, 1, "Accepted");

INSERT INTO Payment(OrderID, PaymentStatus, PaymentType, Date)
VALUES
(1, "Paid", "Card", "2021-10-10"),
(2, "Paid", "Card", "2021-11-10"),
(3, "Paid", "PayPal", "2021-11-12"),
(4, "Paid", "Card", "2021-11-15"),
(5, "Paid", "Card", "2021-11-15"),
(6, "Paid", "Paypal", "2021-11-19"),
(7, "Paid", "Card", "2021-11-20"),
(8, "Unpaid", "Card", NULL),
(9, "Unpaid", "Paypal", NULL),
(10, "Unpaid", "Card", NULL);


ALTER TABLE Orders 
ADD  CONSTRAINT 
FK_orders_customer 
FOREIGN KEY(CustomerID)
REFERENCES customer (ID);

ALTER TABLE OrderItems 
ADD  CONSTRAINT 
FK_orders 
FOREIGN KEY(OrderID)
REFERENCES Orders (ID);

ALTER TABLE OrderItems 
ADD  CONSTRAINT 
FK_product 
FOREIGN KEY(ProductID)
REFERENCES Products (ID);

ALTER TABLE Payment 
ADD  CONSTRAINT 
FK_payment_order 
FOREIGN KEY(OrderID)
REFERENCES Orders (ID);

ALTER TABLE Cart 
ADD  CONSTRAINT 
FK_cart_customer 
FOREIGN KEY(CustomerID)
REFERENCES Customer (ID);

#added new column
ALTER TABLE essentialoilsshop.orderitems
ADD COLUMN ProductPrice FLOAT AFTER ProductQuantity;

UPDATE orderitems
SET ProductPrice = (
SELECT p.Price 
FROM Products p
WHERE p.ID = orderItems.ProductID);


#add unique field for Cart table, need to update product quantity
ALTER TABLE essentialoilsshop.cart
ADD CONSTRAINT UK_cutomerId_ProductID UNIQUE (CustomerID, ProductID);


#calculate payment amount of order
DROP FUNCTION IF EXISTS CalculatePayment;
DELIMITER //
CREATE FUNCTION CalculatePayment(id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE pay_amount DECIMAL(10,2);
		SELECT SUM((o2.ProductPrice * o2.ProductQuantity)) INTO pay_amount
		FROM essentialoilsshop.OrderItems o2
		WHERE o2.OrderID = id
		GROUP BY o2.OrderID; 
    RETURN(pay_amount);
END//
DELIMITER ;

#procedure which add new customer and returns customerID
DROP Procedure IF EXISTS AddNewCustomer;
DELIMITER //
CREATE Procedure AddNewCustomer(IN CName VARCHAR(50), CCountry VARCHAR(50), CAdress VARCHAR(255), OUT CustID INT)
BEGIN
	INSERT INTO essentialoilsshop.Customer(CustomerName, CustomerCountry, CustomerAdress)
    VALUES
    (CName, CCountry, CAdress);
    
    SELECT ID
    INTO CustID
    FROM essentialoilsshop.Customer
    WHERE CustomerName = CName AND CustomerCountry = CCountry AND CustomerAdress = CAdress;
END//
DELIMITER ;

#add new products in cart table for one customer - it is like temporary table to collect all products for one customer
DROP Procedure IF EXISTS ModifyProductCart;
DELIMITER //
CREATE Procedure ModifyProductCart(CustID INT, ProdID INT, ProdQuant INT)
BEGIN
	INSERT INTO essentialoilsshop.Cart(CustomerID, ProductID, ProductQuantity, ProductPrice)
    SELECT CustID, ProdID, ProdQuant, p.Price
    FROM Products p WHERE p.ID = ProdID
    ON DUPLICATE KEY UPDATE
    ProductQuantity = ProdQuant;
END//
DELIMITER ;

#create new order from temporary table Cart when the picking of the products is finished and also create new payment id
DROP Procedure IF EXISTS CreateOrder;
DELIMITER //
CREATE Procedure CreateOrder(IN CustID INT, OUT OrdID iNT)
BEGIN
	INSERT INTO essentialoilsshop.Orders(CustomerID, OrderDate, OrderStatus, DeliveryDate)
		SELECT DISTINCT CustID, CURDATE(), "Accepted", NULL
		FROM Cart 
		WHERE CustomerID = CustID;
    SELECT MAX(ID) 
		INTO OrdID
		FROM Orders WHERE CustomerID = CustID;
    INSERT INTO essentialoilsshop.payment(OrderID, PaymentStatus, PaymentType, Date)    
		SELECT MAX(ID) AS OrderID, "Unpaid", "Card", NULL
		FROM Orders WHERE CustomerID = CustID;
END//
DELIMITER ;

#add all order information with products and quantities into OrderItem table, also, change Product quantities in Products table
DROP Procedure IF EXISTS AddOrderItems;
DELIMITER //
CREATE Procedure AddOrderItems(OrderID INT, CustID INT)
BEGIN
	INSERT INTO essentialoilsshop.OrderItems(OrderID, ProductID, ProductQuantity, ProductPrice,  OrderStatus)
		SELECT OrderID, ProductID, ProductQuantity, ProductPrice, "Accepted" AS OrderStatus
		FROM Cart 
		WHERE CustomerID = CustID;
	UPDATE  Products AS p
		INNER JOIN 
			(SELECT p.ID AS ID, (p.Quantity - c.ProductQuantity) AS NewQuantity
				FROM Products p 
				INNER JOIN Cart c 
				ON p.ID = c.ProductId) AS t
                ON t.ID = p.ID
		SET  p.Quantity = t.NewQuantity;
	DELETE FROM Cart
		WHERE  CustomerID = CustID;
END//
DELIMITER ;

#when payment received, the payment status is changed, also ordersStatus is changed in Orders and OrderItems tables
DROP PROCEDURE IF EXISTS ModifyPayment;
DELIMITER //
CREATE Procedure ModifyPayment(OrdID INT, PaymStatus VARCHAR(50), PaymType VARCHAR(100))
BEGIN
	UPDATE essentialoilsshop.payment
    SET PaymentStatus = PaymStatus,
		PaymentType = PaymType,
		Date = CURDATE()
    WHERE OrderID = OrdID;
    
	UPDATE essentialoilsshop.orders
    SET OrderStatus = PaymStatus
    WHERE ID = OrdID;
    
	UPDATE essentialoilsshop.orderitems
    SET OrderStatus = PaymStatus
    WHERE OrderID = OrdID;
END//
DELIMITER ;


# BEFORE Trigger - CustomerName should begin with capital letter.
DROP TRIGGER IF EXISTS newCustomer_Before_Insert;
 DELIMITER //
 CREATE TRIGGER newCustomer_Before_Insert
 BEFORE INSERT on customer
 FOR EACH ROW
 BEGIN
	 SET NEW.CustomerName =
	 CONCAT(
	 CONCAT(UPPER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', 1 ),1,1)),
	 LOWER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', 1 ) FROM 2))),
	 " ",
	 CONCAT(UPPER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', -1 ),1,1)),
	 LOWER(SUBSTRING(SUBSTRING_INDEX(NEW.CustomerName, ' ', -1 ) FROM 2)))
	 );
 END//
 DELIMITER ;
 
#create the view to generate invoice for all delivered orders and customers
DROP VIEW IF EXISTS view_invoice;
CREATE VIEW view_invoice AS
	SELECT o.ID AS "OrderID", c.CustomerName AS "CustomerName", o.OrderDate AS "OrderDate",
		 p.ProductName AS "ProductName", oi.ProductQuantity AS "QuantityProduct",
		 CalculatePayment(o.ID) AS "PaymentAmount", o.DeliveryDate AS "DeliveryDate"
	FROM orderitems AS oi
	INNER JOIN orders AS o
		ON oi.OrderID = o.ID
	INNER JOIN products AS p
		ON oi.ProductID = p.ID
	INNER JOIN payment AS pp
			ON oi.OrderID = pp.ID
	INNER JOIN customer AS C
		ON o.CustomerID = c.ID
	WHERE o.DeliveryDate IS NOT NULL;




