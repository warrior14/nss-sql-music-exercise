-- Exercises 

-- Query all of the entries in the Genre table
SELECT * FROM Genre;

-- Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
--Default is ascending (ASC keyword), DESC is descending order
SELECT 
	Id,
	ArtistName,
	YearEstablished
FROM Artist
ORDER BY ArtistName ASC;

-- Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT 
	Title,
	ArtistName
FROM Song
INNER JOIN Artist
ON Song.ArtistId = Artist.Id;

-- Write a SELECT query that lists all the Artists that have a Soul Album
--Different ways to rename a column/property on a table

SELECT
	ArtistName "Artist Name",
	Name AS [Genre Name]
FROM Album
INNER JOIN Artist
ON Album.ArtistId = Artist.Id
INNER JOIN Genre
ON Album.GenreId = Genre.Id
WHERE Album.GenreId = 1;

-- Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT
	ArtistName "Artist Name",
	Name As [Genre Name]
FROM Album
Inner Join Artist
ON Album.ArtistId = Artist.Id
Inner Join Genre
On Album.GenreId = Genre.Id
WHERE Album.GenreId = 4 OR Album.GenreId = 2;

-- Write a SELECT statement that lists the Albums with no songs
SELECT 
	al.Title [Album Title],
	s.Title [Song Title]
FROM Album al
LEFT OUTER JOIN Song s
ON s.AlbumId = al.Id
WHERE s.Id IS NULL;

-- --WHERE COUNT(s.AlbumId) = 0;
SELECT 
	A.Id [Album Id],
	A.Title [Album Title],
	A.Label,
	S.Id [Song Id],
		S.Title [Song Title]
FROM 
	Album A
LEFT OUTER JOIN Song S
ON S.AlbumId Is NULL;

-- Using the INSERT statement, add one of your favorite artists to the Artist table
INSERT INTO Artist (ArtistName, YearEstsblished) VALUES ('DRAKE', 2009);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Genre (Name) VALUES ('Rap');

SELECT 
	Name [Music Genre]
FROM Genre 
WHERE Name = 'Rap';

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Take Care', 2011, 399, 'Rap', 23, 44, 20);

-- Using the INSERT statement, add some songs that are on that album to the Song table
INSERT INTO Song (Title, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Marvins Room', '04/12/2014', 20, 44, 23);

--Using the INSERT statement, add some songs that are on that album to the Song table
INSERT INTO (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Gods Plan', '424', '08/25/2017', 20, 44, 23);

--Write a SELECT query that provides the song titles, album title, 
--and artist name for all of the data you just entered in. Use the LEFT JOIN keyword
--sequence to connect the tables, 
--and the WHERE keyword to filter the results to the album and artist you added.
SELECT 
	s.Title [Song Title],
	al.Title [Album Title],
	ArtistName
FROM 
	Album al
LEFT JOIN Song s
ON s.AlbumId = al.Id
LEFT JOIN Artist
ON s.ArtistId = Artist.Id
WHERE al.Title = 'Know Yourself'


--Changing direction of join to see difference in results:
--Shows albums that have null values/no songs associated (left join all albums):
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--Shows albums that have songs/no null values (left join all songs/all songs are in an album):
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

--Write a SELECT statement to display how many songs exist for each album.
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	a.Title,
	COUNT(s.AlbumId) [Number of Songs in Album]
FROM Song s
LEFT JOIN Album al
ON al.Id = s.AlbumId
GROUP BY al.Title;

-- Write a SELECT statement to display how many songs exist for each artist.
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	ar.ArtistName ,
	COUNT(s.ArtistId) [Number of Songs By Artist]
FROM Song s
LEFT JOIN Artist ar
ON ar.Id = s.ArtistId
GROUP BY ar.ArtistName;

-- Write a SELECT statement to display how many songs exist for each genre. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	g.Name [Genre Name],
	COUNT(s.GenreId) [Number of Songs in Genre]
FROM Song s
LEFT JOIN Genre g
ON g.Id = s.GenreId
GROUP BY g.Name


--Write a SELECT query that lists the Artists that have put out records on more than one record label. 
--Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT 
	ar.ArtistName,
	COUNT(DISTINCT al.Label) [Number of Labels]
FROM Artist ar
INNER JOIN Album al
ON al.ArtistId = ar.Id
GROUP BY ar.ArtistName
HAVING COUNT(DISTINCT al.Label) > 1;

-- Using MAX() function, write a select statement to find the album with the longest duration.
--The result should display the album title and the duration.
SELECT
	al.Title [Album Title],
	al.AlbumLength [Album with longest duration]
FROM Album al
WHERE al.AlbumLength = (
	SELECT MAX(al.AlbumLength)
	FROM Album al
);

--Using MAX() function, write a select statement to find the song with the longest duration.
--The result should display the song title and the duration.
SELECT 
	al.Title [Album Title],
	s.Title [Song Title],
	s.SongLength [Song with longest duration]
FROM Song s
INNER JOIN Album al
ON s.AlbumId = al.Id
WHERE s.SongLength = (
	SELECT MAX(s.SongLength)
	FROM Song s
);

--Modify the previous query to also display the title of the album.
SELECT 
	al.Title [Album Title],
	s.Title [Song Title],
	s.SongLength [Song with longest duration]
FROM Song s
INNER JOIN Album al
ON s.AlbumId = al.Id
WHERE s.SongLength = (
	SELECT MAX(s.SongLength)
	FROM Song s
);



