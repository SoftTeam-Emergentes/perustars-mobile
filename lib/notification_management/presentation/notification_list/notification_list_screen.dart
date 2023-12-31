import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/common/helpers/get_it_helper.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/bloc/bloc.dart';
import 'package:peru_stars_mobile/notification_management/presentation/widgets/notification_button.dart';
import 'package:peru_stars_mobile/notification_management/presentation/widgets/notification_list.dart';


class NotificationListScreenWidget extends StatelessWidget {
  const NotificationListScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationButton(),
        BlocProvider<NotificationListBloc>(
          create: (context) => getIt<NotificationListBloc>(),
          child: BlocBuilder<NotificationListBloc, NotificationListState>(
            builder: (BuildContext context, NotificationListState state) {
              if(state is VisibleNotificationListState) {
                return NotificationList(state.notifications);
              }
              return Container();
            }
          )
        )
      ],
    );
  }

}