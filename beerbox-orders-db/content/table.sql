SELECT * FROM "table";
SELECT * FROM "table" WHERE _id = -1;

INSERT INTO "table" DEFAULT VALUES;

ALTER SEQUENCE "table__id_seq" RESTART WITH 1;

DELETE from "table"
WHERE _id = -1;