import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/common/helpers/get_it_helper.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/bloc.dart';

class NotificationButton extends StatelessWidget {
  NotificationButton({Key? key}) : super(key: key);


  final NotificationListBloc notificationListBloc = getIt<NotificationListBloc>();


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications),
      onPressed: () {
        if(notificationListBloc.state is VisibleNotificationListState) {
          notificationListBloc.add(HideNotificationListEvent());
          return;
        }
        if(notificationListBloc.state is HiddenNotificationListState) {
          notificationListBloc.add(ToggleNotificationListEvent(artistId: BigInt.from(5)));
        }
      }
    );
  }

}