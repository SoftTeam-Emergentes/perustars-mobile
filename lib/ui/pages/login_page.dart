import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/services/mini-storage.dart' as storage;
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peru_stars_mobile/main.dart';
import 'package:peru_stars_mobile/models/user.dart';
import 'package:peru_stars_mobile/services/artists-api.service.dart';
import 'package:peru_stars_mobile/services/hobbyists-api.service.dart';
import 'package:peru_stars_mobile/services/users-api.service.dart';
import 'package:peru_stars_mobile/ui/pages/profile_page.dart';
import 'package:peru_stars_mobile/ui/pages/register_page.dart';
import 'package:peru_stars_mobile/ui/widgets/login_background.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(colors: [Colors.red, Colors.red])),
            child: Stack(
              children: [
                CustomPaint(
                  painter: LoginBackgroundSvg(),
                  size: Size(
                      MediaQuery.of(context).size.width,
                      (MediaQuery.of(context).size.width * 0.6876712328767123)
                          .toDouble()),
                ),
                Transform.translate(
                  offset: const Offset(25, 50),
                  child: SvgPicture.asset(
                    'assets/logo_perustars.svg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -60),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 260, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Iniciar Sesión',
                            style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@') ||
                                  value.startsWith('@') ||
                                  value.endsWith('@') ||
                                  value.length < 3) {
                                return 'Por favor ingrese su correo electrónico';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Correo",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su contraseña';
                              }
                              if (value.length < 8) {
                                return 'Debe tener mínimo 8 caracteres';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () => _login(context),
                            child: Text(
                              'Ingresar',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPrimary: Colors.white,
                                fixedSize: const Size(160, 56),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 17)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '¿No tienes una cuenta?',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  'Registrarse',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () => _showRegister(context),
                                style: TextButton.styleFrom(
                                  // Text color
                                  primary: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    // in the future this will be improved

    if (!_loading) {
      _loading = true;

      if (!_formKey.currentState!.validate()) {
        _loading = false;
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Iniciando sesión...'),
              SizedBox(
                width: 100,
              ),
              SizedBox(
                child: CircularProgressIndicator(),
                width: 20,
                height: 20,
              ),
            ],
          ),
          duration: const Duration(seconds: 100),
        ),
      );

      final User userDataFromUi = User(
          username: _usernameController.text,
          password: _passwordController.text);

      log('input: ' + userDataFromUi.toMap().toString());

      dynamic response = await UserApiService().login(userDataFromUi);
      log(response);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (response.statusCode == 200) {
        _nextPageAfterLogin(context, response.data["id"]);
      }
      _loading = false;
      return;
    }
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

  _showRegister(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}
