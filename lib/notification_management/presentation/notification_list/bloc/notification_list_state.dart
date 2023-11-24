import 'package:equatable/equatable.dart';
import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart';

abstract class NotificationListState extends Equatable {
  const NotificationListState();
}

class InitialNotificationListState extends NotificationListState {
  @override
  List<Object?> get props => [];
}

class VisibleNotificationListState extends NotificationListState {

  const VisibleNotificationListState({ required this.notifications });

  final List<Notification> notifications;

  @override
  List<Object?> get props => throw [];

}

class HiddenNotificationListState extends NotificationListState {
  const HiddenNotificationListState();
  
  @override
  List<Object?> get props => [];
}