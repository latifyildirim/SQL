# The Structured Query Language (SQL) 
<hr>
<hr>

### Index

* [Kurulum](#kurulum)
* [Yapılandırma](#yapılandırma)


<hr>

## Kurulum


##### Bu komutla Sema olusturuz
```
$ CREATE SCHEMA "alanparadise/nw";
```
##### Tabloyu siler:
```
$ DROP TABLE IF EXISTS "alanparadise/nw"."items";
```
##### Tablo Yaratiriz:
```
$ CREATE TABLE "alanparadise/nw"."items"
        (
        itemID    INT         NOT NULL ,
        itemcode  VARCHAR(5)  NULL,
        itemname  VARCHAR(40) NOT NULL DEFAULT ' ',
        quantity  INT         NOT NULL DEFAULT 0,
        price     REAL        NOT NULL DEFAULT 0
        );
```
#####
```
```
#####
```
```
## SQL VIEWS

##### Base Query
```
CREATE VIEW "alanparadise/nw"."TopEmployeesOrders" AS
   SELECT LastName, Firstname, sum(unitprice * quantity) as "Total Sales"
       from "alanparadise/nw"."employees" E JOIN
         "alanparadise/nw"."orders" O ON E.employeeid = O.employeeid JOIN
                "alanparadise/nw"."orderdetails" D ON O.orderid = D.orderid
   GROUP BY LastName, FirstName
Order By 3 desc LIMIT 5;
```
##### Let’s drop and recreate your view from Lab 11, adding a CASE expression.
```
DROP VIEW "alanparadise/nw"."TopCustomers";

CREATE VIEW "alanparadise/nw"."TopCustomers" as 
SELECT contactname, sum(D.unitprice * D.quantity) as "Total Sales",
  CASE
        WHEN sum(D.unitprice * D.quantity) < 60000 THEN 'fakir'
        WHEN sum(D.unitprice * D.quantity) < 110000 THEN 'orta'
        ELSE 'zengin'
  END para
  FROM "alanparadise/nw"."customers" C JOIN
         "alanparadise/nw"."orders" O ON C.customerid  =  O.customerid JOIN 
          "alanparadise/nw"."orderdetails" D ON O.orderid  =  D.orderid
GROUP BY contactname 
Order By 2 desc LIMIT 5;
```
##### Let's create a table that uses an id (array) as the unique identifier for each row we add.
```
CREATE TABLE "alanparadise/nw"."shoppers" 
(
        ShopperID int NOT NULL GENERATED ALWAYS AS IDENTITY,
        ShopperName varchar(40) NOT NULL ,
        Phone varchar(20) NOT NULL DEFAULT '0'
);
```
##### Let's insert a new row into the shoppers table. 
```
INSERT INTO "alanparadise/nw"."shoppers" (shoppername, phone)
        VALUES ('LATIF', '800-221')
```
## Part One: Query Problems Using the “alanparadise/cm” repo
##### 1. List  the names of the cities in alphabetical order where Classic Models has offices. (7)
```
SELECT  of.city, p.productline
    FROM "alanparadise/cm"."offices" of JOIN
        "alanparadise/cm"."employees" e ON of."officecode" = e."officecode" JOIN
        "alanparadise/cm"."Customers" c ON e."employeenumber" = c."salesrepemployeenumber" JOIN
        "alanparadise/cm"."orders" o ON c."customernumber" = o."customernumber" JOIN
        "alanparadise/cm"."orderdetails" d ON o."ordernumber" = d."ordernumber" JOIN
        "alanparadise/cm"."products" p ON d."productcode" = p."productcode"
WHERE p.productline = 'Classic Cars'
GROUP BY 1,2
ORDER BY 1;
``` 
##### 2. List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
```
SELECT  EmployeeNumber, LastName, FirstName, Extension
    FROM "alanparadise/cm"."offices" of JOIN
        "alanparadise/cm"."employees" e ON of."officecode" = e."officecode" 
WHERE of.city = 'Paris'
ORDER BY 1;
```
##### 3. List the ProductCode, ProductName, ProductVendor, QuantityInStock and ProductLine for all products with a QuantityInStock between 200 and 1200. (11) 
```
SELECT  ProductCode, ProductName, ProductVendor, QuantityInStock, ProductLine
    FROM "alanparadise/cm"."products" 
WHERE QuantityInStock >200 and QuantityInStock < 1200
ORDER BY 1;
```
##### 4. (Use a SUBQUERY) List the ProductCode, ProductName, ProductVendor, BuyPrice and MSRP for the least expensive (lowest MSRP) product sold by ClassicModels. (“MSRP” is the Manufacturer’s Suggested Retail Price.)  (1)
```
SELECT  ProductCode, ProductName, ProductVendor, BuyPrice, MSRP
    FROM "alanparadise/cm"."products"
    WHERE "productline" = 'Classic Cars'
 ORDER BY msrp
 LIMIT 1;
```
##### 5. What is the ProductName and Profit of the product that has the highest profit (profit = MSRP minus BuyPrice). (1)
```
SELECT  ProductName, (MSRP-Buyprice) as "Profit"
    FROM "alanparadise/cm"."products" 
 ORDER BY (MSRP-Buyprice) DESC
 LIMIT 1;
```
##### 6. List the country and the number of customers from that country for all countries having just two  customers.  List the countries sorted in ascending alphabetical order. Title the column heading for the count of customers as “Customers”. (7)
```
SELECT  country, count(customernumber) as "Customers"
        FROM "alanparadise/cm"."Customers" 
GROUP BY country
HAVING count(customernumber) = 2
ORDER BY 1;
```
##### 7. List the ProductCode, ProductName, and number of orders for the products with exactly 25 orders.  Title the column heading for the count of orders as “OrderCount”.  (12)
```
SELECT p.ProductCode, p.ProductName, count(ordernumber) as "OrderCount"
        FROM "alanparadise/cm"."products" p JOIN
        "alanparadise/cm"."orderdetails" o On p."productcode" = p."productcode"
        WHERE "quantityordered" = 25
GROUP BY 1,2
ORDER BY 1;
```
##### 8. List the EmployeeNumber, Firstname + Lastname  (concatenated into one column in the answer set, separated by a blank and referred to as ‘name’) for all the employees reporting to Diane Murphy or Gerard Bondur. (8)
```
SELECT  EmployeeNumber, (Firstname || ' ' || Lastname) as name
FROM "alanparadise/cm"."employees" 
WHERE reportsto in (1002, 1102);
```
##### 9. List the EmployeeNumber, LastName, FirstName of the president of the company (the one employee with no boss.)  (1)
```
SELECT  EmployeeNumber, LastName, FirstName
FROM "alanparadise/cm"."employees" 
WHERE reportsto is NULL;
```
##### 10. List the ProductName for all products in the “Classic Cars” product line from the 1950’s.(6)
```
SELECT   ProductName
FROM "alanparadise/cm"."products" 
WHERE Productline = 'Classic Cars' and productname like '%195%'; 
```
##### 11. List the month name and the total number of orders for the month in 2004 in which ClassicModels customers placed the most orders. (1)
```
SELECT  to_char(o.ordernumber, 'month') as Month, count(o.ordernumber) as Total
    FROM "alanparadise/cm"."orders" o JOIN
        "alanparadise/cm"."orderdetails" d ON o."ordernumber" = d."ordernumber" JOIN
        "alanparadise/cm"."products" p ON d."productcode" = p."productcode"
WHERE p.productline = 'Classic Cars' and o.orderdate like "2004%"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
```
##### 12. List the firstname, lastname of employees who are Sales Reps who have no assigned customers.  (2)   
```
SELECT  firstname, lastname
    FROM "alanparadise/cm"."employees" e LEFT JOIN
        "alanparadise/cm"."Customers" c ON e."employeenumber" = c."salesrepemployeenumber"
WHERE  c."salesrepemployeenumber" is NULL
```
##### 13. List the customername of customers from Switzerland with no orders. (2)
```
SELECT  customername 
    FROM "alanparadise/cm"."Customers" c LEFT JOIN
        "alanparadise/cm"."orders" o ON c."customernumber" = o."customernumber"
WHERE  country = 'Switzerland' and o."customernumber" is NULL
```
##### 14. List the customername and total quantity of products ordered for customers who have ordered more than 1650 products across all their orders.  (8)
```
SELECT  c.customername, sum("quantityordered") as topala
    FROM "alanparadise/cm"."Customers" c JOIN
        "alanparadise/cm"."orders" o ON c."customernumber" = o."customernumber" JOIN
        "alanparadise/cm"."orderdetails" d ON o."ordernumber" = d."ordernumber" 
GROUP BY 1
HAVING sum("quantityordered") > 1650;
```
## Part Two: Query Problems Using your demo_repo
##### 1. Create a NEW table named “TopCustomers” with three columns: CustomerNumber (integer), ContactDate (DATE) and  OrderTotal (a real number.)  None of these columns can be NULL.
```
CREATE TABLE "latif/demo"."TopCustomers"
(
    CustomerNumber int NOT NULL,
    ContactDate    date NOT NULL,
    OrderTotal     real NOT NULL
)
```
##### 2. Populate the new table “TopCustomers” with the CustomerNumber, today’s date, and the total value of all their orders (PriceEach * quantityOrdered) for those customers whose order total value is greater than $140,000. (should insert 10 rows )  
```
INSERT INTO "latif/demo"."TopCustomers" 
(SELECT  c."customernumber", DATE(NOW()), sum(PriceEach * quantityOrdered)
    FROM "latif/demo"."customers" c JOIN 
         "latif/demo"."orders" o ON c."customernumber" = o."customernumber" JOIN
         "latif/demo"."orderdetails" d ON o."ordernumber" = d."ordernumber" 
GROUP BY 1
HAVING sum(PriceEach * quantityOrdered) > 140000
LIMIT 10);
```
##### 3. List the contents of the TopCustomers table in descending OrderTotal sequence. (10) 
```
SELECT  *
    FROM "latif/demo"."TopCustomers"
ORDER BY 3 DESC;
```
##### 4. Add a new column to the TopCustomers table called OrderCount (integer).
```
ALTER TABLE "latif/demo"."TopCustomers"
ADD COLUMN  "OrderCount" int  NULL
```
##### 5. Update the Top Customers table, setting the OrderCount to a random number between 1 and 10. Hint:  use (RANDOM() *10)
```
UPDATE "latif/demo"."TopCustomers" 
SET "OrderCount" = (RANDOM() *10)
```
##### 6. List the contents of the TopCustomers table in descending OrderCount sequence. (10 rows)
```
SELECT  *
    FROM "latif/demo"."TopCustomers"
ORDER BY 4 DESC
LIMIT 10;
```
##### 7. Drop the TopCustomers table. (no answer set)
```
DROP TABLE  "latif/demo"."TopCustomers"
```
