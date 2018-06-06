DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL2 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT2 REFERENCES artists(id)
);
