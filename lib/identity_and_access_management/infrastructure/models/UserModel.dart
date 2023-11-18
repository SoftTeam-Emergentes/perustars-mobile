import 'package:peru_stars_mobile/identity_and_access_management/domain/entities/User.dart';

class UserModel extends User{
  UserModel({
    required String firstName, required String lastName,required String email,required String password,
  }):super( firstName:firstName, lastName:lastName, email:email, password: password);
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(firstName:json['firstName'], lastName: json['lastName'], email: json['email'], password: json['password']);
  }
  Map<String,dynamic> toJson(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'password':password
    };
  }
}