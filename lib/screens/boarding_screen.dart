import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  static const id = 'BoardingScreen';

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: OpenPainter(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Stay on top on things',
                      textStyle: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 120),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Streamline and improve the way you organize your tasks.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Material(
                  color: const Color(0xFFbd6b73),
                  elevation: 7,
                  borderRadius: BorderRadius.circular(15.0),
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: 210.0,
                    height: 50.0,
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    // var paint = Paint()
    //   ..color = Colors.yellow
    //   ..strokeWidth = 1;
    //canvas.drawLine(
    //Offset(0, center.height), Offset(size.width, center.height), paint);

    // var paint1 = Paint()
    //   ..color = const Color(0xff995588)
    //   ..style = PaintingStyle.fill;
    // canvas.drawRect(const Offset(290, 20) & const Size(100, 100), paint1);
    // canvas.drawLine(const Offset(10, 10), const Offset(100, 100), Paint());

    var col1 = Paint()..color = const Color(0xFFc0888e).withOpacity(0.8);

    var col2 = Paint()..color = const Color(0xFFC2B2B8);

    var col3 = Paint()..color = const Color(0xFF5E5D5C).withOpacity(0.8);

    canvas.drawCircle(
        Offset(center.width - 100, center.height - 150), 75, col1);

    canvas.drawCircle(
        Offset(center.width + 130, center.height - 300), 50, col3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
