SELECT productname, unitprice, unitsinstock, unitsinstock*unitprice as totalvalue
from "alanparadise/nw"."products"
WHERE unitsinstock*unitprice > 1000;

SELECT productname, unitprice, unitsinstock, unitsinstock*unitprice as totalvalue
from "alanparadise/nw"."products";


SELECT productid, productname, quantityperunit
from "alanparadise/nw"."products";

SELECT productid, productname, unitprice,"categoryid"
FROM "alanparadise/nw"."products"
WHERE "categoryid" <= 9;

SELECT orderid,  customerid,shippeddate
FROM "alanparadise/nw"."orders"
WHERE shipcountry = 'Canada' and shippeddate between '1996-12' and '1997-02';

SELECT productname, unitprice, unitsinstock, unitsinstock*unitprice as totalvalue
from "alanparadise/nw"."products"
WHERE unitsinstock*unitprice > 1000;


select employeeid, firstname ||' '|| lastname as employee, age(hiredate, birthdate)::text  
    from "alanparadise/nw"."employees";

select employeeid, firstname ||' '|| lastname as employee, 
        age(hiredate, birthdate)::text  
    from "alanparadise/nw"."employees";

SELECT EmployeeID, Lastname, Firstname, date_part('year', hiredate)
    FROM "alanparadise/nw"."employees";


SELECT EmployeeID, Lastname, Firstname, extract(year from hiredate)
    FROM "alanparadise/nw"."employees";

select employeeid, firstname ||' '|| lastname as employee, 
       age(current_date, birthdate)::text
    from "alanparadise/nw"."employees";


 select customerid, companyname, country
        from "alanparadise/nw"."customers"
    where region is NULL;







