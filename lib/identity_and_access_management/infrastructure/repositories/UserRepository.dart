import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:peru_stars_mobile/identity_and_access_management/domain/interfaces/UserInterface.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/data_sources/user_remote_data_provider.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/logInUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserRepository implements UserInterface {
  UserRepository(){
    _userRemoteDataProvider=UserRemoteProvider();
  }
  late final UserRemoteProvider _userRemoteDataProvider;

  @override
  Future<bool> logIn(String email, String password) async {
    try{
      LogInUserModel model=LogInUserModel(email: email,password: password);
      String? response=await _userRemoteDataProvider.logIn(model);
      SharedPreferences prefs= await SharedPreferences.getInstance();
      await prefs.setString('token',response! );
      await prefs.setString('userId', 1 as String);
      return true;
    }catch(e){
      throw Exception("Something went wrong trying log in");
    }
  }

  @override
  Future<bool> register(String firstName, String lastName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> update(int id, String firstName, String lastName) {
    // TODO: implement update
    throw UnimplementedError();
  }

}