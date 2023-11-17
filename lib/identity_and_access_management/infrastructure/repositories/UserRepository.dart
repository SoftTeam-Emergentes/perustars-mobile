import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:peru_stars_mobile/identity_and_access_management/domain/entities/User.dart';
import 'package:peru_stars_mobile/identity_and_access_management/domain/interfaces/UserInterface.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as storage;
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/data_sources/user_remote_data_provider.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/UserModel.dart';
import 'package:peru_stars_mobile/identity_and_access_management/infrastructure/models/logInUserModel.dart';
class UserRepository implements UserInterface {
  UserRepository(){
    _userRemoteDataProvider=UserRemoteProvider();
  }
  late final UserRemoteProvider _userRemoteDataProvider;

  @override
  Future<bool> logIn(String email, String password) async {

      try{
        LogInUserModel model=LogInUserModel(email: email,password: password);
        Response response=await _userRemoteDataProvider.logIn(model);
        log(response.toString());
        await storage.writeAsync('token', response.data['token']);
        return true;
      }catch(e){
        log("Something went wrong in LogIn! Error: "+e.toString());
        return false;
      }

  }

  @override
  Future<bool> register(String firstName, String lastName, String email, String password) async{

    try{
      UserModel user=UserModel(firstName: firstName, lastName: lastName, email: email, password: password );
      Response response=await _userRemoteDataProvider.registerUser(user);
      log("Response from UserRepository: "+response.toString());
      return true;
    }catch(e){
      log("Something went wrong, error: $e.toString()");
      return false;
    }
  }

  @override
  Future<void> update(int id, String firstName, String lastName) {
    // TODO: implement update
    throw UnimplementedError();
  }

}