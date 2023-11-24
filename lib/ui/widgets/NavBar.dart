import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/notification_management/presentation/notification_list/notification_list_screen.dart';
import 'package:peru_stars_mobile/notification_management/presentation/widgets/notification_button.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "PeruStars",
        style: Theme.of(context).textTheme.headline1,
      ),
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(7),
              child: FloatingActionButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: ClipOval(
                  child:Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/d/d1/CARLOS-WARD-PERFIL.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
        const NotificationListScreenWidget()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}