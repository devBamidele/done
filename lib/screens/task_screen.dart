import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static const id = 'ExpScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello There',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
