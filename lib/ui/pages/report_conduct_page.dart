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

class ReportConductPage extends StatefulWidget {
  const ReportConductPage({Key? key}) : super(key: key);

  @override
  State<ReportConductPage> createState() => _ReportConductPageState();
}

enum UserType { artist, amateur }

class _ReportConductPageState extends State<ReportConductPage> {
  bool _submitReport = false;
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
                          'Report Conduct',
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: "Details",
                            prefixIcon: const Icon(Icons.text_fields),
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
                        ElevatedButton(
                          onPressed: () => _registerConduct(context),
                          child: Text(
                            'Submit report',
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

  void _registerConduct(BuildContext context) {
    // in the future this will be improved
      setState(() {
        _loading = true;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyHomePage()));
      });
  }
}
