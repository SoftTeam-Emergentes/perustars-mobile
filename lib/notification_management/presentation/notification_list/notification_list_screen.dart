import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/common/config/dependency_inyection.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/bloc.dart';
import 'package:peru_stars_mobile/notification_management/presentation/widgets/notification_list.dart';


class NotificationListScreenWidget extends StatelessWidget {
  const NotificationListScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationListBloc>(
      create: (context) => DependencyInjectionProvider.instance().injectInstance<NotificationListBloc>(),
      child: BlocBuilder<NotificationListBloc, NotificationListState>(
        builder: (BuildContext context, NotificationListState state) {
          if(state is VisibleNotificationListState) {
            return Positioned(
              top: 10.0,
              right: 10.0,
              child: NotificationList(state.notifications)
            );
          }
          return Container();
        }
      )
    );
  }

}