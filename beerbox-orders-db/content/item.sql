SELECT * FROM "item";
SELECT * FROM "item" WHERE item_id = -1;

UPDATE "item"
SET itemtype_id = -1, name = '', costs = 0.0
WHERE item_id = -1;

DELETE from "item"
WHERE item_id = -1;
