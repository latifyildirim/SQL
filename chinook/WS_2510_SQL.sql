
-- /*1- WRITE A QUERY THAT RETURNS TRACK NAME AND ITS COMPOSER FROM 
-- TRACKS TABLE*/

SELECT Name, Composer
    FROM tracks;

-- /*2- WRITE A QUERY THAT RETURNS ALL COLUMNS FROM TRACKS TABLE*/

SELECT *
    FROM tracks;

-- /*3- WRITE A QUERY THAT RETURNS THE NAME OF COMPOSERS OF EACH 
-- TRACK*/

SELECT Composer as Name
    FROM tracks;

-- /*4- WRITE A QUERY THAT RETURNS UNIQUE ALBUMID, MEDIATYPEID FROM 
-- TRACKS TABLE*/

SELECT   DISTINCT AlbumId, MediaTypeId
    FROM tracks;

-- /*5- WRITE A QUERY THAT RETURNS TRACK NAME AND TRACKID OF ‘Jorge 
-- Ben’*/

SELECT   Name, TrackId
        FROM tracks
    WHERE Composer = 'Jorge Ben';

-- /*6- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH 
-- TOTAL AMOUNT IS GREATER THAN $25*/

SELECT *
    FROM invoices
  WHERE Total > 25;

-- /*7- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH 
-- TOTAL AMOUNT IS LESS THAN $15. JUST RETURN 5 ROWS*/

SELECT *
    FROM invoices
  WHERE Total < 15
  limit 5;

-- /*8- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH 
-- TOTAL AMOUNT IS GREATER THAN $10. THEN SORT THE TOTAL AMOUNTS 
-- IN DESCENDING ORDER, LASTLY DISPLAY TOP 2 ROWS*/

SELECT *
    FROM invoices
  WHERE Total > 10
  ORDER BY Total DESC
  limit 2;

-- /*9- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH 
-- BILLING COUNTRY IS NOT CANADA. THEN SORT THE TOTAL AMOUNTS IN 
-- ASCENDING ORDER, LASTLY DISPLAY TOP 10 ROWS*/

SELECT *
    FROM invoices
  WHERE NOT BillingCountry = 'Canada'
  ORDER BY Total
  LIMIT 10;

-- /*10- WRITE A QUERY THAT RETURNS INVOICEID, CUSTOMERID AND TOTAL 
-- DOLLAR AMOUNT FOR EACH INVOICE. THEN SORT THEM FIRST BY 
-- CUSTOMERID IN ASCENDING, THEN TOTAL DOLLAR AMOUNT IN 
-- DESCENDING ORDER.*/

SELECT InvoiceId, CustomerId,Total
    FROM invoices
  ORDER BY CustomerId ASC, Total DESC;

-- /*11- WRITE A QUERY THAT RETURNS ALL TRACK NAMES THAT START WITH ‘B’ 
-- AND END WITH ‘S’*/

SELECT Name
    FROM tracks
  WHERE Name like 'B%S';

-- /*12- WRITE A QUERY THAT RETURNS THE NEWEST DATE AMONG THE INVOICE 
-- DATES BETWEEN 2008 AND 2011*/

SELECT InvoiceDate
    FROM invoices
  WHERE InvoiceDate BETWEEN "2008-1-1" and "2011-1-1" ;

-- /*13- WRITE A QUERY THAT RETURNS THE FIRST AND LAST NAME OF THE 
-- CUSTOMERS WHO HAVE ORDERS FROM NORWAY AND BELGIUM*/

SELECT FirstName, LastName, Country
    FROM customers
  WHERE Country in ("Norway" , "Belgium") ;

-- /*14- WRITE A QUERY THAT RETURNS THE TRACK NAMES OF ‘ZAPPA’*/

SELECT Name,Composer
    FROM tracks
  WHERE Composer like '%Zappa';

-- /*15 HOW MANY TRACKS AND INVOICES ARE THERE IN THE DIGITAL MUSIC 
-- STORE, DISPLAY SEPERATELY*/

SELECT count(DISTINCT invoices.CustomerId) as Tracksss, count(DISTINCT tracks.Composer)
    FROM tracks
    JOIN invoice_items on tracks.TrackId = invoice_items.TrackId
    JOIN invoices on invoice_items.InvoiceId = invoices.InvoiceId;

-- /*16- HOW MANY COMPOSERS ARE THERE IN THE DIGITAL MUSIC STORE*/
SELECT count(DISTINCT Composer)
    FROM tracks ;
-- /*17- HOW MANY TRACKS DOES EACH ALBUM HAVE, DISPLAY ALBUMID AND 
-- NUMBER OF TRACKS SORTED FROM HIGHEST TO LOWEST*/

SELECT AlbumId, count(AlbumId) as sayi
    FROM tracks
    GROUP By AlbumId
    ORDER BY sayi DESC;

-- /*18- WRITE A QUERY THAT RETURNS TRACK NAME HAVING THE MINIMUM AND 
-- MAXIMUM DURATION, DISPLAY SEPERATELY*/

SELECT Name, Milliseconds
    FROM tracks 
    ORDER BY Milliseconds;

-- /*19- WRITE A QUERY THAT RETURNS THE TRACKS HAVING DURATION LESS 
-- THAN THE AVERAGE DURATION*/

SELECT Name, Milliseconds
    FROM tracks
    WHERE Milliseconds < (
                        SELECT avg(Milliseconds)
                        FROM tracks)
        ORDER BY Milliseconds DESC;
   

-- /*20- WRITE A QUERY THAT RETURNS THE TOTAL NUMBER OF EACH 
-- COMPOSER’s TRACK.*/

SELECT Composer, count(Composer)
    FROM tracks
    WHERE Milliseconds 
    GROUP BY Composer;

-- /*21- WRITE A QUERY THAT RETURNS THE GENRE OF EACH TRACK.*/

SELECT tracks.Composer, genres.Name
    FROM tracks
    JOIN genres on tracks.GenreId=genres.GenreId
    GROUP BY Composer;

-- /*22- WRITE A QUERY THAT RETURNS THE ARTIST’s ALBUM INFO.*/

SELECT artists.Name, albums.Title
    FROM artists
    JOIN albums on artists.ArtistId=albums.ArtistId
    GROUP BY artists.Name;

-- /*23- WRITE A QUERY THAT RETURNS THE MINIMUM DURATION OF THE TRACK 
-- IN EACH ALBUM. DISPLAY ALBUMID, ALBUM TITLE AND DURATION OF THE 
-- TRACK. THEN SORT THEM FROM HIGHEST TO LOWEST*/

SELECT albums.AlbumId, albums.Title, min(tracks.Milliseconds)
    FROM tracks
    JOIN albums on tracks.AlbumId=albums.AlbumId
    GROUP BY albums.AlbumId
    ORDER BY albums.AlbumId DESC;

-- /*24- WRITE A QUERY THAT RETURNS ALBUMS WHOSE TOTAL DURATION IS 
-- HIGHER THAN 60 MIN. DISPLAY ALBUM TITLE AND THEIR DURATIONS. THEN 
-- SORT THE RESULT FROM HIGHEST TO LOWEST*/

SELECT Title, sayi 
    FROM (SELECT albums.Title, sum(tracks.Milliseconds) as sayi 
                FROM tracks
                JOIN albums on tracks.AlbumId=albums.AlbumId
                GROUP BY albums.AlbumId)
    WHERE sayi > 360000
ORDER BY sayi DESC;

-- /*25- WRITE A QUERY THAT RETURNS TRACKID, TRACK NAME AND ALBUMID 
-- INFO OF THE ALBUM WHOSE TITLE ARE ‘Prenda Minha’, 'Heart of the Night' 
-- AND 'Out Of Exile'.*/

SELECT tracks.TrackId, tracks.Name, albums.AlbumId, albums.Title 
    FROM tracks
    JOIN albums on tracks.AlbumId=albums.AlbumId
    WHERE albums.Title in('Prenda Minha', 'Heart of the Night', 'Out Of Exile');