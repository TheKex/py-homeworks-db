CREATE TABLE collection (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(120) NOT NULL,
	release_date DATE NOT NULL
);

CREATE TABLE album (
	id SERIAL PRIMARY KEY,
	release_date DATE NOT NULL,
	album_name VARCHAR(120) NOT NULL
);

CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	artist_name VARCHAR(120) NOT NULL
);

CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(120) NOT NULL
);

CREATE TABLE song (
	id SERIAL PRIMARY KEY,
	song_name VARCHAR(120) NOT NULL,
	song_duration_seconds INTEGER NOT NULL CONSTRAINT positive_dur CHECK (song_duration_seconds > 0),
	song_album INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE song_collection (
	id SERIAL PRIMARY KEY,
	collection INTEGER NOT NULL REFERENCES collection(id),
	song INTEGER NOT NULL REFERENCES song(id),
	UNIQUE (collection, song)
);

CREATE TABLE album_artist (
	id SERIAL PRIMARY KEY,
	album INTEGER NOT NULL REFERENCES album(id),
	artist INTEGER NOT NULL REFERENCES artist(id),
	UNIQUE (album, artist)
);

CREATE TABLE artist_genre (
	id SERIAL PRIMARY KEY,
	artist INTEGER NOT NULL REFERENCES artist(id),
	genre INTEGER NOT NULL REFERENCES genre(id),
	UNIQUE (artist, genre)
);
