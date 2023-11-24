import 'package:peru_stars_mobile/common/exceptions/exceptions.dart';
import 'package:peru_stars_mobile/common/utils/http_status.dart';
import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart';
import 'package:peru_stars_mobile/notification_management/domain/interfaces/notification_interface.dart';
import 'package:peru_stars_mobile/notification_management/infrastructure/data_sources/notification_remote_data_provider.dart';

class NotificationRepository implements NotificationInterface {

  NotificationRepository({ required NotificationRemoteDataProvider notificationRemoteDataProvider }) {
    _notificationRemoteDataProvider = notificationRemoteDataProvider;
  }
  

  late final NotificationRemoteDataProvider _notificationRemoteDataProvider;

  @override
  Future<List<Notification>> getAllNotificationsByArtistId(BigInt artistId) async {
    try {
      List<Notification> notifications = await _notificationRemoteDataProvider.getAllNotificationsByArtistId(artistId);
      return notifications;
    }catch(e) {
      throw ServerException("Something went wrong when retrieving notifications by artist Id. Details: $e", HttpStatus.fromStatusCode(500));
    }
  }

  @override
  Future<List<Notification>> getAllNotificationsByHobbyistId(BigInt hobbyistId) async {
    try {
      List<Notification> notifications = await _notificationRemoteDataProvider.getAllNotificationsByHobbyistId(hobbyistId);
      return notifications;
    }catch(e) {
      throw ServerException("Something went wrong when retrieving notifications by hobbyist Id. Details: $e", HttpStatus.fromStatusCode(500));
    }
  }

}