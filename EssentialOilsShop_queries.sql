
SELECT * FROM Products;
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Payment;


#get products hierarchy
SELECT e2.ProductName AS Category, e1.ProductName AS EssentialOilName, e1.ProductNameISCI AS ISCI
FROM essentialoilsshop.Products e1
INNER JOIN essentialoilsshop.Products e2 ON e1.Category = e2.ID;

#get orders, orders date and products, products quantities of one customer
SELECT o1.ID AS OrderId, o1.OrderDate, 
o2.ProductID, o2.ProductQuantity AS Quantity 
FROM essentialoilsshop.orders o1
INNER JOIN essentialoilsshop.OrderItems o2
ON o1.ID = o2.OrderID
WHERE o1.CustomerID IN 
(SELECT ID FROM essentialoilsshop.Customer WHERE CustomerName = "Julia Magnus");

#get orders and its products quantities ordering by biggest amount of products firstly
SELECT o1.ID AS OrderId, o1.OrderDate AS OrderDate, sUM(o2.ProductQuantity) AS Quantity 
FROM essentialoilsshop.orders o1
INNER JOIN essentialoilsshop.OrderItems o2
ON o1.ID=o2.OrderID
GROUP BY o1.ID, o1.OrderDate
ORDER BY Quantity DESC;


#function which get paymentamount
SELECT o.*, CalculatePayment(ID) AS PaymentAmount
FROM essentialoilsshop.Orders o;

#orders with the biggest payment amount
SELECT o.CustomerID, c.CustomerName, o.OrderDate, o.OrderStatus, o.DeliveryDate , CalculatePayment(o.ID) AS PaymentAmount
FROM essentialoilsshop.Orders o
INNER JOIN Customer AS c
ON c.ID = o.CustomerID
ORDER BY PAymentAmount DESC;

#get all orders which are not paid
SELECT o.CustomerID, c.CustomerName, o.OrderDate, o.OrderStatus, o.DeliveryDate , CalculatePayment(o.ID) AS PaymentAmount,
p.PaymentStatus
FROM essentialoilsshop.Orders o
INNER JOIN Customer AS c
ON c.ID = o.CustomerID
INNER JOIN Payment AS p
ON p.OrderID = o.ID
HAVING p.PaymentStatus = "Unpaid"
ORDER BY PAymentAmount DESC;

#find the most popular essentials oils
SELECT p.ProductName,  oi.ProductId, SUM(oi.ProductQuantity) AS AllQuantity
FROM orderitems AS oi
INNER JOIN products AS p
ON p.ID = oi.ProductId
GROUP BY oi.ProductID
HAVING AllQuantity >=5
ORDER BY AllQuantity DESC;


#add new customer and return new customer id, because customerId is auto increment
#CREATE Procedure AddNewCustomer(CName VARCHAR(50), CCountry VARCHAR(50), CAdress VARCHAR(255))
CALL AddNewCustomer("Ricardas Carre","Switzerland","Bellevenue 52, 8952 Ziurich", @CustomerID);
SELECT @CustomerID;


#add products into temporary table like a basket.
# AddProductCart(CustID INT, ProdID INT, ProdQuant INT)
CALL ModifyProductCart(3,8,0);
CALL ModifyProductCart(3,8,3);

CALL ModifyProductCart(@CustomerID,8,1);
CALL ModifyProductCart(@CustomerID,32,1);
CALL ModifyProductCart(@CustomerID,14,2);
CALL ModifyProductCart(@CustomerID,22,4);
CALL ModifyProductCart(@CustomerID,22,2);

SELECT @CustomerID;
SELECT * FROM Cart;


#create orderID for new customers cart 
#CREATE Procedure CreateOrder(IN CustID INT, OUT OrderID iNT)
CALL CreateOrder(3, @OrderID);
SELECT @OrderID as OrderID;

SELECT * FROM Orders;

CALL CreateOrder(@CustomerID, @OrderID);
SELECT @OrderID as OrderID;

#insert new ordered products into orderitems table for invoice 
#CREATE Procedure AddOrderItems(OrderID INT, CustID INT)
CALL AddOrderItems(@OrderID, 3);
SELECT * FROM cart;
SELECT * FROM OrderItems;

CALL AddOrderItems(@OrderID, @CustomerID);

SELECT * FROM essentialoilsshop.payment;

#update payment status
#CREATE Procedure ModifyPayment(OrdID INT, PaymStatus VARCHAR(50), PaymType VARCHAR(100))
CALL ModifyPayment(11, "Paid", "Card");


#create invoice for all orders
SELECT o.ID AS "Order ID", c.CustomerName AS "Customer Name", o.OrderDate AS "OrderDate",
	p.ProductName AS "Product Name", oi.ProductQuantity AS "Quantity of product",
	 CalculatePayment(o.ID) AS "Payment Amount", o.DeliveryDate AS "Delivery Date"
FROM orderitems AS oi
INNER JOIN orders AS o
	ON oi.OrderID = o.ID
INNER JOIN products AS p
	ON oi.ProductID = p.ID
INNER JOIN payment AS pp
		ON oi.OrderID = pp.ID
INNER JOIN customer AS C
	ON o.CustomerID = c.ID;
    
#this view returns only completed orders    
SELECT * FROM view_invoice
WHERE CustomerName = "Julia Magnus";    
 
#get all orders with orderdate, products quantity and payment amount for one customer
SELECT o1.ID AS OrderId, o1.OrderDate, SUM(o2.ProductQuantity) AS Quantity,  CalculatePayment(o1.ID) AS PaymentAmount
FROM essentialoilsshop.orders o1
INNER JOIN essentialoilsshop.OrderItems o2
ON o1.ID = o2.OrderID
WHERE o1.CustomerID IN 
(SELECT ID FROM essentialoilsshop.Customer WHERE CustomerName = "Julia Magnus")
GROUP BY o1.CustomerID, o1.OrderDate;

# easier way to get all orders with orderdate, products quantity and payment amount for one customer
SELECT * FROM view_invoice
WHERE CustomerName = "Julia Magnus";    






