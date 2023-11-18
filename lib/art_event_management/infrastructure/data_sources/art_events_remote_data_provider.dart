import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/art_event_model.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';

class ArtEventRemoteProvider extends HttpCommon {
  ArtEventRemoteProvider();

  Future<List<ArtEventModel>> getAllArtEvents() async {
    Response<List<ArtEventModel>> response = await get<List<ArtEventModel>>("/api/v1/art-events");
    return response.data;
  }
  Future<String> registerNewArtEvent(ArtEventModel model) async {
    Response<String> response = await post<String>("/api/v1/art-events", model.toJson());
    return response.data;
  }
  Future<ArtEventModel> getArtEventById(Long artEventId) async {
    Response<ArtEventModel> response = await get<ArtEventModel>("/api/v1/art-events/$artEventId");
    return response.data;
  }
  Future<String> startArtEvent(Long artEventId) async {
    Response<String> response = await patch<String>("/api/v1/art-events/$artEventId/start", null);
    return response.data;
  }
  Future<String> cancelArtEvent(Long artEventId) async {
    Response<String> response = await patch<String>("/api/v1/art-events/$artEventId/cancel", null);
    return response.data;
  }
  Future<String> deleteArtEvent(Long artEventId) async {
    Response<String> response = await delete<String>("/api/v1/art-events/$artEventId");
    return response.data;
  }
}