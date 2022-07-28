import 'package:algoriza_2/core/bindings/add_task_binding.dart';
import 'package:get/get.dart';
import '../../view/views.dart';
import '../bindings/bindings.dart';

class AppRoutes {
  static const String _home = '/';
  static String goToHomeRoute() => _home;

  static const String _schedule = '/schedule';
  static String goToScheduleRoute() => _schedule;

  static const String _addTask = '/addTask';
  static String goToAddTaskRoute() => _addTask;

  static List<GetPage> routes = [
    GetPage(
      name: _home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _schedule,
      page: () => ScheduleScreen(),
      binding: ScheduleBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _addTask,
      page: () => const AddTaskScreen(),
      binding: AddTaskBinding(),
      transition: Transition.zoom,
    ),
  ];
}
