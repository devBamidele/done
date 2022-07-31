import 'package:done/constants.dart';
import 'package:flutter/material.dart';
import 'package:done/screens/splash_screen.dart';
import 'package:done/screens/boarding_screen.dart';
import 'package:done/screens/task_screen.dart';
import 'package:done/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'data/data.dart';

main() async {
  runApp(const Done());
}

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: [
              const ResponsiveBreakpoint.resize(350, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(600, name: TABLET),
              const ResponsiveBreakpoint.resize(800, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ]),
        debugShowCheckedModeBanner: false,
        initialRoute: TaskScreen.id,
        theme: ThemeData(
          scaffoldBackgroundColor: kThemeColor,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.75),
            ),
            headline2: const TextStyle(
              fontSize: 16,
              color: kSecColor,
            ),
          ),
        ),
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          BoardingScreen.id: (context) => const BoardingScreen(),
          TaskScreen.id: (context) => const TaskScreen(),
          AddTaskScreen.id: (context) => const AddTaskScreen(),
        },
      ),
    );
  }
}
