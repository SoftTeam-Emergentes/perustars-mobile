import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart' as n;

class NotificationList extends StatelessWidget {
  const NotificationList(this.notifications, {Key? key}) : super(key: key);

  final List<n.Notification> notifications;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(notifications[index].title),
          subtitle: Text(notifications[index].description)
        );
      }
    );
  }

}