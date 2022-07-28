import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  OpenPainter(this.control);

  final double control;

  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;

    // Use this function to define the context in which you want it to be mapped
    mapping(
      double x, {
      double inMin = 0,
      double inMax = 150,
      double outMin = 0,
      required double outMax,
    }) {
      return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
    }

    var topInner = Paint()
      ..color = const Color(0xFF5E5D5C).withOpacity(
        mapping(control, outMax: 0.8),
      );
    var topOuter = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFF5E5D5C).withOpacity(
        mapping(control, outMax: 0.6),
      );

    var middleInner = Paint()
      ..color = const Color(0xFFc0888e).withOpacity(
        mapping(control, outMax: 0.8),
      );
    var middleOuter = Paint()
      ..color = const Color(0xFFc0888e).withOpacity(
        mapping(control, outMax: 0.6),
      )
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    var bottomOuter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = const Color(0xFF948B8C).withOpacity(
        mapping(control, outMax: 0.5),
      );

    var bottomInner = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 7
      ..color = const Color(0xFF948B8C).withOpacity(
        mapping(control, outMax: 0.9),
      );

    var hLines = Paint()
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF5E5D5C).withOpacity(
        mapping(control, outMax: 0.5),
      );

    canvas.drawCircle(Offset(center.width - 250 + control, center.height - 150),
        60, middleInner);

    canvas.drawCircle(Offset(center.width - 250 + control, center.height - 150),
        75, middleOuter);

    // Top Circle
    canvas.drawCircle(
        Offset(
          mapping(control,
              outMin: center.width + 200, outMax: center.width + 130),
          mapping(control,
              outMin: center.height - 450, outMax: center.height - 300),
        ),
        45,
        topInner);

    // Top Circle
    canvas.drawCircle(
        Offset(
          mapping(control,
              outMin: center.width + 200, outMax: center.width + 130),
          mapping(control,
              outMin: center.height - 450, outMax: center.height - 300),
        ),
        60,
        topOuter);

    // Lines going from down up
    // 1
    canvas.drawLine(
        Offset(
            mapping(control,
                outMin: center.width - 250, outMax: center.width - 140),
            center.height + 50),
        Offset(
            mapping(control,
                outMin: center.width - 170, outMax: center.width - 60),
            center.height + 50),
        hLines);

    // 2
    canvas.drawLine(
        Offset(
            mapping(control,
                outMin: center.width - 210, outMax: center.width - 100),
            center.height + 25),
        Offset(
            mapping(control,
                outMin: center.width - 130, outMax: center.width - 20),
            center.height + 25),
        hLines);

    // 3
    canvas.drawLine(
        Offset(
            mapping(control,
                outMin: center.width - 170, outMax: center.width - 60),
            center.height),
        Offset(
            mapping(control,
                outMin: center.width - 90, outMax: center.width + 20),
            center.height),
        hLines);

    // 4
    canvas.drawLine(
        Offset(
            mapping(control,
                outMin: center.width - 130, outMax: center.width - 20),
            center.height - 25),
        Offset(
            mapping(control,
                outMin: center.width - 50, outMax: center.width + 60),
            center.height - 25),
        hLines);

    // Code for the side rectangle
    final inner = Rect.fromCircle(
        center: Offset(
            mapping(control,
                outMin: center.width + 250, outMax: center.width + 222),
            center.height - 25),
        radius: 85);

    const innerRadius = Radius.circular(10);

    canvas.drawRRect(RRect.fromRectAndRadius(inner, innerRadius), bottomInner);

    // Code for the side rectangle
    final outer = Rect.fromCircle(
        center: Offset(
            mapping(control,
                outMin: center.width + 250, outMax: center.width + 222),
            center.height - 25),
        radius: 97);

    const outerRadius = Radius.circular(10);

    canvas.drawRRect(RRect.fromRectAndRadius(outer, outerRadius), bottomOuter);

    // Code for the top rectangle
    final rectInner = Rect.fromCircle(
        center: Offset(10, mapping(control, outMin: -100, outMax: -55)),
        radius: 85);

    const innerRectRadius = Radius.circular(10);

    canvas.drawRRect(
        RRect.fromRectAndRadius(rectInner, innerRectRadius), bottomInner);

    // Code for the top rectangle
    final rectOuter = Rect.fromCircle(
        center: Offset(10, mapping(control, outMin: -100, outMax: -55)),
        radius: 97);

    const outerRectRadius = Radius.circular(10);

    canvas.drawRRect(
        RRect.fromRectAndRadius(rectOuter, outerRectRadius), bottomOuter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
