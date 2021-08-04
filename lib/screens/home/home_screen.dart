import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/screens/components/home_appbar.dart';
import 'package:filemanager/screens/files/files_screen.dart';
import 'package:filemanager/screens/storage/storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: HomeAppBar.primaryAppBar("Home", 2),
    //     body: TabBarView(
    //       children: [
    //         // Storage tab
    //         StorageScreen(),
    //         Center(
    //           child: Text('Files'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Obx(
      () => Get.find<StorageController>().isPermit.value == true
          ? DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: HomeAppBar.primaryAppBar("Home", 2),
                body: TabBarView(
                  children: [
                    // Storage tab
                    StorageScreen(),
                    // files screen
                    FileScreen(),
                  ],
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
