import 'package:beerbox/controll/db_crud.dart';

/// An instance to hold a [DbCrud] and provide easy to use methods to interact with it.
///
/// This [T] is a Generic to represent the [DbObject] specializing the extending variations of this DataProvider.
/// The [tableName] has to match with a table in the connected database.
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
  Future<T> update(T dbObject);

  /// Removes the database entry with the given [id] from the specialized [table].
  Future<T> delete(int id);
}