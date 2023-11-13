CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	track_title VARCHAR(40) NOT NULL,
	duration VARCHAR(40) NOT NULL,
	album VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_title VARCHAR(40) NOT NULL,
	year_of_release DATE NOT NULL,
	artist VARCHAR(40) NOT NULL,
	track_id INTEGER NOT NULL REFERENCES Track(track_id)
);

CREATE TABLE IF NOT EXISTS Artist (
	artist_id SERIAL PRIMARY KEY,
	name_pseudonym VARCHAR(40) NOT NULL,
	genre VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_title VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection  (
	collection_id SERIAL PRIMARY KEY,
	collection_title VARCHAR(40) NOT NULL,
	year_of_realease DATE NOT NULL,
	tracks VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Artist (
	genre_artist_id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES Artist(artist_id),
	genre_id INTEGER NOT NULL REFERENCES Genre(genre_id)
);

CREATE TABLE IF NOT EXISTS Artist_Album (
	artist_album_id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES Artist(artist_id),
	album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Track_Collection (
	track_collection_id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES Track(track_id),
	collection_id INTEGER NOT NULL REFERENCES Collection(collection_id)
);