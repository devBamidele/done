import 'package:flutter/material.dart';

class ExpScreen extends StatelessWidget {
  const ExpScreen({Key? key}) : super(key: key);

  static const id = 'ExpScreen';

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
            size.width / 2, size.height / 2, size.width / 4, size.height / 4),
        const Radius.circular(16),
      ),
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
