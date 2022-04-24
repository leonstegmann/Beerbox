SELECT * FROM "order";
SELECT * FROM "order" WHERE _id = -1;

SELECT oi.order_id as "order",
       table_id as "table",
       c.firstname || ' ' || c.familyname as customer,
       timestamp,
       i.name as item,
       i.itemtype_id as item_type,
       costs
FROM "ordered_item" as oi
    JOIN "item" as i on oi.item_id = i._id
    JOIN "order" o on oi.order_id = o._id
    JOIN "customer" c on o.customer_id = c._id;

UPDATE "order"
SET customer_id = 'Sindre', table_id = 'Discusdude'
WHERE _id = -1;

DELETE from "order"
WHERE _id = 17;

ALTER SEQUENCE "order__id_seq" RESTART WITH 14;

-- Table 4
INSERT INTO "order"(customer_id, table_id) VALUES (1, 4);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (1, 9);

INSERT INTO "order"(customer_id, table_id) VALUES (2, 4);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (2, 11);

INSERT INTO "order"(customer_id, table_id) VALUES (3, 4);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (3, 10);

INSERT INTO "order"(customer_id, table_id) VALUES (4, 4);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (4, 9);

-- Table 2
INSERT INTO "order"(customer_id, table_id) VALUES (5, 2);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (5, 3);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (5, 11);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (5, 12);

INSERT INTO "order"(customer_id, table_id) VALUES (6, 2);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (6, 3);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (6, 3);

-- Table 10
INSERT INTO "order"(customer_id, table_id) VALUES (7, 10);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (7, 8);

INSERT INTO "order"(customer_id, table_id) VALUES (8, 10);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (8, 9);

INSERT INTO "order"(customer_id, table_id) VALUES (9, 10);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (9, 9);

INSERT INTO "order"(customer_id, table_id) VALUES (10, 10);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (10, 9);


-- Table 5
INSERT INTO "order"(customer_id, table_id) VALUES (11, 5);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (11, 9);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (11, 9);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (11, 11);


-- Table 7
INSERT INTO "order"(customer_id, table_id) VALUES (12, 7);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (12, 10);

INSERT INTO "order"(customer_id, table_id) VALUES (13, 7);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (13, 9);


-- Table 14
INSERT INTO "order"(customer_id, table_id) VALUES (14, 13);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (14, 9);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (14, 4);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (14, 3);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (14, 2);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (14, 2);
INSERT INTO "ordered_item"(order_id, item_id) VALUES (14, 3);
