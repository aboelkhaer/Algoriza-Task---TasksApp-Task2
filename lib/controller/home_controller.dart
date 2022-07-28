import 'package:algoriza_2/model/task_model.dart';
import 'package:algoriza_2/services/local_db_sqflite/sqflite_init.dart';
import 'package:algoriza_2/services/notification/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late NotifyHelper notifyHelper;
  @override
  void onInit() {
    super.onInit();
    getTasks();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DB.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DB.query();
    taskList.assignAll(tasks.map((data) => Task.fromMap(data)).toList());
  }

  Color getColor(int color) {
    if (color == 0) return Colors.red;
    if (color == 1) return Colors.green;
    return Colors.blue;
  }

  void delete(Task task) {
    DB.delete(task);
    getTasks();
    update();
  }

  void updateTaskIsDone(int id) async {
    await DB.updateIsDone(id);
    getTasks();
    update();
  }

  void updateTaskFavorite(int id) async {
    await DB.updateFavorite(id);
    getTasks();
    update();
  }

  void removeTaskFavorite(int id) async {
    await DB.removeFavorite(id);
    getTasks();
    update();
  }
}
