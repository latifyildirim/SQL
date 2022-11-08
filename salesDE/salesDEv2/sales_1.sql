/*bir tablodan bir alan getirmek*/
SELECT Title FROM albums;
/* emploxe tablosoundan ad ve soyad alanlarini getir*/
SELECT LastName, FirstName FROM employees;
/*employes tablosundaki tüm elemanlari getir*/
SELECT * FROM employees;
/*tracks tablosundan name ve Composer verilerini cek*/
SELECT name,Composer 
FROM tracks;
/*albums tablosundaki tüm verileri getir*/
SELECT *
FROM albums;
/**/
SELECT DISTINCT name,Composer
FROM tracks;

SELECT DISTINCT City FROM customers;
SELECT DISTINCT AlbumId,MediaTypeId from tracks;

SELECT *
FROM  tracks WHERE Composer = "Jimi Hendrix" LIMIT 3;

SELECT *
FROM invoices
WHERE total>10
ORDER BY total DESC;

SELECT *
FROM invoices
WHERE NOT BillingCountry= "USA"
ORDER BY total DESC;

SELECT FirstName,LastName,Country
FROM customers
WHERE Country 
in ("Belgium", "Norway", "Canada", "USA");

SELECT FirstName,LastName,Country
FROM customers
WHERE Country ="Belgium" or Country = "Norway" or Country = "Canada" or Country = "USA";

 
SELECT name
FROM Tracks
WHERE Composer like "%D%";

SELECT count (name) as "sayi"
FROM tracks;

SELECT COUNT (Composer) as say_bakalim /*NULL degerler dahil degil*/
FROM tracks;

SELECT count (State) as "BOS yapmaaaa"
FROM customers;

SELECT count (*) as "BOS yapmaaaa"
FROM customers;

SELECT count ()"Toplam",count (state) as "BOS yapmaaaa"
FROM customers;

SELECT count (*) as "BOS yapmaaaa"
FROM invoices;

SELECT count (DISTINCT Composer) as "BOS yapmadann"
FROM tracks;

SELECT name, max(Milliseconds) as "BOS yapmadann"
FROM tracks;

SELECT name, avg(Milliseconds) as "Parca ortalama uzunlu"
FROM tracks;

SELECT name, avg(Milliseconds)
FROM tracks;

SELECT *
FROM tracks
WHERE Milliseconds >(SELECT avg(Milliseconds)FROM tracks)
LIMIT 5;

SELECT Composer, count(name) as parca_sayisi
FROM tracks
GROUP BY Composer;





