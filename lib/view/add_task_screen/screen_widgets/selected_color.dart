import 'package:algoriza_2/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedColor extends GetView<AddTaskController> {
  const SelectedColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Wrap(
            children: List<Widget>.generate(
              3,
              (index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectedColor.value = index;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: index == 0
                          ? Colors.red
                          : index == 1
                              ? Colors.green
                              : Colors.blue,
                      child: controller.selectedColor.value == index
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 17,
                            )
                          : Container(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
