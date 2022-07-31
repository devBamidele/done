import 'dart:collection';
import 'dart:developer';

import 'package:done/models/data_class.dart';
import 'package:flutter/material.dart';

import '../database_helper.dart';
import '../models/category.dart';
import '../models/task.dart';

class Data extends ChangeNotifier {
  final List<Task> _myTasks = [];
  final List<Category> _myCategory = [
    Category(taskNo: 12, catName: 'Work', complete: 0.7),
    Category(taskNo: 3, catName: 'School', complete: 0.4),
  ];

  String? myTask;
  String? category;
  int id = -1;

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  /// Increases the id of each task by 1 after before insertion.
  int increment() {
    id++;
    notifyListeners();
    return id;
  }

  /// Input a new task to the database.
  insert() async {
    await dbHelper.insert(
      DataClass(
        task: myTask.toString(),
        complete: 1,
        category: category.toString(),
      ),
    );
    log('The task is $myTask');
    log('The category is $category');
    myTask = null;
    category = null;
    notifyListeners();
  }

  /// Get all tasks from the database and return a list of [Task] objects.
  getTasks() async {
    final List<DataClass> tasks = await dbHelper.queryAllRows();
    _myTasks.clear();
    for (var task in tasks) {
      _myTasks.add(Task(name: task.task));
    }
    notifyListeners();
  }

  get taskCount => _myTasks.length;
  UnmodifiableListView<Task> get publicTasks => UnmodifiableListView(_myTasks);

  get categoryCount => _myCategory.length;
  UnmodifiableListView<Category> get publicCategory =>
      UnmodifiableListView(_myCategory);

  updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
