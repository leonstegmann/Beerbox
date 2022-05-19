import 'db_object.dart';

class CustomerTable extends DbObject<CustomerTable> {

  CustomerTable(int? id) : super(id);

  CustomerTable.reference(int id) : super(id);

  @override
  factory CustomerTable.fromJson(Map<String, dynamic> json) => CustomerTable(
      json["table_id"] as int);

  @override
  Map<String, dynamic> toJsonMap() => {
    'table_id': id,
  };
}