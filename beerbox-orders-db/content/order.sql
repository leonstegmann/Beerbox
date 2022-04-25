SELECT * FROM "order";
SELECT * FROM "order" WHERE order_id = -1;

SELECT * FROM "ordered_item";

SELECT * FROM ordered_item
JOIN "order" USING(order_id);

SELECT * FROM "JoinedOrder";

-- ordered items
SELECT * FROM "item" i
    JOIN "ordered_item" oi USING(item_id)
WHERE order_id = 14;

UPDATE "order"
SET customer_id = 'Sindre', table_id = 'Discusdude'
WHERE order_id = -1;

DELETE from "order"
WHERE order_id = 17;

ALTER SEQUENCE "order_order_id_seq" RESTART WITH 14;
