SELECT * FROM "table";
SELECT * FROM "table" WHERE table_id = -1;

INSERT INTO "table" DEFAULT VALUES;

ALTER SEQUENCE "table_table_id_seq" RESTART WITH 1;

DELETE from "table"
WHERE table_id = -1;