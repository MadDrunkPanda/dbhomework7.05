CREATE TABLE IF NOT EXISTS genre
(
genre_id SERIAL PRIMARY KEY,
genre_name VARCHAR(256) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS singer
(
singer_id SERIAL PRIMARY KEY,
singer_name VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS genresinger
(
unique_id SERIAL PRIMARY KEY,
gen_id INTEGER NOT NULL REFERENCES genre(genre_id),
sing_id INTEGER NOT NULL REFERENCES singer(singer_id)
);

CREATE TABLE IF NOT EXISTS album
(
album_id SERIAL PRIMARY KEY,
album_name VARCHAR(1000) NOT NULL,
release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS singeralbum
(
singalb_id SERIAL PRIMARY KEY,
s_id INTEGER NOT NULL REFERENCES singer(singer_id),
alb_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS track
(
track_id SERIAL PRIMARY KEY,
track_name VARCHAR(1000) NOT NULL,
duration_time INTEGER NOT NULL,
release_date DATE,
album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS compilation
(
compilation_id SERIAL PRIMARY KEY,
compilation_name VARCHAR(256) NOT NULL,
release_date DATE
);

CREATE TABLE IF NOT EXISTS comptrack
(
comptrack_id SERIAL PRIMARY KEY,
tr_id INTEGER NOT NULL REFERENCES track(track_id),
compil_id INTEGER NOT NULL REFERENCES compilation(compilation_id)
);