import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';

class UncompletedNotesTab extends GetView<HomeController> {
  const UncompletedNotesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: controller.taskList.length,
      itemBuilder: (context, index) {
        var task = controller.taskList[index];
        if (task.isDone == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        'Uncompleted',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(task.title),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
