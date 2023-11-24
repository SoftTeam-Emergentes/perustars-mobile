import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/art_event_model.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as miniStorage;

class ArtEventRemoteProvider extends HttpCommon {
  ArtEventRemoteProvider();


  Future<List<ArtEventModel>> getAllArtEvents() async {
    String token = await miniStorage.readAsync("token");
    Response response = await get("/api/v1/art-events", token: token);
    List<dynamic> data = response.data;
    List<ArtEventModel> result = [];
    for(dynamic jsonModel in data) {
      result.add(ArtEventModel.fromJson(jsonModel));
    }
    print(result);
    print(response.data);
    return result;
  }
  Future<String> registerNewArtEvent(ArtEventModel model) async {
    String token = await miniStorage.readAsync("token");
    Response<String> response = await post<String>("/api/v1/art-events", model.toJson(), token: token);
    return response.data;
  }
  Future<ArtEventModel> getArtEventById(BigInt artEventId) async {
    String token = await miniStorage.readAsync("token");
    Response<ArtEventModel> response = await get<ArtEventModel>("/api/v1/art-events/$artEventId", token: token);
    return response.data;
  }
  Future<String> startArtEvent(BigInt artEventId) async {
    String token = await miniStorage.readAsync("token");
    Response<String> response = await patch<String>("/api/v1/art-events/$artEventId/start", null, token: token);
    return response.data;
  }
  Future<String> cancelArtEvent(BigInt artEventId) async {
    String token = await miniStorage.readAsync("token");
    Response<String> response = await patch<String>("/api/v1/art-events/$artEventId/cancel", null, token: token);
    return response.data;
  }
  Future<String> deleteArtEvent(BigInt artEventId) async {
    String token = await miniStorage.readAsync("token");
    Response<String> response = await delete<String>("/api/v1/art-events/$artEventId", token: token);
    return response.data;
  }
}