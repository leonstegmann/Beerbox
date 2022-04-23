SELECT * FROM "customer";
SELECT * FROM "customer" WHERE _id = -1;

INSERT INTO "customer"(firstname, familyname) VALUES ('Elias', 'Dancemaster');
INSERT INTO "customer"(firstname, familyname) VALUES ('Ole', 'der Hüne');
INSERT INTO "customer"(firstname, familyname) VALUES ('Sindre', 'Discusdude');
INSERT INTO "customer"(firstname, familyname) VALUES ('Leon', 'Stegosaurus');
INSERT INTO "customer"(firstname, familyname) VALUES ('Thomas', 'Snoozedaddy');
INSERT INTO "customer"(firstname, familyname) VALUES ('Hannes', 'Hotzenplotz');

UPDATE customer
SET firstname = 'Sindre', familyname = 'Discusdude'
WHERE firstname = 'Sindre';

DELETE from customer
WHERE _id = -1;