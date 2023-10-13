import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:peru_stars_mobile/ui/pages/artwork_page.dart';
import 'package:peru_stars_mobile/ui/pages/favorites_page.dart';
import 'package:peru_stars_mobile/ui/pages/home_amateur.dart';
import 'package:peru_stars_mobile/ui/pages/search_page.dart';
import 'package:peru_stars_mobile/ui/widgets/NavBar.dart';
import 'package:peru_stars_mobile/ui/widgets/SideBar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  //Se llaman las paginas a mostrar
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget _showPage = new HomeAmateur();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return new HomeAmateur();
      case 1:
        return new SearchPage();
      case 2:
        return new FavoritesPage();
        break;
      default:
        return Center(child: Text("Próximamente"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      drawer: SideBar(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite_outline_outlined, size: 30),
          Icon(Icons.calendar_today_outlined, size: 26),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.red,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
