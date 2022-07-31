import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  static const id = 'AddTaskScreen';

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 15),
            child: FloatingActionButton.extended(
              backgroundColor: kSecColor,
              label: const Text(
                'Create',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              icon: const Icon(
                Icons.add,
                size: 33,
                semanticLabel: 'Create a new task',
              ),
              onPressed: () {
                data.insert();
                data.getTasks();
                Navigator.pop(context);
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      decoration: kInputDecoration.copyWith(
                        hintText: 'Enter new task',
                      ),
                      onChanged: (value) {
                        data.myTask = value;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      decoration: kInputDecoration.copyWith(
                        hintText: 'Enter Category',
                      ),
                      onChanged: (value) {
                        data.category = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
