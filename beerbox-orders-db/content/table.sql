SELECT * FROM "table";
SELECT * FROM "table" WHERE table_id = -1;

SELECT o.table_id, order_id FROM "table"
    JOIN "order" o on "table".table_id = o.table_id;

ALTER SEQUENCE "table_table_id_seq" RESTART WITH 1;

DELETE from "table"
WHERE table_id = -1;