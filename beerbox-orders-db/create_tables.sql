DROP TABLE IF EXISTS "ordered_item" CASCADE;
DROP TABLE IF EXISTS "order" CASCADE;
DROP TABLE IF EXISTS "table" CASCADE;
DROP TABLE IF EXISTS "item" CASCADE;
DROP TABLE IF EXISTS "customer" CASCADE;

DROP VIEW IF EXISTS "joined_order";


CREATE TABLE "customer"(
    customer_id SERIAL UNIQUE PRIMARY KEY NOT NULL,
    firstname CHARACTER VARYING(32) NOT NULL,
    familyname CHARACTER VARYING(32) NOT NULL);

CREATE TABLE "table"(
    table_id SERIAL UNIQUE PRIMARY KEY NOT NULL);

CREATE TABLE "item"(
   item_id SERIAL UNIQUE PRIMARY KEY NOT NULL,
   itemtype_id INT NOT NULL,
   name CHARACTER VARYING(32) NOT NULL,
   costs float4 NOT NULL);

CREATE TABLE "order"(
    order_id SERIAL UNIQUE PRIMARY KEY NOT NULL,
    customer_id INT NOT NULL,
    table_id INT NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES "customer"(customer_id) ON DELETE SET NULL,
    FOREIGN KEY(table_id) REFERENCES "table"(table_id) ON DELETE SET NULL);

CREATE TABLE "ordered_item"(
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    FOREIGN KEY(order_id) REFERENCES "order"(order_id) ON DELETE CASCADE,
    FOREIGN KEY(item_id) REFERENCES "item"(item_id));

CREATE VIEW "joined_order" AS
SELECT *
FROM "order" as o
    LEFT JOIN "ordered_item" oi USING(order_id)
    LEFT JOIN "item" USING(item_id)
    LEFT JOIN "customer" c USING(customer_id);