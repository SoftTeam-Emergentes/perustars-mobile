import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart';
import 'package:peru_stars_mobile/notification_management/domain/interfaces/notification_interface.dart';
import 'package:peru_stars_mobile/notification_management/infrastructure/repositories/notification_repository.dart';

class NotificationFacadeService {
  NotificationFacadeService({ required NotificationInterface notificationRepository }) {
    _notificationRepository = notificationRepository;
  }
  late final NotificationInterface _notificationRepository;

  Future<List<Notification>> fetchAllNotificationsByArtistId(BigInt artistId) async {
    return await _notificationRepository.getAllNotificationsByArtistId(artistId);
  }

  Future<List<Notification>> fetchAllNotificationsByHobbyistId(BigInt hobbyistId) async {
    return await _notificationRepository.getAllNotificationsByHobbyistId(hobbyistId);
  }
}