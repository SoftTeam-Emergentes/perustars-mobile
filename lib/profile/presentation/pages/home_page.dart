import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/ui/widgets/BottomBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
    /*Scaffold(
      //drawer: SideBar(),

      //bottomNavigationBar: BottomNavBar(),
      //body: ArtworkPage(),


    );*/
  }
}
