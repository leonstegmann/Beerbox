SELECT * FROM "customer";
SELECT * FROM "customer" WHERE customer_id = -1;

UPDATE "customer"
SET firstname = 'Sindre', familyname = 'Discusdude'
WHERE firstname = 'Sindre';

DELETE from "customer"
WHERE customer_id = -1;