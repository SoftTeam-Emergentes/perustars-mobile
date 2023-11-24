import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart';
import 'package:peru_stars_mobile/notification_management/infrastructure/models/notification_model.dart';

class NotificationRemoteDataProvider extends HttpCommon {
  Future<List<NotificationModel>> getAllNotificationsByArtistId(BigInt artistId) async {
    
    Response response = await get("/api/v1/artists/$artistId/notifications");
    List<dynamic> data = response.data;
    List<NotificationModel> result = [];
    for(dynamic jsonModel in data) {
      result.add(NotificationModel.fromJson(jsonModel));
    }
    return result;
  }
  Future<List<NotificationModel>> getAllNotificationsByHobbyistId(BigInt hobbyistId) async {
    Response response = await get("/api/v1/hobbyists/$hobbyistId/notifications");
    print("Notifications by hobbyist id: ${response.data}");
    List<dynamic> data = response.data;
    List<NotificationModel> result = [];
    for(dynamic jsonModel in data) {
      result.add(NotificationModel.fromJson(jsonModel));
    }
    return result;
  }
}