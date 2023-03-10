import 'package:beerbox/control/customer_provider.dart';
import 'package:beerbox/model/customer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgres/postgres.dart';

void main() {
  group('customer provider', () {

    final CustomerProvider dp = CustomerProvider();
    final Customer customer = Customer("Dummy", "");

    setUpAll(() async {

      dp.tableName = "customer_test_provider";

      PostgreSQLConnection connection = await dp.dbCrud.connection;
      connection.query("CREATE TABLE ${dp.tableName}"
          "(_id SERIAL PRIMARY KEY, "
          "name character varying(16) NOT NULL)");
    });

    tearDownAll(() async {
      PostgreSQLConnection connection = await dp.dbCrud.connection;
      connection.query("DROP TABLE ${dp.tableName}");
    });

    test('test connection', () {
      expect(dp.dbCrud.isClosed, false);
    });

    test('Read All - Expect Unfilled', () {
      expect(dp.readAll(), completion(isEmpty));
    });

    test('Create Customer', () async {
      Customer customerResponse = await dp.create(customer);
      expect(customerResponse.firstName, customer.firstName);
    });

    test('Read All - Expect Filled', () async {
      List<Customer> customerResponse = await dp.readAll();
      expect(customerResponse.length, 1);
    });

    test('Read Specific', () async {
      Customer customerCreated = await dp.create(customer);
      Customer resultRead = await dp.read(customerCreated.id!);
      expect(resultRead.firstName, customer.firstName);
    });

    test('Delete', () async {
      List<Customer> customers = await dp.readAll();
      expect(customers, isNotEmpty);
      await dp.delete(customers.first.id!);
      expect((await dp.readAll()).length, customers.length - 1);
    });
  });
}