import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/hobbyist_model.dart';

class HobbyistDataProvider extends HttpCommon{
  HobbyistDataProvider();
  Future<Response> createHobbyist(HobbyistModel model)async{
    Response response= await post("/api/v1/hobbyists", model.toCreateHobbyistJson());
    log("Server response:"+response.toString());
    return response;
  }
  Future<Response> getHobbyistById(int id)async{
    Response response= await get("/api/v1/hobbyists/"+id.toString());
    log("Server response:" +response.toString());
    return response;
  }
  Future<Response> deleteHobbyistById(int id)async{
    Response response= await get("/api/v1/hobbyists/"+id.toString());
    log("Server response:"+response.toString());
    return response;
  }
  Future<Response> getHobbyistByUserId(int userId) async {
    Response response = await get("/api/v1/hobbyists/user/$userId");
    log("Server response:"+response.toString());
    return response;
  }
}