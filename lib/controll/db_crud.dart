import 'package:beerbox/model/db_object.dart';
import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

/// The singleton crud holding the database connection.
///
/// A CRUD is defined to manage a database by defining the methods **Create, Read, Update, Delete**.
/// This crud connects to a [PostgreSQLConnection] using the [DotEnv] lib to handle the parameters saved to [.env_postgresql].
/// All defined operations return a mapped database response used to reconstruct the found [DbObject]'s.
/// Look into the database tests like [postgres_test.dart] or defined [DataProvider] for better understanding.
///
/// ## Usage
/// It is recommended to never directly use this [DbCrud] outside of a [DataProvider].
class DbCrud {
  static final DbCrud instance = DbCrud._init();

  late final PostgreSQLConnection _connection;

  DbCrud._init() {
    DotEnv env = DotEnv(includePlatformEnvironment: false)..load([".env_postgresql"]);
    _connection = PostgreSQLConnection(
        env['DB_HOST']!,
        int.parse(env['DB_PORT']!),
        env['DB_NAME']!,
        username: env['DB_USER'],
        password: env['DB_PASS'],
        useSSL: true);
  }

  /// Provides the database connection or opens it if needed.
  ///
  /// Dont miss-use it and go for already defined operations if possible.
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
            "WHERE ${table}_id = ${dbObject.id}"
            "RETURNING *");
  }

  Future<List<Map<String, Map<String, dynamic>>>> delete(String table, int id) async {
    return (await connection).mappedResultsQuery("DELETE from $table WHERE _id = $id RETURNING *");
  }
}
