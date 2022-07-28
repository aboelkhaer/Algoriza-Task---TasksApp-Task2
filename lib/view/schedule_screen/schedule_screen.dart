import 'package:algoriza_2/controller/home_controller.dart';
import 'package:algoriza_2/controller/schedule_controller.dart';
import 'package:algoriza_2/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'screen_widgets/screen_widgets.dart';

// ignore: must_be_immutable
class ScheduleScreen extends GetView<ScheduleController> {
  ScheduleScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const ScheduleTitleRow(title: 'Schedule'),
          const Divider(thickness: 1),
          DateSlider(),
          const Divider(thickness: 1),
          const DateRowSchedule(),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: homeController.taskList.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 50,
                ),
                itemBuilder: (context, index) {
                  Task task = homeController.taskList[index];

                  if (task.repeat == 'Daily') {
                    DateTime dateTime =
                        DateFormat.jm().parse(task.startTime.toString());
                    var time = DateFormat('HH:mm').format(dateTime);
                    homeController.notifyHelper.scheduleNotification(
                        int.parse(time.toString().split(':')[0]),
                        int.parse(time.toString().split(':')[1]),
                        task);
                    return TasksBasedOnDate(
                      homeController: homeController,
                      task: task,
                      index: index,
                    );
                  } else if (task.date ==
                      DateFormat('y-MM-d')
                          .format(controller.selectedValue.value)) {
                    return TasksBasedOnDate(
                      homeController: homeController,
                      task: task,
                      index: index,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
