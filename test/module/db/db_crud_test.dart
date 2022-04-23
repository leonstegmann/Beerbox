import 'package:beerbox/controll/db_crud.dart';
import 'package:beerbox/model/customer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgres/src/connection.dart';

void main() {
  group('customer crud', () {

    final DbCrud db = DbCrud.instance;
    final Customer customer = Customer(null, "Dummy", "");
    const String table = "customer_test_crud";

    setUpAll(() async {
      PostgreSQLConnection connection = await db.connection;
      await connection.query("CREATE TABLE $table"
          "(_id SERIAL PRIMARY KEY, "
          "name character varying(16) NOT NULL)");
    });

    tearDownAll(() async {
      PostgreSQLConnection connection = await db.connection;
      await connection.query("DROP TABLE $table");
    });

    test('test connection', () async {
      expect(db.isClosed, false);
    });

    test('Read All - Expect Unfilled', () async {
      List<Map<String, Map<String, dynamic>>> results = await db.readAll(table);
      expect(results, isEmpty);
    });

    test('Create Customer', () async {
      await db.create(table, customer);
    });

    test('Read All - Expect Filled', () async {
      List<Map<String, Map<String, dynamic>>> results = await db.readAll(table);
      expect(results.length, 1);
    });

    test('Read Specific', () async {
      List<Map<String, Map<String, dynamic>>> resultCreate = await db.create(table, customer);
      int id = resultCreate.first[table]!["_id"];
      List<Map<String, Map<String, dynamic>>> resultRead = await db.read(table, id);
      Customer createdCustomer = Customer.fromJson(resultRead.first[table]!);
      expect(createdCustomer.firstName, customer.firstName);
    });
  });
}