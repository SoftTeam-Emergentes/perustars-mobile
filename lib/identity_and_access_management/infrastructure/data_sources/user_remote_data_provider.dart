import 'dart:developer';
import 'dart:ffi';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/UserModel.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/logInUserModel.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as storage;
class UserRemoteProvider extends HttpCommon{
  UserRemoteProvider();
  Future<Response> registerUser(UserModel userModel)async{
      Response response = await post("/api/v1/users/register", userModel.toJson());
      log("Response from Register user data provider");
      log(response.toString());
      return response;
  }

  Future<Response>logIn(LogInUserModel model)async{
      Response response= await post("/api/v1/users/login",model.toJson());
      return response;
  }
}