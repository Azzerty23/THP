-- Récupérer tous les albums
SELECT * FROM albums;

-- Récupérer tous les albums dont le titre contient "Great" (indice)
SELECT * FROM albums WHERE artists LIKE '%Great%';

-- Donner le nombre total d'albums contenus dans la base (sans regarder les id bien sûr)
SELECT COUNT(*) FROM albums;

-- Supprimer tous les albums dont le nom contient "music"
DELETE FROM albums WHERE Title LIKE '%music%';

-- Récupérer tous les albums écrits par AC/DC
SELECT * 
FROM albums
INNER JOIN artists ON albums.ArtistId = artists.ArtistId AND artists.Name = 'AC/DC';

-- Récupérer tous les titres des albums de AC/DC
SELECT Title
FROM albums
INNER JOIN artists ON albums.ArtistId = artists.ArtistId AND artists.Name = 'AC/DC';

-- Récupérer la liste des titres de l'album "Let There Be Rock"
SELECT t.Name
FROM tracks t
INNER JOIN albums a ON t.AlbumId = albums.AlbumId AND albums.Title = 'Let There Be Rock';

-- Afficher le prix de cet album ainsi que sa durée totale
SELECT SUM(t.UnitPrice)
FROM tracks t
INNER JOIN albums a ON a.AlbumId = t.AlbumId AND a.Title = 'Let There Be Rock';

-- Afficher le coût de l'intégralité de la discographie de "Deep Purple"
SELECT SUM(t.UnitPrice)
FROM tracks t
INNER JOIN albums a ON a.AlbumId = t.AlbumId 
INNER JOIN artists ar ON ar.ArtistId = a.ArtistId AND ar.Name = 'Deep Purple';

-- Créer l'album de ton artiste favori en base, en renseignant correctement les trois tables albums, artists et tracks
PRAGMA writable_schema=ON;
INSERT INTO artists (Name) VALUES ('Basshunter');
SELECT ArtistId FROM artists WHERE Name = 'Basshunter'; -- return 276
INSERT INTO albums (Title, ArtistId) VALUES ('Dota', 276);
SELECT AlbumId FROM albums WHERE Title = 'Dota' AND ArtistId = 276; -- return 348
INSERT INTO tracks (Name, AlbumId, MediaTypeId, GenreId...
);


-- Création bdd startup
CREATE TABLE user (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT
);

CREATE TABLE article (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
creator_id INTEGER,
category_id INTEGER,
name TEXT
);

CREATE TABLE category (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
article_id INTEGER,
title TEXT
);

CREATE TABLE tag (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
category_id INTEGER,
title TEXT,
color TEXT
);