import 'package:algoriza_2/view/home_screen/screen_widgets/screen_widgets.dart';
import 'package:algoriza_2/view/home_screen/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const MainRowTitle(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TabBar(
                unselectedLabelStyle: const TextStyle(color: Colors.black54),
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.black54,
                tabs: tabs,
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  AllNotesTab(),
                  CompletedNotesTab(),
                  UncompletedNotesTab(),
                  FavoriteNotesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
