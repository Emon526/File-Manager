import 'package:filemanager/controllers/splash_controller/splash_controller.dart';
import 'package:filemanager/controllers/storage-controller/binding_storage_controller.dart';
import 'package:filemanager/controllers/theme_controller/theme_controller.dart';
import 'package:filemanager/screens/files/files_screen.dart';
import 'package:filemanager/screens/home/home_screen.dart';
import 'package:filemanager/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller instance
    ThemeController themeController = Get.put(ThemeController());
    SplashController splashController = Get.put(SplashController());

    //return app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.getThemeData(),
      initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
            name: '/',
            binding: BindingStorageController(),
            page: () {
              return Obx(() => splashController.isFirstTime.value
                  ? SplashScreen()
                  : HomeScreen());
            }),
        GetPage(
            name: '/home',
            page: () => HomeScreen(),
            binding: BindingStorageController()),
      ],
    );
  }
}
