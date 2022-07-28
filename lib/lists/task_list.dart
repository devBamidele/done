import 'package:done/reusables/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (_, data, Widget? child) {
        return ListView.builder(
          itemCount: data.taskCount,
          itemBuilder: (_, index) {
            final task = data.publicTasks[index];
            return TaskTile(
              task: task.name,
              checkboxCallback: (newValue) {
                data.updateTask(task);
              },
              isChecked: task.isDone,
            );
          },
        );
      },
    );
  }
}
