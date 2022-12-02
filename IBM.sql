--Tabloyu siler
DROP TABLE IF EXISTS "alanparadise/nw"."items";

CREATE TABLE "alanparadise/nw"."items"
(
itemID INT NOT NULL ,
itemcode VARCHAR(5) NULL,
itemname VARCHAR(40) NOT NULL DEFAULT ' ',
quantity INT NOT NULL DEFAULT 0,
price REAL NOT NULL DEFAULT 0
);

--Bu komutla Sema olusturup icine Tablolar ekleriz
CREATE SCHEMA "alanparadise/nw";

--Liste icini baska listeden bu sekilde doldurruz
INSERT INTO "alanparadise/nw"."items"
    (SELECT productid, concat(supplierid, categoryid, discontinued),
        productname, unitsinstock, unitprice
  from "alanparadise/nw"."products");

ALTER TABLE "alanparadise/nw"."items"
RENAME TO "alters"

ALTER TABLE "alanparadise/nw"."alters"
RENAME COLUMN "itemcode" TO "itemref"; 

ALTER TABLE "alanparadise/nw"."alters"
ADD COLUMN "itemcode" VARCHAR(5) NULL; 

UPDATE "alanparadise/nw"."alters"
SET "itemcode" = "itemref";

ALTER TABLE "alanparadise/nw"."alters"
ALTER COLUMN "itemcode" SET DATA TYPE char(4); 

SELECT itemid, itemname, itemcode FROM "alanparadise/nw"."alters";

--####   Lab 9: Modifying Tables and Columns with ALTER  #######

--4. Change the name of the ‘items’ table to ‘demo’

ALTER TABLE "alanparadise/nw"."items"
    RENAME TO "demo"

--5. Change the name of the ‘itemcode’ column to ‘itemclass’ 

ALTER TABLE "alanparadise/nw"."demo"
    RENAME COLUMN "itemcode" TO "itemclass"

--6. Add a new column ‘iteminfo’ to your ‘demo’ table 

ALTER TABLE "alanparadise/nw"."demo"
    ADD COLUMN "iteminfo" VARCHAR(5) NULL;

--7. Add some data to your new column, copying the values from the   itemclass column

UPDATE "alanparadise/nw"."demo"
    SET  "iteminfo" = "itemclass";

--Take another look at your ALTERed table

Select * from"your_bit.io_account/demo_repo"."demo"

--Add a new row to the employees table

INSERT INTO "alanparadise/nw"."employees"
(employeeid, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate,
Address, City, Region, PostalCode, Country, HomePhone, Extension)
VALUES 
(10,'Dunn','Nat','Sales Representative', 'Mr.', '1970-02-19', '2014-01-15', 
'4933 Jamesville Rd.','Jamesville','NY', '13078','USA',
'315-555-5555','130');

INSERT INTO "alanparadise/nw"."employees"
VALUES 
('20','Thomas','Tammy','Data Scientist','Ms.','1990-08-27',
'2017-06-18', '5012 Arapahoe St.','Boulder','CO', '80304','USA');

INSERT INTO "alanparadise/nw"."employees"
VALUES 
('21','Thomas','Tommy','Data Analyst', 'Mr.','1991-09-28', '2017-06-18',
'5014 Arapahoe St.','Boulder','CO', '80304','USA',NULL,NULL,NULL,NULL,NULL);

--Update --- VERI DEGISIKLIGI

UPDATE "alanparadise/nw"."employees"
    SET "firstname"='Timmy',
        "titleofcourtesy" ='Mr'
    WHERE employeeid = 20

--DROP     (Satirlari ve yapiyi komple kaldirir)
--DELETE   (WHERE komutu ile )
DELETE FROM "alanparadise/nw"."employees"
WHERE employeeid in (10, 20, 21)  
--TRUNCATE (siler ama yapiyi korur)

TRUNCATE FROM "alanparadise/nw"."employees"
WHERE employeeid in (10, 20, 21) # bu calismiyor(sadece delete de)

--Fill it with data using a subquery (Dosya icini dolduruyoruz)

INSERT INTO "alanparadise/nw"."items" 
(SELECT productid, concat(supplierid, categoryid, discontinued),
productname, unitsinstock, unitprice 
from "alanparadise/nw"."products")


 
--A table-level foreign key constraint can indicate how to handle the situation 
--when the foreign key in the PARENT table is deleted or updated. 

-- CONSTRAINT fk_supplier FOREIGN KEY(supplierid) 
--              REFERENCES supplier(supplierid)
--          ON UPDATE <update action>
--          ON DELETE <delete action>

-- ACTION may be: 
--  CASCADE     The change to the parent is cascaded to all affected child rows
--  NO ACTION   ÜST tablodan bisey almaz
--  SET NULL    ALT elemani NULL olarak birakir
--  SET DEFAULT Oldugu gibi üst tablonun ayarlarini uygular
--  RESTRICT    Ana ögeden etkilenmesine müsade etmez



--4. Insert a new row of data into your "demo" table (INSERT format 1)

INSERT INTO "alanparadise/nw"."demo" 
        (itemid, itemclass, itemname, quantity, price, iteminfo)
VALUES (90,123,'Kalemtras',31,5,3128)

--5. Insert a new row of data into your "demo" table (INSERT format 2)

INSERT INTO "alanparadise/nw"."demo" 
VALUES (91,33,'Aras',28,51,28)

--6. Update some data

UPDATE "alanparadise/nw"."demo" 
    SET "itemname" = 'KABA_KOMA',
    "quantity" = 12
    WHERE itemid = 90

--7. Take another look at your updated table

Select * from "your_bit.io_account/demo_repo"."demo"

INSERT INTO "alanparadise/nw"."demo"
(SELECT reorderlevel, concat(supplierid, categoryid, discontinued),
productname, unitsinstock, unitprice 
from "alanparadise/nw"."products"
WHERE productid<10) 

--8. Delete the rows you just added

DELETE FROM "alanparadise/nw"."demo"
WHERE itemid in(0,10,25,90,91)

--9. Drop the “demo” table

TRUNCATE "alanparadise/nw"."demo"  (taslak kaldi)

DROP TABLE "your_bit.io_account/demo_repo"."demo";
DROP TABLE IF EXISTS "alanparadise/nw"."demo"  (Sablonu da kaldirdik)