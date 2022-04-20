import 'package:dotenv/dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgres/postgres.dart';

void main() {
  group('postgres connection', () {

    test('Test Connection', () async {
      PostgreSQLConnection connection = PostgreSQLConnection(
          "ec2-34-247-72-29.eu-west-1.compute.amazonaws.com",
          5432,
          "dgdob5fr7i8io",
          username: "kyfrrzmlxuxpzl",
          password: "bf33dbc056e5dbdb3dd731373035b0d09d7272e1a8c74adc0ebf8d99108d86dd",
          useSSL: true);

      expect(connection.isClosed, true);
      await connection.open();
      expect(connection.isClosed, false);
    });

    test('Test Env Connection', () async {
      DotEnv env = DotEnv(includePlatformEnvironment: false)..load();
      PostgreSQLConnection connection = PostgreSQLConnection(
          env['DB_HOST']!,
          int.parse(env['DB_PORT']!),
          env['DB_NAME']!,
          username: env['DB_USER'],
          password: env['DB_PASS'],
          useSSL: true);

      expect(connection.isClosed, true);
      await connection.open();
      expect(connection.isClosed, false);
    });

    test('Test Query', () async {
      DotEnv env = DotEnv(includePlatformEnvironment: false)..load();
      PostgreSQLConnection connection = PostgreSQLConnection(
          env['DB_HOST']!,
          int.parse(env['DB_PORT']!),
          env['DB_NAME']!,
          username: env['DB_USER'],
          password: env['DB_PASS'],
          useSSL: true);

      await connection.open();

      PostgreSQLResult result = await connection.query("SELECT * FROM customer");
      expect(result, isNotNull);
    });

    test('Test MappedResultsQuery', () async {
      DotEnv env = DotEnv(includePlatformEnvironment: false)..load();
      PostgreSQLConnection connection = PostgreSQLConnection(
          env['DB_HOST']!,
          int.parse(env['DB_PORT']!),
          env['DB_NAME']!,
          username: env['DB_USER'],
          password: env['DB_PASS'],
          useSSL: true);

      await connection.open();

      PostgreSQLResult result = await connection.query("SELECT * FROM customer");
      expect(result, isNotNull);
    });

    test('Test SubstitutionValues', () async {
      DotEnv env = DotEnv(includePlatformEnvironment: false)..load();
      PostgreSQLConnection connection = PostgreSQLConnection(
          env['DB_HOST']!,
          int.parse(env['DB_PORT']!),
          env['DB_NAME']!,
          username: env['DB_USER'],
          password: env['DB_PASS'],
          useSSL: true);

      await connection.open();

      bool exceptionThrown = false;
      try {
        await connection.query("SELECT * FROM @table", substitutionValues: {"table": "customer"});
      } catch (e) {
        exceptionThrown = true;
      }

      expect(exceptionThrown, true);
    });
  });
}