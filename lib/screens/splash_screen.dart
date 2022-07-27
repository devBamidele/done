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
    return Timer(duration, myRoute);
  }

  myRoute() => Navigator.of(context).pushReplacement(_createRoute());

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const BoardingScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

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
                waveColor: kSecColor,
                boxBackgroundColor: kThemeColor,
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
