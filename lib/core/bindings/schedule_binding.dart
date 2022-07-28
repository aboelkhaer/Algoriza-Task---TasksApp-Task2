import 'package:get/get.dart';

import '../../controller/controllers.dart';

class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() => ScheduleController());
    Get.put<HomeController>(HomeController());
  }
}
