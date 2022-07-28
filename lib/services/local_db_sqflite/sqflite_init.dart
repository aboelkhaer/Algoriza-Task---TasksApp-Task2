import 'dart:developer';
import 'package:algoriza_2/model/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _db =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        log('Create Database--------');
        return db.execute(''' 
          CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY AUTOiNCREMENT,
          title TEXT, date STRING,
          startTime STRING, endTime STRING,
          remind INTEGER, repeat STRING,
          color INTEGER, 
          favorite INTEGER,
          isDone INTEGER)
          ''');
      });
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<int> insert(Task? task) async {
    log('insert to db --------');
    return await _db?.insert(_tableName, task!.toMap()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static delete(Task task) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static updateIsDone(int id) async {
    return await _db!.rawUpdate(''' 
    UPDATE tasks
    SET isDone = ?
    WHERE id =?
    ''', [1, id]);
  }

  static updateFavorite(int id) async {
    return await _db!.rawUpdate(''' 
    UPDATE tasks
    SET favorite = ?
    WHERE id =?
    ''', [1, id]);
  }

  static removeFavorite(int id) async {
    return await _db!.rawUpdate(''' 
    UPDATE tasks
    SET favorite = ?
    WHERE id =?
    ''', [0, id]);
  }
}
