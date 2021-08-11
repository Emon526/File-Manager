import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar {
  static primaryAppBar(String title, int tabLength, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StorageController storageController = Get.put(StorageController());
    return AppBar(
      title: Obx(() {
        return Text(
          title,
          style: TextStyle(
              color: storageController.isDarkTheme.value
                  ? Colors.white
                  : Colors.grey[700]),
        );
      }),

      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Obx(() {
            return Icon(
              Icons.apps_outlined,
              color: storageController.isDarkTheme.value
                  ? Colors.white
                  : Colors.black,
            );
          }),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      actions: [
        IconButton(
          icon: Obx(() {
            return Icon(
              Icons.search,
              color: storageController.isDarkTheme.value
                  ? Colors.white
                  : Colors.black,
            );
          }),
          onPressed: () {},
          // onPressed: () => showSearch(
          //   context: context,
          //   delegate: Data_Search(),
          // ),
        ),
      ],
      // TabBar Scection
      bottom: PreferredSize(
        preferredSize: size * .1,
        child: Padding(
          padding: EdgeInsets.only(left: 14.0, right: 14.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TabBar(
                tabs: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 100,
                    height: 48,
                    child: Center(
                      child: Text("Storage"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 100,
                    height: 48,
                    child: Center(
                      child: Text("Files"),
                    ),
                  )
                ],
                unselectedLabelColor: AppColor.primaryButtonBgColor,
                labelColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontFamily: kRobotoBold,
                ),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontFamily: kRobotoBold,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.primaryButtonBgColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
