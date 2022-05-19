import 'package:beerbox/model/db_object.dart';

class Customer extends DbObject<Customer> {

  String firstName;
  String familyName;

  /// Normal Constructor with null as id as the id gets managed by the DB.
  Customer(this.firstName, this.familyName) : super(null);

  /// Constructor used by the database in order to provide a replica of a database entity.
  Customer._db(int id, this.firstName, this.familyName) : super(id);

  /// A constructor to hold the id as reference to a database entity.
  Customer.reference(int id) : firstName = "", familyName = "", super(id);

  @override
  factory Customer.fromJson(Map<String, dynamic> json) => Customer._db(
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