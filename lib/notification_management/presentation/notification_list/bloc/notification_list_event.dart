import 'package:equatable/equatable.dart';

abstract class NotificationListEvent extends Equatable {
  const NotificationListEvent();
}

class ToggleNotificationListEvent extends NotificationListEvent {

  const ToggleNotificationListEvent({ this.artistId, this.hobbyistId });

  final BigInt? artistId;
  final BigInt? hobbyistId;
  @override
  List<Object?> get props => [];

}

class HideNotificationListEvent extends NotificationListEvent {
  @override
  List<Object?> get props => [];
}