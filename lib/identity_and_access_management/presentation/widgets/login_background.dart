import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoginBackgroundSvg extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2356164, size.height * 0.5417649);
    path_0.cubicTo(
        size.width * 0.06164384,
        size.height * 1.149335,
        size.width * 0.1851397,
        size.height * 0.9760279,
        size.width * -0.3452055,
        size.height * 0.9760279);
    path_0.cubicTo(
        size.width * -0.1068493,
        size.height * 0.3067052,
        size.width * -0.2149753,
        size.height * 0.6548327,
        size.width * -0.2149753,
        size.height * 0.2851753);
    path_0.cubicTo(
        size.width * -0.2149753,
        size.height * -0.08447809,
        size.width * 0.3997918,
        size.height * -0.06972112,
        size.width * 0.9301370,
        size.height * -0.06972112);
    path_0.cubicTo(
        size.width * 1.242466,
        size.height * 0.6772908,
        size.width * 0.3958904,
        size.height * 0.07164542,
        size.width * 0.2356164,
        size.height * 0.5417649);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xffFFB2A1).withOpacity(1),
          Color(0xffFF1414).withOpacity(1)
        ]).createShader(Offset.zero & size);

    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
