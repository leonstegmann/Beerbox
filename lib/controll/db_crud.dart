import 'package:beerbox/model/db_object.dart';
import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

class DbCrud {
  static final DbCrud instance = DbCrud();

  late final PostgreSQLConnection _connection;

  DbCrud() {
    DotEnv env = DotEnv(includePlatformEnvironment: false)..load();
    _connection = PostgreSQLConnection(
        env['DB_HOST']!,
        int.parse(env['DB_PORT']!),
        env['DB_NAME']!,
        username: env['DB_USER'],
        password: env['DB_PASS'],
        useSSL: true);
  }


  Future<PostgreSQLConnection> get connection async {
    if (_connection.isClosed) {
      await _connection.open();
    }
    return _connection;
  }

  get isClosed => _connection.isClosed;

  Future<List<Map<String, Map<String, dynamic>>>> create(String table, DbObject dbObject) async {
    Map<String, dynamic> jsonMap = dbObject.toJsonMap();
    jsonMap.remove("_id");

    String variables = jsonMap.keys.toString();
    String values = jsonMap.values.toString();

    return (await connection).mappedResultsQuery(
        "INSERT INTO $table$variables VALUES $values RETURNING *");
  }

  Future<List<Map<String, Map<String, dynamic>>>> read(String table, int id) async {
    return (await connection).mappedResultsQuery("SELECT * FROM $table WHERE _id = $id");
  }

  Future<List<Map<String, Map<String, dynamic>>>> readAll(String table) async {
    return (await connection).mappedResultsQuery("SELECT * FROM $table");
  }

  Future<List<Map<String, Map<String, dynamic>>>> update(String table, DbObject dbObject) async {
    return (await connection).mappedResultsQuery(
        "UPDATE $table"
            "SET ${dbObject.toJsonMap().toString().replaceAll(':', ' =')}"
            "WHERE _id = ${dbObject.id}"
            "RETURNING *");
  }

  Future<List<Map<String, Map<String, dynamic>>>> delete(String table, int id) async {
    return (await connection).mappedResultsQuery("DELETE from $table WHERE _id = $id RETURNING *");
  }
}
