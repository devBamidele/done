import 'package:flutter/material.dart';
import 'package:done/screens/splash_screen.dart';
import 'package:done/screens/boarding_screen.dart';
import 'package:done/screens/task_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

main() => runApp(const Done());

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: [
            const ResponsiveBreakpoint.resize(350, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(600, name: TABLET),
            const ResponsiveBreakpoint.resize(800, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ]),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD2FDFF),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        BoardingScreen.id: (context) => const BoardingScreen(),
        TaskScreen.id: (context) => const TaskScreen(),
      },
    );
  }
}
