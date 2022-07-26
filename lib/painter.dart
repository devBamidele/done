import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;

    var topInner = Paint()..color = const Color(0xFF5E5D5C).withOpacity(0.8);
    var topOuter = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFF5E5D5C).withOpacity(0.6);

    var middleInner = Paint()..color = const Color(0xFFc0888e).withOpacity(0.8);
    var middleOuter = Paint()
      ..color = const Color(0xFFc0888e).withOpacity(0.6)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    var bottomOuter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = const Color(0xFF948B8C).withOpacity(0.5);

    var bottomInner = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 7
      ..color = const Color(0xFF948B8C).withOpacity(0.9);

    var hLines = Paint()
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF5E5D5C).withOpacity(0.5);

    canvas.drawCircle(
        Offset(center.width - 100, center.height - 150), 60, middleInner);

    canvas.drawCircle(
        Offset(center.width - 100, center.height - 150), 75, middleOuter);

    canvas.drawCircle(
        Offset(center.width + 130, center.height - 300), 50, topInner);

    canvas.drawCircle(
        Offset(center.width + 130, center.height - 300), 65, topOuter);

    canvas.drawLine(Offset(center.width - 140, center.height + 50),
        Offset(center.width - 60, center.height + 50), hLines);

    canvas.drawLine(Offset(center.width - 100, center.height + 25),
        Offset(center.width - 20, center.height + 25), hLines);

    canvas.drawLine(Offset(center.width - 60, center.height),
        Offset(center.width + 20, center.height), hLines);

    canvas.drawLine(Offset(center.width - 20, center.height - 25),
        Offset(center.width + 60, center.height - 25), hLines);

    final inner = Rect.fromCircle(
        center: Offset(center.width + 224, center.height - 25), radius: 85);

    const innerRadius = Radius.circular(10);

    canvas.drawRRect(RRect.fromRectAndRadius(inner, innerRadius), bottomInner);

    final outer = Rect.fromCircle(
        center: Offset(center.width + 222, center.height - 25), radius: 97);

    const outerRadius = Radius.circular(10);

    canvas.drawRRect(RRect.fromRectAndRadius(outer, outerRadius), bottomOuter);

    final rectInner =
        Rect.fromCircle(center: const Offset(10, -55), radius: 85);

    const innerRectRadius = Radius.circular(10);

    canvas.drawRRect(
        RRect.fromRectAndRadius(rectInner, innerRectRadius), bottomInner);

    final rectOuter =
        Rect.fromCircle(center: const Offset(10, -55), radius: 97);

    const outerRectRadius = Radius.circular(10);

    canvas.drawRRect(
        RRect.fromRectAndRadius(rectOuter, outerRectRadius), bottomOuter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
