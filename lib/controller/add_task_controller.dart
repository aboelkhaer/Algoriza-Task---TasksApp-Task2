import 'package:algoriza_2/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/task_model.dart';

class AddTaskController extends GetxController {
  final HomeController homeController = Get.put(HomeController());

  TextEditingController titleController = TextEditingController();
  Rx<DateTime> date = DateTime.now().obs;
  RxString startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString().obs;
  RxInt selectedColor = 0.obs;
  RxString endTime = '10:00 PM'.obs;
  RxInt selectedRemind = 5.obs;
  List<int> remindList = [5, 10, 15, 20];
  RxString selectedRepeat = 'None'.obs;
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  double spaceBetweenTextField = 5.0;
  double spaceBetweenTitleAndTextField = 10.0;

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
  }

  Future<TimeOfDay?> pickTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(startTime.split(':')[0]),
        minute: int.parse(startTime.split(':')[1].split(' ')[0]),
      ),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }

  addTaskToLocalDB() async {
    var val = await homeController.addTask(
        task: Task(
      title: titleController.text,
      date: DateFormat('y-MM-d').format(date.value),
      startTime: startTime.value,
      endTime: endTime.value,
      remind: selectedRemind.value,
      repeat: selectedRepeat.value,
      color: selectedColor.value,
      isDone: 0,
      favorite: 0,
    ));
    return val;
  }

  finalFullDate(
      {required bool isStartTime, required BuildContext context}) async {
    var pickedTime = await pickTime(context);
    String? formatedTime = pickedTime?.format(context);
    if (pickedTime == null) {
    } else if (isStartTime) {
      startTime.value = formatedTime!;
    } else if (!isStartTime) {
      endTime.value = formatedTime!;
    }
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
  }

  validattion() {
    if (titleController.text.isNotEmpty) {
      addTaskToLocalDB();
      homeController.getTasks();
      Get.back();
    } else if (titleController.text.isEmpty) {
      Get.snackbar(
        'Required',
        'Title field is required !',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 40),
      );
    }
  }
}
