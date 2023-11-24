import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as miniStorage;
import 'package:peru_stars_mobile/common/helpers/get_it_helper.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/bloc.dart';

class NotificationButton extends StatelessWidget {
  NotificationButton({Key? key}) : super(key: key);


  final NotificationListBloc notificationListBloc = getIt<NotificationListBloc>();
  late final BigInt hobbyistId;

  Future<void> getHobbyistId() async {
    String value = await miniStorage.readAsync("hobbyistId");
    hobbyistId = BigInt.parse(value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: getHobbyistId(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if(snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        return IconButton(
          icon: const Icon(Icons.notifications),
          color: Colors.redAccent,
          onPressed: () {
            print("Pressing button");
            if(notificationListBloc.state is VisibleNotificationListState) {
              notificationListBloc.add(HideNotificationListEvent());
              print("Hiding notification list");
              return;
            }
            if(notificationListBloc.state is HiddenNotificationListState ||
              notificationListBloc.state is InitialNotificationListState ) {
              print("Showing notification list");
              notificationListBloc.add(ToggleNotificationListEvent(hobbyistId: hobbyistId));
            }
          }
        );
      }
    );
  }

}