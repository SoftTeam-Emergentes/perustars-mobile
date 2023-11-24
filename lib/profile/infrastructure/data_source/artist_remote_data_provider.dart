import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/artist_model.dart';
class ArtistRemoteDataProvider extends HttpCommon{
  ArtistRemoteDataProvider();
  Future<Response> createArtist(ArtistModel model)async{
    Response response=await post("/api/v1/artists", model.toJson());
    log("Creating artist with the given information: "+model.toString());
    return response;
  }
  Future<Response> getAllArtist()async{
    Response response=await get("/api/v1/artists");
    log("Response: "+response.toString());
    return response;
  }
  Future<Response> getArtistByArtistId(int id)async{
    Response response=await get("/api/v1/artists/"+id.toString());
    log("Server's response:"+response.toString());
    return response;
  }
  Future<Response> deleteArtistById(int id)async{
    Response response= await delete("/api/v1/artists/"+id.toString());
    log("Server response:" +response.toString());
    return response;
  }
}