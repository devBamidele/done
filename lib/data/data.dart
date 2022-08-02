import 'dart:collection';
import 'dart:developer';

import 'package:done/models/data_class.dart';
import 'package:flutter/material.dart';

import '../database_helper.dart';
import '../models/category.dart';
import '../models/task.dart';

class Data extends ChangeNotifier {
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  String? myTask;
  String? category;

  final List<Task> _myTasks = []; // Stores the tasks in the database
  final List<Category> _myCategory =
      []; // Stores the categories in the database

  /// For the checked state of a task.
  updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  /// Input a new task to the database.
  insert() async {
    await dbHelper.insert(
      DataClass(
        id: null,
        task: myTask.toString(),
        complete: 1,
        category: category.toString(),
      ),
    );
    // Reset the input fields.
    myTask = null;
    category = null;
    notifyListeners();
  }

  /// Get all tasks from the database and return a list of [Task] objects.
  getTasks() async {
    final List<DataClass> tasks = await dbHelper.queryAllRows();
    _myTasks.clear();
    for (var task in tasks) {
      _myTasks.add(
        Task(
            name: task.task,
            id: task.id,
            isDone: task.complete == 1 ? false : true),
      );
    }
    notifyListeners();
  }

  /// Get all categories from the database and return a list of [Category] objects.
  getCategories() async {
    final categories = await dbHelper.queryCategory();
    _myCategory.clear();
    for (var cat in categories) {
      _myCategory.add(
        Category(
          taskNo: cat['COUNT(*)'],
          catName: cat['category'],
          complete: 0.5,
        ),
      );
    }
    notifyListeners();
  }

  /// Update the complete status of a task in the database.
  updateChecked(int? anItem, int complete) async {
    dbHelper.update(anItem, complete);
    notifyListeners();
  }

  get taskCount => _myTasks.length;
  UnmodifiableListView<Task> get publicTasks => UnmodifiableListView(_myTasks);

  get categoryCount => _myCategory.length;
  UnmodifiableListView<Category> get publicCategory =>
      UnmodifiableListView(_myCategory);
}
