import 'package:algoriza_2/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../general_widgets/general_widgets.dart';

class AllNotesTab extends GetView<HomeController> {
  const AllNotesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.only(
                      bottom: 100, left: 20, right: 20, top: 25),
                  itemCount: controller.taskList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var task = controller.taskList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.updateTaskIsDone(task.id!);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              controller.getColor(task.color!)),
                                      borderRadius: BorderRadius.circular(8),
                                      color: task.isDone == 1
                                          ? controller.getColor(task.color!)
                                          : Colors.white,
                                    ),
                                    child: task.isDone == 1
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        : Container(),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  child: Text(
                                    task.title,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          (task.favorite == 1)
                              ? GestureDetector(
                                  onTap: () {
                                    controller.removeTaskFavorite(task.id!);
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.orange,
                                  ),
                                )
                              : Container(),
                          Expanded(
                            child: PopupMenuButton<String>(
                              onSelected: (value) {
                                switch (value) {
                                  case 'Add to favorite':
                                    if (task.favorite == 1) {
                                      Get.snackbar(
                                        'Favorite',
                                        'This task already in!',
                                        snackPosition: SnackPosition.BOTTOM,
                                        margin:
                                            const EdgeInsets.only(bottom: 40),
                                      );
                                    } else {
                                      controller.updateTaskFavorite(task.id!);
                                      Get.snackbar(
                                        'Favorite',
                                        'Added to favorite successfully',
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            Colors.green.withOpacity(0.8),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        margin:
                                            const EdgeInsets.only(bottom: 40),
                                      );
                                    }
                                    break;
                                  case 'Delete':
                                    controller.delete(task);
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return {'Add to favorite', 'Delete'}
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: CustomButtom(
            onPressed: () {
              Get.toNamed(AppRoutes.goToAddTaskRoute());
            },
            title: 'Add a task',
          ),
        ),
      ],
    );
  }
}
