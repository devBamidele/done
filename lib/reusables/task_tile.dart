import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

/// The class that controls the appearance of each task tile
class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.task,
    required this.checkboxCallback,
    required this.isChecked,
    Key? key,
  }) : super(key: key);

  final bool isChecked;
  final String task;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white.withOpacity(0.8),
      title: Text(
        task,
        style: TextStyle(
          fontSize: 18,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      horizontalTitleGap: 10,
      leading: RoundCheckBox(
        checkedWidget: const Icon(
          Icons.check,
          color: Colors.black,
          size: 15,
        ),
        checkedColor: Colors.grey,
        onTap: checkboxCallback,
        size: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
