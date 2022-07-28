import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../controller/home_controller.dart';
import '../../../model/task_model.dart';

class TasksBasedOnDate extends StatelessWidget {
  const TasksBasedOnDate({
    Key? key,
    required this.homeController,
    required this.task,
    required this.index,
  }) : super(key: key);

  final HomeController homeController;
  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      child: SlideAnimation(
        child: FadeInAnimation(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: homeController.getColor(task.color!),
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${task.startTime}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      task.title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    homeController.updateTaskIsDone(task.id!);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                    ),
                    child: task.isDone == 1
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          )
                        : Container(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
