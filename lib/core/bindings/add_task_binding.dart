import 'package:get/get.dart';
import '../../controller/controllers.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController());
    Get.put<HomeController>(HomeController());
  }
}
