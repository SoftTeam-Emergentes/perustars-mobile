import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart';

class NotificationModel extends Notification {
  NotificationModel({
    BigInt? id,
    required String title,
    required String description,
    required String notificationSender,
    required BigInt artistId,
    required BigInt hobbyistId,
    DateTime? sentAt,
    bool isRead = false,
    bool collected = false

  }) : super(id: id, title: title, description: description,
  notificationSender: notificationSender, artistId: artistId,
  hobbyistId: hobbyistId, sentAt: sentAt, isRead: isRead, collected: collected);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(id: json["id"], title: json["title"], description: json["description"],
    notificationSender: json["notificationSender"], artistId: json["artistId"], hobbyistId: json["hobbyistId"],
    sentAt: json["sentAt"], isRead: json["isRead"], collected: json["collected"]);
  }  
}