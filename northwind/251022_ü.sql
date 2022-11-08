select productid, productname, unitprice, supplierid
    from "alanparadise/nw"."products"
    where supplierid in (2, 4, 6, 8);

select supplierid, companyname, region
    from "alanparadise/nw"."suppliers"
    where region in ('LA', 'MI', 'OR');

select ProductID, ProductName, UnitPrice
    from "alanparadise/nw"."products"
    where UnitPrice between 20 and 30;

select Lastname, Firstname
    from "alanparadise/nw"."employees"
    where Lastname between 'A' and 'M';

SELECT customerid, contactname, region, country
from "alanparadise/nw"."customers"
where country = 'Brazil';

--SELECT Customerid, contactname, region, country
--from "alanparadise/nw"."customers"
--where country NOT = 'Brazil';

SELECT customerid, contactname, region, country
from "alanparadise/nw"."customers"
where NOT country = 'Brazil';

SELECT Productname, SupplierID, CategoryID,
UnitPrice, UnitsInStock
from "alanparadise/nw"."products"
WHERE SupplierID = 1 AND (CategoryID = 2 OR
CategoryID = 3 AND UnitPrice > 20) OR
UnitsInStock < 12;
