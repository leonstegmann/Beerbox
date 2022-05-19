import 'package:beerbox/model/db_object.dart';

class Customer extends DbObject<Customer> {

  String firstName;
  String familyName;

  Customer(int? id, this.firstName, this.familyName) : super(id);

  Customer.reference(int id) : firstName = "", familyName = "", super(id);

  @override
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      json["customer_id"] as int,
      json["firstname"] as String,
      json["familyname"] as String);

  @override
  Map<String, dynamic> toJsonMap() => {
    'customer_id': id,
    'firstname': "'$firstName'",
    'familyname': "'$familyName'",
  };
}