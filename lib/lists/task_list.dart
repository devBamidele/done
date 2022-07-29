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
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: data.publicTasks.isNotEmpty
              ? ListView.builder(
                  itemCount: data.taskCount,
                  itemBuilder: (_, index) {
                    final task = data.publicTasks[index];
                    return TaskTile(
                      task: task.name,
                      checkboxCallback: (bool? newValue) {
                        data.updateTask(task);
                      },
                      isChecked: task.isDone,
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                )
              : Center(
                  child: Text(
                    'No current tasks',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
