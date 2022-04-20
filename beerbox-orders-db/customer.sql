CREATE TABLE customer
(_id SERIAL PRIMARY KEY,
 name character varying(16) NOT NULL);

INSERT INTO customer(name)
VALUES ('Thorsten');

SELECT * FROM customer;

DELETE from customer
WHERE _id = 0;

DROP TABLE customer;