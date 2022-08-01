import 'dart:io';

import 'package:done/models/data_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "DoneDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'done_table';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnAge = 'age';
  static const columnTask = 'task';
  static const columnComplete = 'complete';
  static const columnCategory = 'category';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTask TEXT NOT NULL,
            $columnComplete INTEGER NOT NULL,
            $columnCategory TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(DataClass row) async {
    Database? db = await instance.database;
    return await db!.insert(
      table,
      row.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // All of the rows are returned as
  // a list of DataClass objects.
  Future<List<DataClass>> queryAllRows() async {
    Database? db = await instance.database;

    // get the list of tasks from the database
    final List<Map<String, dynamic>> maps = await db!.query(table);
    return List.generate(maps.length, (i) {
      return DataClass(
        id: maps[i][columnId],
        task: maps[i][columnTask],
        complete: maps[i][columnComplete],
        category: maps[i][columnCategory],
      );
    });
  }

  // Get all the unique categories from the database.
  // And order them by the number of tasks in each category.
  Future<List<Map<String, dynamic>>> queryCategory() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>> data = await db!.rawQuery(
      'SELECT $columnCategory, COUNT(*) FROM $table GROUP BY $columnCategory ORDER BY COUNT(*) DESC',
    );
    return data;
  }

  // Update the 'complete' status of a task in the database.
  // The complete status is 0 if the task is completed, 1 if not.
  Future<int> update(int? id, int complete) async {
    Database? db = await instance.database;
    return await db!.rawUpdate(
        'Update $table SET $columnComplete = $complete WHERE $columnId = $id');
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
