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
#####
```
```
#####
```
```
#####
```
```
#####
```
```
#####
```
```







