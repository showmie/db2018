CREATE DATABASE lab4;

CREATE TABLE warehouses(
  code SERIAL,
  location VARCHAR(255),
  capacity SERIAL
);

CREATE TABLE boxes(
  code VARCHAR(4),
  content VARCHAR(255),
  value real,
  waerhouse int
);

INSERT INTO warehouses (location, capacity) values ('Chicago',3);
INSERT INTO warehouses (location, capacity) values ('Chicago',4);
INSERT INTO warehouses (location, capacity) values ('New York',7);
INSERT INTO warehouses (location, capacity) values ('Los Angeles',2);
INSERT INTO warehouses (location, capacity) values ('Ssn Frsncisco',8);

INSERT INTO boxes (code, content, value, waerhouse) values ('DMN7', 'Rocks', 180, 3);
INSERT INTO boxes (code, content, value, waerhouse) values ('4HSP', 'Rocks', 250, 1);
INSERT INTO boxes (code, content, value, waerhouse) values ('4RT3', 'Scissors', 190, 4);
INSERT INTO boxes (code, content, value, waerhouse) values ('7G3H', 'Rocks', 200, 1);
INSERT INTO boxes (code, content, value, waerhouse) values ('8jN6', 'Papers', 75, 1);
INSERT INTO boxes (code, content, value, waerhouse) values ('8Y6U', 'Papers', 50, 3);
INSERT INTO boxes (code, content, value, waerhouse) values ('9j6F', 'Papers', 175, 2);
INSERT INTO boxes (code, content, value, waerhouse) values ('LL08', 'Rocks', 140, 4);
INSERT INTO boxes (code, content, value, waerhouse) values ('PQH6', 'Scissors', 125, 1);
INSERT INTO boxes (code, content, value, waerhouse) values ('P2T6', 'Scissors', 150, 2);
INSERT INTO boxes (code, content, value, waerhouse) values ('TUSS', 'Papers', 90, 5);

SELECT * FROM warehouses;

SELECT * FROM boxes WHERE value > 150;

SELECT * FROM boxes ORDER BY content;

SELECT code, capacity FROM warehouses;

SELECT code, capacity FROM warehouses WHERE capacity > 2;

INSERT INTO warehouses (location,capacity) values ('New York', 3);

INSERT INTO boxes (code, content, value, waerhouse) values ('H5RT', 'Papers', 200, 2);

UPDATE boxes SET value = (value * 0.85) WHERE value=(SELECT value FROM boxes ORDER BY value LIMIT 1 OFFSET 2);

DELETE FROM boxes WHERE value > 150;

DELETE FROM boxes WHERE waerhouse=(SELECT code FROM warehouses WHERE location = 'New York' GROUP BY code) RETURNING *;