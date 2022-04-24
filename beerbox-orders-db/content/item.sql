SELECT * FROM "item";
SELECT * FROM "item" WHERE _id = -1;

UPDATE "item"
SET itemtype_id = -1, name = '', costs = 0.0
WHERE _id = -1;

DELETE from "item"
WHERE _id = -1;

INSERT INTO "item"(itemtype_id, name, costs) VALUES (0, 'Duckstein', 120.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (0, 'Lübzer', 90.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (0, 'Sternburg', 65.0);

INSERT INTO "item"(itemtype_id, name, costs) VALUES (1, 'Zombie', 140.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (1, 'Sex on the Beach', 140.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (1, 'Long Island Iced Tee', 155.0);

INSERT INTO "item"(itemtype_id, name, costs) VALUES (2, 'Pfeffi', 40.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (2, 'Jägermeister', 50.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (2, 'Tequilla', 50.0);

INSERT INTO "item"(itemtype_id, name, costs) VALUES (3, 'Salzstange', 120.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (3, 'Eichelkäse', 90.0);
INSERT INTO "item"(itemtype_id, name, costs) VALUES (3, 'me ;3', 65.0);