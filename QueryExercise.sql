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
