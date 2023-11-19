import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/notification_management/infrastructure/models/notification_model.dart';

class NotificationRemoteDataProvider extends HttpCommon {
  Future<List<NotificationModel>> getAllNotificationsByArtistId(BigInt artistId) async {
    Response<List<NotificationModel>> response = await get<List<NotificationModel>>("/api/v1/artists/$artistId/notifications");
    return response.data;
  }
  Future<List<NotificationModel>> getAllNotificationsByHobbyistId(BigInt hobbyistId) async {
    Response<List<NotificationModel>> response = await get<List<NotificationModel>>("/api/v1/hobbyists/$hobbyistId/notifications");
    return response.data;
  }
}