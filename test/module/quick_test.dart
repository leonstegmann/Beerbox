import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Quick Test', () async {

    Map testMap = {"id": 1, "name": "Dummy"};
    print(testMap.entries);
    print(testMap.keys);
    print(testMap.values);
    print(testMap.toString());
  });
}