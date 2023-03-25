import 'package:daily_house_work_app/screen/setting_screen.dart';
import 'package:daily_house_work_app/screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../controller/tab_screen_controller.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabScreenController());
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: [
          const TodoScreen(),
          const SettingScreen(),
        ][controller.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: ColorConstant.appBarColor,
            unselectedItemColor: Colors.grey,
            iconSize: 30,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.today_outlined),
                label: '家事リスト',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '設定画面',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
