import 'package:done/constants.dart';
import 'package:done/lists/category_list.dart';
import 'package:done/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../lists/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static const id = 'ExpScreen';

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddTaskScreen(),
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
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 15),
            child: FloatingActionButton(
              backgroundColor: kSecColor,
              elevation: 10,
              child: const Icon(
                Icons.add,
                size: 33,
                semanticLabel: 'Create a new task',
              ),
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What\'s up, dele !',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('CATEGORIES'),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 130,
                    child: CategoryList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('TODAY\'S TASKS'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Expanded(
                    child: TaskList(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
