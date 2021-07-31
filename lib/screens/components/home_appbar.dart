import 'package:filemanager/controllers/theme_controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar {
  static primaryAppBar(String title, int tabLength) {
    ThemeController controller = Get.put(ThemeController());
    print(controller.isDark);

    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        Obx(() {
          print(controller.isDark);
          return Switch(
              value: controller.isDark.value,
              onChanged: (state) {
                controller.changeAppTheme(state);
                controller.saveThemeData(state);
                print(state);
              });
        })
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.search),
        // ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(
            text: "Storage",
          ),
          Tab(
            text: "Files",
          ),
        ],
      ),
    );
  }
}
