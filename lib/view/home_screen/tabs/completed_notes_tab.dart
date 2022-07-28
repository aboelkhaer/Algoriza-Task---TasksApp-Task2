import 'package:algoriza_2/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedNotesTab extends GetView<HomeController> {
  const CompletedNotesTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: controller.taskList.length,
      itemBuilder: (context, index) {
        var task = controller.taskList[index];
        if (task.isDone == 1) {
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
                        'Completed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
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
