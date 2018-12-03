CREATE DATABASE lab8;

CREATE TABLE salesmen(
salesman_id INTEGER PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(50),
commission FLOAT
);

CREATE TABLE customers(
customer_id INTEGER PRIMARY KEY,
cust_name VARCHAR(50),
city VARCHAR(50),
grade INTEGER,
salesman_id INTEGER REFERENCES salesmen(salesman_id)
);

CREATE TABLE orders(
ord_no INTEGER PRIMARY KEY,
purch_amt FLOAT,
ord_date DATE,
customer_id INTEGER REFERENCES customers,
salesman_id INTEGER REFERENCES salesmen
);

INSERT INTO salesmen (salesman_id, name, city, commission) VALUES (5001, 'James Hoog', 'New York', 0.15),
                                                                  (5002, 'Neil Knite', 'Paris', 0.13),
                                                                  (5005, 'Pit Alex', 'London', 0.11),
                                                                  (5006, 'Mc Lyon', 'Paris', 0.14),
                                                                  (5003, 'Lauson Hen', DEFAULT , 0.12),
                                                                  (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                                                                                (3005, 'Graham Zusi', 'California', 200, 5002),
                                                                                (3001, 'Brad Guzan', 'London', DEFAULT , 5005),
                                                                                (3004, 'Fabian Johns', 'Paris', 300, 5006),
                                                                                (3007, 'Brad Davis', 'New York', 200, 5001),
                                                                                (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                                                                                (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, 150.5, TO_DATE('2012-10-05', 'YYYY/MM/DD'), 3005, 5002),
                                                                                  (70009, 270.65, TO_DATE('2012-09-10', 'YYYY/MM/DD'), 3001, 5005),
                                                                                  (70002, 65.26, TO_DATE('2012-10-05', 'YYYY/MM/DD'), 3002, 5001),
                                                                                  (70004, 110.5, TO_DATE('2012-08-17', 'YYYY/MM/DD'), 3009, 5003),
                                                                                  (70007, 948.5, TO_DATE('2012-09-10', 'YYYY/MM/DD'), 3005, 5002),
                                                                                  (70005, 2400.6, TO_DATE('2012-07-27', 'YYYY/MM/DD'), 3007, 5001),
                                                                                  (70008, 5760, TO_DATE('2012-09-10', 'YYYY/MM/DD'), 3002, 5001);


--3
CREATE ROLE junior_dev WITH LOGIN;

--4
CREATE VIEW newyork_salesmen AS SELECT * FROM salesmen WHERE city = 'New York';

--5
CREATE VIEW orders_salesman_customer AS SELECT ord_no, c.cust_name, s.name FROM orders, customers AS c, salesmen AS s WHERE orders.customer_id = c.customer_id AND orders.salesman_id = s.salesman_id;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO junior_dev;

--6
CREATE VIEW highest_grade AS SELECT * FROM customers WHERE grade NOTNULL ORDER BY grade DESC LIMIT 1;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM junior_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO junior_dev;

--7
CREATE VIEW salesmen_city_count AS SELECT city, COUNT(salesman_id) FROM salesmen GROUP BY city;

--8
SELECT * FROM salesmen WHERE (SELECT count(customer_id) FROM customers WHERE customers.salesman_id = salesmen.salesman_id) > 1;

--9
CREATE ROLE intern;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO junior_dev;