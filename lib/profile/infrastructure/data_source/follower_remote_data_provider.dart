import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/follower_model.dart';

class FollowerDataProvider extends HttpCommon{
  FollowerDataProvider();
  Future<Response> followArtist(FollowerModel model)async{
    Response response= await post("/api/v1/followers", model.toCreateFollowerJson());
    log("Server response: "+response.toString());
    return response;
  }
  Future<Response> getFollowersByArtistId(int artistId)async{
    Response response= await get("/api/v1/followers/artist/"+artistId.toString());
    log("Server response: "+response.toString());
    return response;
  }
  Future<Response> deleteFollowerByHobbyistId(int hobbyistId)async{
    Response response= await delete("/api/v1/followers/hobbyist/"+hobbyistId.toString());
    log("Server response:"+response.toString());
    return response;
  }
  Future<Response> getFollowedArtistByHobbyistId(int hobbyistId)async{
    Response response= await get("/api/v1/followers/artist/hobbyist/"+hobbyistId.toString());
    log("Server response:" +response.toString());
    return response;
  }
}