import 'dart:ffi';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/UserModel.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/logInUserModel.dart';

class UserRemoteProvider extends HttpCommon{
  UserRemoteProvider();
  Future<bool> registerUser(UserModel userModel)async{
    try {
      Response<dynamic> response = await post<dynamic>("/api/v1/users/register", userModel.toJson());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error en la solicitud: $e");
      return false;
    }
  }

  Future<String?>logIn(LogInUserModel model)async{
    try{
      Response<dynamic> response= await post<String>("/api/v1/users/login",model.toJson());
      if(response.statusCode==200){
        final Map<String, dynamic> responseData = response.data;
        final String? token = responseData['token'];
        return token;
      }
    }catch(e){
      print("Error en la solicitud: $e");
    }
  }
}