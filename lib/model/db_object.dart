abstract class DbObject<T extends DbObject<T>> {

  final int? id;

  DbObject(this.id);

  factory DbObject.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(); // Override!
  }

  Map<String, dynamic> toJsonMap();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is T &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  String toJson() {
    return toJsonMap()
        .toString()
        .replaceAll(':', ' =')
        .replaceAll('{', '')
        .replaceAll('}', '');
  }
}