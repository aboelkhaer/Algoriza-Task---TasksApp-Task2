import 'package:algoriza_2/core/routes/app_pages.dart';
import 'package:algoriza_2/services/local_db_sqflite/sqflite_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        title: 'Algoriza Task 2',
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.goToHomeRoute(),
      ),
    );
  }
}
