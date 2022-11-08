-- SQLite

SELECT count(*) as Toplam_Sayi
FROM Customers
WHERE Customers.City = "London";


SELECT count(*)  as Toplam_Sayi 
FROM Customers as c 
WHERE c.City = "London";


SELECT *
FROM Orders 
WHERE OrderDate> '2018-01-01' and OrderDate NOT NULL and ShippedDate;

SELECT *
FROM Orders 
WHERE OrderDate> '2018-01-01'  and ShippedDate NOT NULL;

SELECT count(*) as toplam, ShipRegion 
FROM Orders 
GROUP BY ShipRegion HAVING toplam>80;

SELECT ShipRegion, count(*) as toplam, ShipRegion 
FROM Orders 
WHERE ShipCity like 'M%'
GROUP BY ShipRegion;

SELECT count(ProductID) as x, ProductName
FROM Invoices 
WHERE ExtendedPrice> 1000
GROUP BY Region HAVING x>100 ;

SELECT *
FROM Invoices
Where ProductID = 51;

SELECT ProductID
FROM Invoices
Where ProductID = 51;

SELECT ProductName,CategoryName 
FROM Products 
JOIN Categories on  Products.CategoryID=Categories.CategoryID;

SELECT ProductName, UnitPrice*UnitsInStock
FROM Products 
WHERE ProductName ="Tofu";

SELECT sum(UnitPrice*UnitsInStock) as Depodaki_toplam_deger
FROM Products;










