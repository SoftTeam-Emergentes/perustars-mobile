import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/services/artists-api.service.dart';
import 'package:peru_stars_mobile/services/hobbyists-api.service.dart';
import 'package:peru_stars_mobile/services/mini-storage.dart' as storage;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peru_stars_mobile/ui/pages/home_page.dart';
import 'package:peru_stars_mobile/ui/pages/login_page.dart';
import 'package:peru_stars_mobile/ui/pages/profile_page.dart';
import 'ui/widgets/BottomBar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0XFF232323),
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0XFF232323),
          ),
          headline4: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.red[300],
          ),
          headline5: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFFB7B7D2),
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Color(0XFFB7B7D2),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    storage.read('username').then((username) {
      if (username != null && username.isNotEmpty) {
        storage.read('userId').then((userId) {
          log("user storaged: username -> $username, userId -> $userId");
          if (userId != null && userId.isNotEmpty) {
            _nextPageAfterLogin(context, int.parse(userId));
          } else {
            log("no está logueado");
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          }
        });
      } else {
        log("no está logueado");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/background-splash.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Transform.translate(
            offset: const Offset(0, 200),
            child: Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                width: 40,
                height: 40,
              ),
            )),
      ],
    );
  }

  _nextPageAfterLogin(BuildContext context, int userId) async {
    bool typeOfUserIdentified = false;

    await HobbyistsApiService().getByUserId(userId).then((response) {
      if (response.statusCode == 200) {
        log('hobbyist: ' + response.data.toString());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyHomePage()));
        typeOfUserIdentified = true;
      } else {
        log("Error getting hobbyist: ${response.statusCode}");
      }
    });

    if (typeOfUserIdentified) return;

    await ArtistsApiService().getByUserId(userId).then((response) {
      if (response.statusCode == 200) {
        log('artist: ' + response.data.toString());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ProfilePage()));
        return;
      } else {
        log("Error getting artist: ${response.statusCode}");
      }
    });
  }
}
