// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

import 'http-common.dart' as http;

class HobbyistsApiService {
  Future<Response> getByUserId(int userId) async {
    Response response =
        await http.get('/hobbyists/user/$userId', 'GetHobbyistByUserId');
    return response;
  }
}
