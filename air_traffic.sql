-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER NOT NULL,
  FOREIGN KEY (country_id) REFERENCES countries(id)
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL,
  from_city_id INTEGER NOT NULL,
  to_city_id INTEGER NOT NULL,
  FOREIGN KEY (airline_id) REFERENCES airlines(id),
  FOREIGN KEY (from_city_id) REFERENCES cities(id),
  FOREIGN KEY (to_city_id) REFERENCES cities(id)
);

INSERT INTO countries (name) VALUES
('United States'),
('Japan'),
('United Kingdom'),
('France'),
('Morocco'),
('UAE'),
('China'),
('Mexico'),
('Brazil'),
('Chile');

INSERT INTO cities (name, country_id) VALUES
('Washington DC', 1),
('Seattle', 1),
('Tokyo', 2),
('London', 3),
('Los Angeles', 1),
('Las Vegas', 1),
('Paris', 4),
('Casablanca', 5),
('Dubai', 6),
('Beijing', 7),
('New York', 1),
('Charlotte', 1),
('Cedar Rapids', 1),
('Chicago', 1),
('New Orleans', 1),
('Sao Paolo', 8),
('Santiago', 9),
('Mexico City', 7);

INSERT INTO airlines (name) VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 18),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 7, 8),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 9, 10),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 11, 12),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 13, 14),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 12, 15),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 17);