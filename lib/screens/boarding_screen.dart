import 'package:done/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:done/Painter/painter.dart';
import 'package:done/screens/task_screen.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  static const id = 'BoardingScreen';

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);

    animation = Tween<double>(begin: 0, end: 150).animate(controller);

    controller.forward();
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const TaskScreen(),
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
    return Consumer<Data>(
      builder: (_, data, Widget? child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                AnimatedBuilder(
                  builder: (_, child) {
                    return CustomPaint(
                      painter: OpenPainter(animation.value),
                      child: const Center(),
                    );
                  },
                  animation: animation,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Stay on top of things',
                              textStyle: Theme.of(context).textTheme.headline1,
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
                          color: kSecColor,
                          elevation: 7,
                          borderRadius: BorderRadius.circular(15.0),
                          child: MaterialButton(
                            onPressed: () {
                              // Call the functions that sets stage for the 'task_screen'
                              data.getTasks();
                              data.getCategories();
                              Navigator.of(context).push(_createRoute());
                            },
                            minWidth: 210.0,
                            height: 50.0,
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                color: kThemeColor,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
