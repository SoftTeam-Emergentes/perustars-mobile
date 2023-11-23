import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:jwt_decode/jwt_decode.dart';
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

  Future<void> _decodeTokenAndSaveData(String token) async {
    print("Token: $token");
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    String sid = decodedToken["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/sid"];
    String email = decodedToken["email"];
    String uniqueName = decodedToken["unique_name"];
    String nameId = decodedToken["nameid"];
    String role = decodedToken["role"];
    await storage.writeAsync("userId", sid);
    await storage.writeAsync("email", email);
    await storage.writeAsync("fullName", uniqueName);
    await storage.writeAsync("userType", role);
    if(role == "Hobbyist") {
      await storage.writeAsync("hobbyistId", nameId);
      return;
    }
    if(role == "Artist") {
      await storage.writeAsync("artistId", nameId);
      return;
    }
  }

  @override
  Future<bool> logIn(String email, String password) async {

      try{
        LogInUserModel model=LogInUserModel(email: email,password: password);
        log("Sending data"+model.toString());
        Response response=await _userRemoteDataProvider.logIn(model);
        log("Server response: "+response.toString());
        String token = response.data['token'];
        await storage.writeAsync('token', response.data['token']);
        await _decodeTokenAndSaveData(token);
        return true;
      }catch(e){
        log("Something went wrong in LogIn! Error: "+e.toString());
        print("Something went wrong in LogIn! Error: "+e.toString());
        return false;
      }

  }

  @override
  Future<bool> register(String firstName, String lastName, String email, String password) async{

    try{
      UserModel user=UserModel(firstName: firstName, lastName: lastName, email: email, password: password );
      Response response=await _userRemoteDataProvider.registerUser(user);
      log("Response from UserRepository: "+response.toString());
      print(response.data);
      await storage.writeAsync('temp-userId', response.data['userId'].toString());
      return true;
    }catch(e){
      log("Something went wrong, error: $e.toString()");
      print("Something went wrong, error: $e.toString()");
      return false;
    }
  }

  @override
  Future<void> update(int id, String firstName, String lastName) {
    // TODO: implement update
    throw UnimplementedError();
  }

}