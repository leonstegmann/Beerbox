SELECT * FROM "customer";
SELECT * FROM "customer" WHERE _id = -1;

INSERT INTO "customer"(firstname, familyname) VALUES ('Elias', 'Dancemaster');
INSERT INTO "customer"(firstname, familyname) VALUES ('Ole', 'der Hüne');
INSERT INTO "customer"(firstname, familyname) VALUES ('Sindre', 'Discusdude');
INSERT INTO "customer"(firstname, familyname) VALUES ('Leon', 'Stegosaurus');
INSERT INTO "customer"(firstname, familyname) VALUES ('Thomas', 'Snoozedaddy');
INSERT INTO "customer"(firstname, familyname) VALUES ('Hannes', 'Hotzenplotz');
INSERT INTO "customer"(firstname, familyname) VALUES ('A', 'a');
INSERT INTO "customer"(firstname, familyname) VALUES ('B', 'b');
INSERT INTO "customer"(firstname, familyname) VALUES ('C', 'c');
INSERT INTO "customer"(firstname, familyname) VALUES ('D', 'd');
INSERT INTO "customer"(firstname, familyname) VALUES ('E', 'e');
INSERT INTO "customer"(firstname, familyname) VALUES ('F', 'f');
INSERT INTO "customer"(firstname, familyname) VALUES ('G', 'g');
INSERT INTO "customer"(firstname, familyname) VALUES ('H', 'h');

UPDATE "customer"
SET firstname = 'Sindre', familyname = 'Discusdude'
WHERE firstname = 'Sindre';

DELETE from "customer"
WHERE _id = -1;