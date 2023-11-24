import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart';

abstract class NotificationInterface {
  Future<List<Notification>> getAllNotificationsByArtistId(BigInt artistId);
  Future<List<Notification>> getAllNotificationsByHobbyistId(BigInt hobbyistId);
}