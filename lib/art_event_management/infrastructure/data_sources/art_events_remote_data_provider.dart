import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/art_event_model.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as miniStorage;

class ArtEventRemoteProvider extends HttpCommon {
  ArtEventRemoteProvider();
  
  final String _token = miniStorage.read("token") as String;

  Future<List<ArtEventModel>> getAllArtEvents() async {
    Response<List<ArtEventModel>> response = await get<List<ArtEventModel>>("/api/v1/art-events", token: _token);
    return response.data;
  }
  Future<String> registerNewArtEvent(ArtEventModel model) async {
    Response<String> response = await post<String>("/api/v1/art-events", model.toJson(), token: _token);
    return response.data;
  }
  Future<ArtEventModel> getArtEventById(Long artEventId) async {
    Response<ArtEventModel> response = await get<ArtEventModel>("/api/v1/art-events/$artEventId", token: _token);
    return response.data;
  }
  Future<String> startArtEvent(Long artEventId) async {
    Response<String> response = await patch<String>("/api/v1/art-events/$artEventId/start", null, token: _token);
    return response.data;
  }
  Future<String> cancelArtEvent(Long artEventId) async {
    Response<String> response = await patch<String>("/api/v1/art-events/$artEventId/cancel", null, token: _token);
    return response.data;
  }
  Future<String> deleteArtEvent(Long artEventId) async {
    Response<String> response = await delete<String>("/api/v1/art-events/$artEventId", token: _token);
    return response.data;
  }
}