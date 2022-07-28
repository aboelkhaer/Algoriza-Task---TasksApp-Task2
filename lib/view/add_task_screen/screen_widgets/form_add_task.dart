import 'package:algoriza_2/controller/controllers.dart';
import 'package:algoriza_2/view/add_task_screen/screen_widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../general_widgets/general_widgets.dart';

class FormForAddTask extends GetView<AddTaskController> {
  const FormForAddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: controller.spaceBetweenTitleAndTextField),
          CustomTextFormField(
            title: 'Add title',
            textInputType: TextInputType.text,
            controller: controller.titleController,
          ),
          SizedBox(height: controller.spaceBetweenTextField),
          Row(
            children: const [
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: controller.spaceBetweenTitleAndTextField),
          Obx(
            () => CustomTextFormField(
              title: DateFormat('y-MM-d').format(controller.date.value),
              textInputType: TextInputType.text,
              isReadOnly: true,
              icon: GestureDetector(
                onTap: () async {
                  final firstDate = await controller.pickDate(context);
                  if (firstDate == null) return;

                  controller.date.value = firstDate;
                },
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          SizedBox(height: controller.spaceBetweenTextField),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Start time',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: controller.spaceBetweenTitleAndTextField),
                    Obx(
                      () => CustomTextFormField(
                        title: controller.startTime.value,
                        textInputType: TextInputType.text,
                        isReadOnly: true,
                        icon: GestureDetector(
                          onTap: () {
                            controller.finalFullDate(
                              isStartTime: true,
                              context: context,
                            );
                          },
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey.shade300,
                            size: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'End time',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: controller.spaceBetweenTitleAndTextField),
                    Obx(
                      () => CustomTextFormField(
                        title: controller.endTime.value,
                        textInputType: TextInputType.text,
                        isReadOnly: true,
                        icon: GestureDetector(
                          onTap: () {
                            controller.finalFullDate(
                              isStartTime: false,
                              context: context,
                            );
                          },
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey.shade300,
                            size: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: controller.spaceBetweenTextField),
          Row(
            children: const [
              Text(
                'Remind',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: controller.spaceBetweenTitleAndTextField),
          Obx(
            () => CustomTextFormField(
              title: '${controller.selectedRemind.value} Minutes early',
              textInputType: TextInputType.text,
              isReadOnly: true,
              icon: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey.shade300),
                underline: Container(height: 0),
                onChanged: (String? val) {
                  controller.selectedRemind.value = int.parse(val!);
                },
                items: controller.remindList
                    .map<DropdownMenuItem<String>>((int val) {
                  return DropdownMenuItem<String>(
                    value: val.toString(),
                    child: Text(val.toString()),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: controller.spaceBetweenTextField),
          Row(
            children: const [
              Text(
                'Repeat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: controller.spaceBetweenTitleAndTextField),
          Obx(
            () => CustomTextFormField(
              title: controller.selectedRepeat.value,
              textInputType: TextInputType.text,
              isReadOnly: true,
              icon: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey.shade300),
                underline: Container(height: 0),
                onChanged: (String? val) {
                  controller.selectedRepeat.value = val!;
                },
                items: controller.repeatList
                    .map<DropdownMenuItem<String>>((String val) {
                  return DropdownMenuItem<String>(
                    value: val.toString(),
                    child: Text(val.toString()),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: controller.spaceBetweenTextField),
          const SelectedColor(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
