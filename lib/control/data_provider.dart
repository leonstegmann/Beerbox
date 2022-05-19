import 'package:beerbox/control/db_crud.dart';

/// An instance to hold a [DbCrud] and provide easy to use methods to interact with it.
///
/// This [T] is a Generic to represent the [DbObject] specializing the extending variations of this DataProvider.
/// The [tableName] has to match with a table in the connected database.
///
/// The specialized DataProvider should use [T.fromJson] to extract the objects from the mapped sql-responses.
///
/// ## Usage
/// Use the extending specializations of this class by instantiating them where needed.
/// The instances will not claim too many resources as the [DbCrud] is implemented as singleton.
abstract class DataProvider<T> {

  final DbCrud dbCrud = DbCrud.instance;
  String tableName;

  DataProvider(this.tableName);

  /// Writes a defined [DbObject] to the connected database and returns the created object.
  Future<T> create(T dbObject);

  /// Searches for the specialized [DbObject] in the equivalent database table and returns the entry with the given [id].
  Future<T> read(int id);

  /// Returns all entries from the database table of the specialized [DbObject].
  Future<List<T>> readAll();

  /// Adjusts the database entry with the same id as the [DbObject.id].
  update(T dbObject);

  /// Removes the database entry with the given [id] from the specialized [table].
  delete(int id);
}

class DbEntryNotFoundException implements Exception {

  final String _table;
  final int _id;

  DbEntryNotFoundException(this._table, this._id);

  @override
  String toString() {
    return 'DbEntryNotFoundException: $_table with id: $_id not found.';
  }
}