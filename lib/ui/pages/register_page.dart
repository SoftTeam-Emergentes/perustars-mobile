import 'dart:math';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peru_stars_mobile/main.dart';
import 'package:peru_stars_mobile/ui/pages/login_page.dart';
import 'package:peru_stars_mobile/ui/pages/privacy_policy_page.dart';
import 'package:peru_stars_mobile/ui/pages/terms_and_conditions_page.dart';
import 'package:peru_stars_mobile/ui/widgets/login_background.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum UserType { artist, amateur }

class _RegisterPageState extends State<RegisterPage> {
  bool _agreeWithConditions = false;
  bool _loading = false;
  UserType? _userType = UserType.amateur;

  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: Stack(children: [
              CustomPaint(
                painter: LoginBackgroundSvg(),
                size: Size(
                    MediaQuery.of(context).size.width,
                    (MediaQuery.of(context).size.width * 0.6876712328767123)
                        .toDouble()),
              ),
              Transform.translate(
                offset: const Offset(25, 50),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: SvgPicture.asset(
                    'assets/logo_perustars.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ]),
          ),
          Transform.translate(
            offset: const Offset(0, -60),
            child: Center(
              child: SingleChildScrollView(
                controller: _scrollController,
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
                          'Regístrate',
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
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
                          height: 20,
                        ),
                        TextFormField(
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
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Repetir contraseña",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              child: Checkbox(
                                  value: _agreeWithConditions,
                                  onChanged: (isChecked) {
                                    setState(() {
                                      _agreeWithConditions = isChecked!;
                                    });
                                  }),
                            ),
                            // este widget es para forzar a que se respete el max ancho del padre (row
                            Expanded(
                              child: DefaultTextStyle(
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    const Text("Estoy de acuerdo "),
                                    const Text("con los "),
                                    InkWell(
                                      child: Text(
                                        "Términos y ",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onTap: () =>
                                          _showTermsAndConditions(context),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "Condiciones ",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onTap: () =>
                                          _showTermsAndConditions(context),
                                    ),
                                    const Text("y "),
                                    InkWell(
                                      child: Text(
                                        "Políticas ",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onTap: () => _showPrivacyPolicy(context),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "de Privacidad",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onTap: () => _showPrivacyPolicy(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     RadioListTile(
                        //       title: const Text('Artista'),
                        //       value: UserType.artist,
                        //       groupValue: _userType,
                        //       onChanged: (UserType? value) {
                        //         setState(() {
                        //           _userType = value;
                        //         });
                        //       },
                        //       activeColor: Colors.red,
                        //     ),
                        //     // RadioListTile(
                        //     //   title: const Text('Artista'),
                        //     //   value: UserType.artist,
                        //     //   groupValue: _userType,
                        //     //   onChanged: (UserType? value) {
                        //     //     setState(() {
                        //     //       _userType = value;
                        //     //     });
                        //     //   },
                        //     //   activeColor: Colors.red,
                        //     // )
                        //   ],
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => _register(context),
                          child: Text(
                            'Registrar',
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
                              '¿Ya tienes una cuenta?',
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Inicia Sesión',
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
          )
        ],
      ),
    );
  }

  void _register(BuildContext context) {
    // in the future this will be improved
    if ((!_loading || _loading) && _agreeWithConditions) {
      setState(() {
        _loading = true;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyHomePage()));
      });
    }
  }

  _showRegister(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  _showTermsAndConditions(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TermsAndConditionsPage()));
  }

  _showPrivacyPolicy(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
  }
}
