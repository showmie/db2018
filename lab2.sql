
CREATE DATABASE lab2;
  CREATE TABLE countries (
  country_id SERIAL,
  country_name VARCHAR(25),
  region_id INT,
  population INT,
  CONSTRAINT pKey PRIMARY KEY (country_id)
  );

INSERT INTO countries VALUES (DEFAULT, 'Canada', 01, 36290000);
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Georgia');
INSERT INTO countries VALUES (DEFAULT, 'Japan', NULL, 127000000);
INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'Germany', 05, 82670000),
                                                                               (DEFAULT, 'France', 08, 66900000),
                                                                               (DEFAULT, 'China', 02, 1379000000),
                                                                               (DEFAULT, 'Vatican', 12, 1000);
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 07, 17000000);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;



SELECT * FROM countries;