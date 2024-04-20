-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

CREATE TABLE songs_producers
(
  song_id INTEGER NOT NULL,
  producer_id INTEGER NOT NULL,
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (producer_id) REFERENCES producers(id),
  PRIMARY KEY (song_id, producer_id)
);

INSERT INTO artists (name) VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO albums (title, release_date, artist_id) VALUES
('Middle of Nowhere', '1997-04-15', 1),
('A Night at the Opera', '1975-10-31', 2),
('Daydream', '1995-11-14', 3),
('A Star Is Born', '2018-09-27', 5),
('Silver Side Up', '2001-08-21', 6),
('The Blueprint 3', '2009-10-20', 7),
('Prism', '2013-12-17', 9),
('Hands All Over', '2011-06-21', 11),
('Let Go', '2002-05-14', 13),
('The Writing''s on the Wall', '1999-11-07', 14);


INSERT INTO producers (name) VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs (title, duration_in_seconds, album_id) VALUES
('MMMBop', 238, 1),
('Bohemian Rhapsody', 355, 2),
('One Sweet Day', 282, 3),
('Shallow', 216, 4),
('How You Remind Me', 223, 5),
('New York State of Mind', 276, 6),
('Dark Horse', 215, 7),
('Moves Like Jagger', 201, 8),
('Complicated', 244, 9),
('Say My Name', 240, 10);

INSERT INTO songs_producers (song_id, producer_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);