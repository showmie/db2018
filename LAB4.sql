CREATE DATABASE lab4;
CREATE TABLE customers2 (
  customer INTEGER,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INTEGER,
  salesman INTEGER

);
select * from customers2;
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3001, 'Brad Guzan', 'London', 0, 5005);
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3004, 'Fabian Johna', 'Paris', 300, 5006);
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers2 (customer, cust_name, city, grade, salesman) VALUES (3008, 'Julian Green', 'London', 300, 5002);
SELECT * FROM customers2 WHERE grade > 100;
SELECT * FROM customers2 WHERE city = 'New York' and grade > 100;
SELECT * FROM customers2 WHERE city = 'New York' or grade > 100;
SELECT * FROM customers2 WHERE city = 'Paris' or city = 'Rome';
SELECT * FROM customers2 WHERE cust_name LIKE 'B%';

CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  description VARCHAR(30),
  purch INTEGER
);
SELECT * FROM orders WHERE customer_id=(SELECT customer_id FROM customers2 WHERE city = 'New York');
SELECT * FROM customers WHERE cusomer_id=(SELECT cusomer_id FROM orders HAVING sum(order_id) > 10);
SELECT sum(purch) FROM orders;
SELECT avg(purch) FROM orders;
SELECT GREATEST(purch) FROM orders