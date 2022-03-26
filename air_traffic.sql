-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE departures
(
id SERIAL PRIMARY KEY,
city_name TEXT NOT NULL,
country_name TEXT NOT NULL
);

CREATE TABLE arrivals
(
id SERIAL PRIMARY KEY,
city_name TEXT NOT NULL,
country_name TEXT NOT NULL
);

CREATE TABLE airlines
(
id SERIAL PRIMARY KEY,
airline TEXT NOT NULL
);

CREATE TABLE itineraries
(
id SERIAL PRIMARY KEY,
passengerid INT REFERENCES passengers,
airlineid INT REFERENCES airlines,
departureid INT REFERENCES departures,
departure_time TIMESTAMP NOT NULL,
arrivalid INT REFERENCES arrivals,
arrival_time TIMESTAMP NOT NULL,
seat TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');


--How to reference one locations table for departures AND arrivals in a sql query??--
INSERT INTO departures
  (city_name, country_name)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO arrivals
  (city_name, country_name)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO itineraries
  (passengerid, airlineid, departureid, departure_time, arrivalid, arrival_time, seat)
VALUES
  (1, 1, 1, '2018-04-08 09:00:00', 2, '2018-04-08 12:00:00', '33B'),
  (2, 2, 10, '2018-12-19 12:45:00', 11, '2018-12-19 16:15:00', '8A'),
  (3, 3, 3, '2018-01-02 07:00:00', 4, '2018-01-02 08:03:00', '12F'),
  (1, 3, 2, '2018-04-15 16:50:00', 12,'2018-04-15 21:00:00', '20A'),
  (4, 4, 13, '2018-08-01 18:30:00', 14, '2018-08-01 21:50:00', '23D'),
  (2, 5, 15, '2018-10-31 01:15:00', 16, '2018-10-31 12:55:00', '18C'),
  (5, 1, 5, '2019-02-06 06:00:00', 6, '2019-02-06 07:47:00', '9E'),
  (6, 6, 7, '2018-12-22 14:42:00', 8, '2018-12-22 15:56:00', '1A'),
  (5, 6, 6, '2019-02-06 16:28:00', 9, '2019-02-06 19:18:00', '32B'),
  (7, 7, 17, '2019-01-20 19:30:00', 18, '2019-01-20 22:45:00', '10D');

