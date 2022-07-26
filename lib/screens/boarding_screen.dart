import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:done/painter.dart';

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
