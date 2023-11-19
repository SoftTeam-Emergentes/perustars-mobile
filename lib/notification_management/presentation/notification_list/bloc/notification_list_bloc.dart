import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/notification_management/application/notification_facade_service.dart';
import 'package:peru_stars_mobile/notification_management/domain/entities/notification.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/notification_list_event.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/notification_list_state.dart';

class NotificationListBloc extends Bloc<NotificationListEvent, NotificationListState> {
  NotificationListBloc({ required NotificationFacadeService notificationFacadeService }) : super(InitialNotificationListState()) {
    on<ToggleNotificationListEvent>(onToggleNotificationListEvent);
    on<HideNotificationListEvent>(onHideNotificationListEvent);
    _notificationFacadeService = notificationFacadeService;
  }

  late final NotificationFacadeService _notificationFacadeService;

  FutureOr<void> onToggleNotificationListEvent(ToggleNotificationListEvent event, Emitter<NotificationListState> emitter) async {
    List<Notification> notifications = [];
    if(event.artistId != null) {
      notifications = await _notificationFacadeService
      .fetchAllNotificationsByArtistId(event.artistId as BigInt);
    }
    emitter.call(VisibleNotificationListState(notifications: notifications));
  }

  FutureOr<void> onHideNotificationListEvent(HideNotificationListEvent event, Emitter<NotificationListState> emitter) {
    emitter.call(const HiddenNotificationListState());
  }
  
}