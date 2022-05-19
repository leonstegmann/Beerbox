import 'db_object.dart';

class CustomerTable extends DbObject<CustomerTable> {

  /// Normal Constructor with null as id as the id gets managed by the DB.
  CustomerTable() : super(null);

  /// Constructor used by the database in order to provide a replica of a database entity.
  CustomerTable._db(int id) : super(id);

  /// A constructor to hold the id as reference to a database entity.
  CustomerTable.reference(int id) : super(id);

  @override
  factory CustomerTable.fromJson(Map<String, dynamic> json) => CustomerTable._db(
      json["table_id"] as int);

  @override
  Map<String, dynamic> toJsonMap() => {
    'table_id': id,
  };
}