import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();

Future<void> writeAsync(String key, dynamic value) async {
  return await storage.write(key: key, value: value);
}

Future<dynamic> readAsync(String key) async {
  return await storage.read(key: key);
}

dynamic read(String key) {
  return storage.read(key: key);
}

Future<dynamic> delete(String key) async {
  return await storage.delete(key: key);
}

Future<dynamic> deleteAllAsync() async {
  return await storage.deleteAll();
}
