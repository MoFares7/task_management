// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static Database? _database;
//   static const String dbName = 'tasks.db';
//   static const String tasksTable = 'tasks';

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await initDatabase();
//     return _database!;
//   }

//   Future<Database> initDatabase() async {
//     final path = await getDatabasesPath();
//     final databasePath = join(path, dbName);
//     return openDatabase(
//       databasePath,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
//           '''CREATE TABLE $tasksTable (
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               name TEXT,
//               description TEXT,
//               type TEXT
//           )''',
//         );
//       },
//     );
//   }

//   Future<List<Map<String, dynamic>>> fetchTasks() async {
//     final Database db = await database;
//     return db.query(tasksTable);
//   }

//   // Define the fetchTasksByType method to fetch tasks by their type
//   Future<List<Map<String, dynamic>>> fetchTasksByType(String type) async {
//     final Database db = await database;
//     return db.query(tasksTable, where: 'type = ?', whereArgs: [type]);
//   }

//   Future<void> insertTask(Map<String, dynamic> task, String taskType) async {
//     final Database db = await database;
//     final taskWithDetails = {
//       ...task,
//       'type': taskType,
//     };
//     await db.insert(tasksTable, taskWithDetails);
//   }

//   Future<void> deleteTask(int id) async {
//     final Database db = await database;
//     await db.delete(tasksTable, where: 'id = ?', whereArgs: [id]);
//   }
// }

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'tasks.db';
  static const String tasksTable = 'tasks';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, dbName);
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $tasksTable (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              description TEXT,
              type TEXT
          )''',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final Database db = await database;
    return db.query(tasksTable);
  }

  Future<List<Map<String, dynamic>>> fetchTasksByType(String type) async {
    final Database db = await database;
    return db.query(tasksTable, where: 'type = ?', whereArgs: [type]);
  }

  Future<void> insertTask(Map<String, dynamic> task, String taskType) async {
    final Database db = await database;
    final taskWithDetails = {
      ...task,
      'type': taskType,
    };
    await db.insert(tasksTable, taskWithDetails);
  }

  Future<void> deleteTask(int id) async {
    final Database db = await database;
    await db.delete(tasksTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTask(int id, Map<String, dynamic> updatedTask) async {
    final Database db = await database;
    await db.update(
      tasksTable,
      updatedTask,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
