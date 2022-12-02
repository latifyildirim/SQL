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
#####
```
```
#####
```
```
#####
```
```







