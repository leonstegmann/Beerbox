import 'package:beerbox/model/db_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';

/// The singleton crud holding the database connection.
///
/// A CRUD is defined to manage a database by defining the methods **Create, Read, Update, Delete**.
/// This crud connects to a [PostgreSQLConnection] using the [DotEnv] lib to handle the parameters saved to [.env_postgresql].
/// All defined operations return a mapped database response used to reconstruct the found [DbObject]'s.
/// Look into the database tests like [postgres_test.dart] or defined [DataProvider] for better understanding.
///
/// The methods often use [DbObject.toJsonMap] to extract the [DbObject] variables and their content
/// to a format that is usable for the sql-requests.
///
/// ## Usage
/// It is recommended to never directly use this [DbCrud] outside of a [DataProvider].
class DbCrud {
  static final DbCrud instance = DbCrud._init(
      PostgreSQLConnection(
          "ec2-34-247-72-29.eu-west-1.compute.amazonaws.com",
          5432,
          "dgdob5fr7i8io",
          username: "kyfrrzmlxuxpzl",
          password: "bf33dbc056e5dbdb3dd731373035b0d09d7272e1a8c74adc0ebf8d99108d86dd",
          useSSL: true)
  );

  final PostgreSQLConnection _connection;

  DbCrud._init(this._connection);

  /// Provides the database connection or opens it if needed.
  ///
  /// Dont miss-use it and go for already defined operations if possible.
  Future<PostgreSQLConnection> get connection async {
    if (_connection.isClosed) {
      debugPrint("DbCrud: try to open connection");
      await _connection.open()
          .then((value) => debugPrint('DbCrud: connection opened'))
          .onError((error, stackTrace) => debugPrint('$error: $stackTrace'));
    }

    // debugPrint("DbCrud: connection returned");
    return _connection;
  }

  get isClosed => _connection.isClosed;

  /// Saves a provided [DbObject] to the defined [table] of the connected database.
  ///
  /// It saves [DbObject] to the database by ignoring the [DbObject.id]
  /// and using all other values to create a new entry in the [table].
  /// The [id] gets auto-generated.
  /// The new [DbObject] gets returned in the response.
  Future<List<Map<String, Map<String, dynamic>>>> create(String table, DbObject dbObject, {String? view}) async {
    Map<String, dynamic> jsonMap = dbObject.toJsonMap();
    jsonMap.remove("${table}_id");

    String variables = jsonMap.keys.toString();
    String values = jsonMap.values.toString();

    return (await connection).mappedResultsQuery(
        'INSERT INTO "$table"$variables VALUES $values RETURNING * ');
  }

  /// Searches for a specified entry in a database [table] by [id].
  Future<List<Map<String, Map<String, dynamic>>>> read(String table, int id, {String? view}) async {
    view ??= table;
    return (await connection).mappedResultsQuery('SELECT * FROM "$view" WHERE ${table}_id = $id');
  }

  /// Returns all entries in the defined [tableOrView].
  Future<List<Map<String, Map<String, dynamic>>>> readAll(String tableOrView) async {
    return (await connection).mappedResultsQuery('SELECT * FROM "$tableOrView"');
  }

  /// Adjusts a [table] entry found for the [DbObject.id].
  Future<List<Map<String, Map<String, dynamic>>>> update(String table, DbObject dbObject) async {
    return (await connection).mappedResultsQuery(
        'UPDATE "$table"'
            'SET ${dbObject.toJson()}'
            'WHERE ${table}_id = ${dbObject.id}'
            'RETURNING *');
  }

  /// Removes the [table] entry with the specified [id].
  Future<List<Map<String, Map<String, dynamic>>>> delete(String table, int id) async {
    return (await connection).mappedResultsQuery('DELETE from "$table" WHERE ${table}_id = $id RETURNING *');
  }
}
