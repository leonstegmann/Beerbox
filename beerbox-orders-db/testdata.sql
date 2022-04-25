-- CUSTOMER
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

-- TABLE
DO $$
    DECLARE i INT :=0;
    BEGIN
        WHILE (SELECT (count(*) < 14) FROM "table") LOOP
                INSERT INTO "table" DEFAULT VALUES;
                i := i + 1;
            END LOOP;
    END $$;

-- ITEM
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

-- ORDER
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