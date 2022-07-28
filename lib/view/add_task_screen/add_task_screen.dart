import 'package:algoriza_2/controller/controllers.dart';
import 'package:algoriza_2/view/add_task_screen/screen_widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../general_widgets/general_widgets.dart';
import '../schedule_screen/screen_widgets/screen_widgets.dart';

class AddTaskScreen extends GetView<AddTaskController> {
  const AddTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScheduleTitleRow(title: 'Add task'),
            const Divider(thickness: 1),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.79,
                child: Stack(
                  children: [
                    const FormForAddTask(),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: CustomButtom(
                        title: 'Create a task',
                        onPressed: () {
                          controller.validattion();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
