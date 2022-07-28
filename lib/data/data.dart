import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/task.dart';

class Data extends ChangeNotifier {
  final List<Task> _myTasks = [Task(name: 'Have my bath')];
  final List<Category> _myCategory = [
    Category(taskNo: 12, catName: 'Work', complete: 0.7)
  ];

  get taskCount => _myTasks.length;
  UnmodifiableListView<Task> get publicTasks => UnmodifiableListView(_myTasks);

  UnmodifiableListView<Category> get publicCategory =>
      UnmodifiableListView(_myCategory);
  get categoryCount => _myCategory.length;

  updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
