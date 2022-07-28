import 'package:algoriza_2/controller/home_controller.dart';
import 'package:algoriza_2/controller/schedule_controller.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateSlider extends GetView<ScheduleController> {
  DateSlider({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DatePicker(
        DateTime.now(),
        monthTextStyle: const TextStyle(fontSize: 0),
        width: 55,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.green.shade400,
        selectedTextColor: Colors.white,
        dateTextStyle: const TextStyle(fontSize: 16),
        onDateChange: (date) {
          controller.selectedValue.value = date;
          homeController.getTasks();
        },
      ),
    );
  }
}
