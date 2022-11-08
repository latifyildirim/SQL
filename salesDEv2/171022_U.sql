/*Herbir parcanin adini getir*/

SELECT invoices.InvoiceId, invoices.CustomerId, customers.CustomerId, customers.FirstName

FROM invoices

INNER JOIN customers ON invoices.CustomerId = customers.CustomerId;



/*Find the artists album info*/

SELECT artists.Name, albums.Title

FROM artists

LEFT JOIN albums ON artists.ArtistId = albums.ArtistId;







/* heyyyy*/

SELECT TrackId, name, AlbumId

FROM tracks

WHERE AlbumId =(SELECT AlbumId FROM albums WHERE Title="Faceless");



/*eski method*/

SELECT tracks.TrackId, tracks.Name, tracks.AlbumId

FROM tracks

JOIN albums ON albums.AlbumId = tracks.AlbumId

WHERE albums.Title = "Faceless";





SELECT tracks.TrackId, tracks.Name, tracks.AlbumId

FROM tracks

JOIN albums on albums.AlbumId = tracks.AlbumId

WHERE albums.Title in ("Faceless" , "Let There Be Rock");

 

 

SELECT TrackId, name, AlbumId

FROM tracks

WHERE AlbumId in (SELECT AlbumId FROM albums WHERE Title in ("Faceless", "Let There Be Rock"));





SELECT tracks.TrackId, tracks.Name, tracks.AlbumId

FROM tracks

JOIN albums on albums.AlbumId = tracks.AlbumId

WHERE albums.Title in ("Faceless" , "Let There Be Rock");





SELECT tracks.TrackId, tracks.Name, tracks.AlbumId

FROM tracks

JOIN albums on albums.AlbumId = tracks.AlbumId

WHERE albums.Title in ("Faceless" , "Let There Be Rock");



/* farkli yerlerden*/



SELECT tracks.Name as adad, albums.Title as asdads, genres.Name as asdasd, media_types.Name as cece

From tracks

JOIN albums on tracks.AlbumId=albums.AlbumId

JOIN genres on tracks.GenreId=genres.GenreId

JOIN media_types on tracks.MediaTypeId=media_types.MediaTypeId;



SELECT tracks.name as parcaIsmi,albums.Title as albumIsmi,genres.name as turIsmi, media_types.Name as medyaTipi

from tracks join albums on tracks.AlbumId=albums.AlbumId

join genres on tracks.GenreId=genres.GenreId 

join media_types on tracks.MediaTypeId=media_types.MediaTypeId;



/*yeni deneme*/
SELECT *
FROM tracks
WHERE tracks.TrackId in
		(SELECT playlist_track.TrackId 
		FROM playlist_track
		WHERE playlist_track.PlaylistId=
			(SELECT playlists.PlaylistId 
			FROM playlists 
			WHERE playlists.Name ="Grunge"
			)
		)
;






















