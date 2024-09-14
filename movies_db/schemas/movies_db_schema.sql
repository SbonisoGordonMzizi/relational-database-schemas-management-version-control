CREATE TABLE actors (
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	date_of_birth DATE NOT NULL,
	add_date DATE,
	update_date DATE
);

CREATE TABLE directors (
	director_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	nationality VARCHAR(30) NOT NULL
);

CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(50) NOT NULL,
	movie_length INT NOT NULL,
	movie_lang VARCHAR(20),
	release_date DATE,
	age_certificate VARCHAR(10),
	director_id INT REFERENCES directors (director_id)
);

CREATE TABLE movies_revenues (
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	revenue_domestic NUMERIC (10,2),
	revenue_international NUMERIC (10,2)
);

CREATE TABLE movies_actors (
	movie_id INT REFERENCES movies (movie_id),
	actor_id INT REFERENCES actors (actor_id),
	PRIMARY KEY(movie_id, actor_id)
);