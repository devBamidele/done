import 'dart:async';
import 'package:done/screens/boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:done/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool show = false;

  @override
  initState() {
    super.initState();
    showLogo();
    startTime();
  }

  showLogo() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      setState(() {
        show = true;
      });
    });
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() => Navigator.pushReplacementNamed(context, BoardingScreen.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextLiquidFill(
                text: 'DONE',
                waveColor: const Color(0xFFbd6b73),
                boxBackgroundColor: const Color(0xFFD2FDFF),
                textStyle: kMainStyle,
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(
                  height: 70,
                  width: 70,
                ),
                secondChild: const Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF4599ed),
                    child: Icon(
                      Icons.done_rounded,
                      size: 47,
                      color: Colors.white,
                    ),
                  ),
                ),
                crossFadeState:
                    show ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 1000),
                secondCurve: Curves.easeInSine,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
