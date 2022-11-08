/*bir tablodan bir alanı getirmek*/
SELECT Title FROM albums;
/*employee tablosundan adve syoad alanlarını getir */
SELECT LastName,FirstName FROM employees;
/*employees tablosundaki tüm verileri getir*/
SELECT * from employees;
/*tracks tablosundan name ve composer alanlarını getir*/
SELECT name,Composer 
FROM tracks;
/*tracks tablosundan name ve composer alanlarını tekrar etmeyecek şekilde getir*/
SELECT  DISTINCT Composer 
FROM tracks;
SELECT  DISTINCT Country,City 
FROM customers;
SELECT DISTINCT AlbumId,MediaTypeId FROM tracks;
/*tracks albumunde composer ı jimi hendrix olanları getir*/
SELECT * from tracks WHERE Composer ='Jimi Hendrix' limit 3;
/*toplam tutarı 10 $ dan fazla olan faturalardan 4 tanesini getir*/
SELECT * 
FROM invoices 
WHERE total>10;
/*toplam tutarı 10$dan fazla olan faturların bilgilerini getir. Toplam miktara göre azalan sırada getir*/
SELECT * FROM invoices WHERE total>10 ORDER by total DESC;
/*Ülkesi ABD olmayan faturaların bilgilerini getir. total e göre artan düzende sırala*/
SELECT * FROM invoices WHERE NOT BillingCountry='USA' ORDER by total;
/*fatura tarihi 2009 ile 2011 arasında olaları getir  */
SELECT * FROM invoices WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 00:00:00' ORDER by InvoiceDate DESC; 
/*aynı soru between yerine and ile*/
SELECT * FROM invoices WHERE InvoiceDate>='2009-01-01' AND InvoiceDate<='2011-12-31'; 
/*Belçika, Norveç, Kanada ve ABD'den sipariş veren müşterilerin adını ve soyadını getirin*/
SELECT Country,FirstName,LastName 
FROM customers
WHERE Country IN ('Belgium','Norway','Canada','USA') ORDER by Country; 
SELECT Country,FirstName,LastName 
FROM customers
WHERE Country ='Belgium' or Country ='Norway'or Country ='Canada' or Country ='USA' ORDER by Country;

/*aggrigation functions*/
/* tracks tablosunda kaç kayıt var */
SELECT count(*) from tracks;
/*null değerler dahil*/
SELECT count(Composer) as toplam_besteci_sayisi from tracks; 
/*null değerler dahil DEGİL*/
SELECT count(State) from customers where state NOTNULL;
SELECT count(Company) from customers;
SELECT count(*) as toplam_sayi,count(state) as toplam_state_sayisi from customers;
 
/**/
SELECT COUNT(*) FROM invoices;
/*mağazada kaç farklı besteci var*/
SELECT count(DISTINCT Composer) from tracks;
/*maksimum süreye sahip parça*/
SELECT max(Milliseconds)as en_uzun_parca from tracks;
/*maksimum süreye sahip parça*/
SELECT avg(Milliseconds) as parcaların_ort_suresi from tracks;
/*faturaların toplam tutarı*/
SELECT sum(total) as toplam_miktar, avg(total) as ortalama_fatura, min(total) as en_dusuk, max(total) as en_yuksek 
from invoices;

SELECT avg(Milliseconds) as parcaların_ort_suresi from tracks;
select * from tracks WHERE Milliseconds>393599.212103911;
/*asıl yol*/
SELECT count(*) from tracks 
WHERE Milliseconds>(SELECT avg(Milliseconds) as parcaların_ort_suresi from tracks);
/*her bestecinin toplam parca sayısı. name ve composer sütünlarını getir*/
SELECT Composer,count(*) as par_sayisi from tracks GROUP by Composer order by par_sayisi DESC; 