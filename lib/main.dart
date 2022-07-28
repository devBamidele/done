import 'package:done/constants.dart';
import 'package:flutter/material.dart';
import 'package:done/screens/splash_screen.dart';
import 'package:done/screens/boarding_screen.dart';
import 'package:done/screens/task_screen.dart';
import 'package:done/screens/add_task_screen.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sqflite/sqflite.dart';

import 'data/data.dart';
import 'models/data_class.dart';

main() async {
  runApp(const Done());
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'done_database.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE done(id INTEGER PRIMARY KEY, task TEXT, complete INTEGER, category TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts tasks into the database
  Future<void> insertTask(DataClass item) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the task into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same task is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'done',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the tasks from the done table
  Future<List<DataClass>> viewTasks() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('done');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return DataClass(
        id: maps[i]['id'],
        task: maps[i]['task'],
        complete: maps[i]['complete'],
        category: maps[i]['category'],
      );
    });
  }

  // The method that updates tasks
  Future<void> updateTask(DataClass item) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'done',
      item.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [item.id],
    );
  }

  // Clear a task from the table using a specific id
  Future<void> deleteTask(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'done',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: [
              const ResponsiveBreakpoint.resize(350, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(600, name: TABLET),
              const ResponsiveBreakpoint.resize(800, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ]),
        debugShowCheckedModeBanner: false,
        initialRoute: TaskScreen.id,
        theme: ThemeData(
          scaffoldBackgroundColor: kThemeColor,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.75),
            ),
            headline2: const TextStyle(
              fontSize: 16,
              color: kSecColor,
            ),
          ),
        ),
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          BoardingScreen.id: (context) => const BoardingScreen(),
          TaskScreen.id: (context) => const TaskScreen(),
          AddTaskScreen.id: (context) => const AddTaskScreen(),
        },
      ),
    );
  }
}
