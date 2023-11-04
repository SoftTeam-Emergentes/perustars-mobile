// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

import 'mini-storage.dart' as storage;
import 'http-common.dart' as http;

import 'package:peru_stars_mobile/models/user.dart';

class UserApiService {
  // REGISTER
  Future<Response> registerUser(User userData) async {
    Response response =
        await http.post('/users', userData.toMap(), 'RegisterUser');
    return response;
  }

  // LOGIN
  Future<Response> login(User userData) async {
    Response response =
        await http.post('/users/authenticate', userData.toMap(), 'LoginUser');

    if (response.statusCode == 200) {
      await storage.writeAsync('userId', response.data["id"].toString());
      await storage.writeAsync('username', response.data["username"]);
      await storage.writeAsync('token', response.data["token"]);
    }
    return response;
  }
}
