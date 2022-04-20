abstract class DbObject {

  final int? id;

  DbObject(this.id);

  factory DbObject.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(); // Override!
  }

  Map<String, dynamic> toJsonMap();
}