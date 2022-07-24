import 'package:flutter/material.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  static const id = 'BoardingScreen';

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello There',
          style: TextStyle(
            fontSize: 30,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}

// Center(
// child: Text('You\'ve reached the second page',
// style: TextStyle(
// fontSize: 30,
