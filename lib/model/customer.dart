import 'package:beerbox/model/db_object.dart';

class Customer extends DbObject {

  final String name;

  Customer(int? id, this.name) : super(id);

  @override
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      json["_id"] as int,
      json["name"] as String);

  @override
  Map<String, dynamic> toJsonMap() => {
    '_id': id,
    'name': "'$name'",
  };
}