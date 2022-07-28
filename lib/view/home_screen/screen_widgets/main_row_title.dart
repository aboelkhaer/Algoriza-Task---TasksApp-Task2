import 'package:algoriza_2/controller/home_controller.dart';
import 'package:algoriza_2/core/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainRowTitle extends GetView<HomeController> {
  const MainRowTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10) +
          const EdgeInsets.symmetric(
            horizontal: 20,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Board',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.goToScheduleRoute());
                },
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
