import 'package:filemanager/controllers/content-controller/content_controller_binding.dart';
import 'package:filemanager/controllers/storage-controller/binding_storage_controller.dart';
import 'package:filemanager/helpers/themes/app_theme.dart';
import 'package:filemanager/screens/home/home_screen.dart';
import 'package:filemanager/screens/images/image_screen.dart';
import 'package:filemanager/screens/splash/splash_screen.dart';
import 'package:filemanager/screens/videos/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: BindingStorageController(),
        ),
        GetPage(
          name: '/image/:titleValue',
          page: () => ImageScreen(),
          binding: ContentControllerBinging(),
        ),
        GetPage(
          name: '/video/:titleValue',
          page: () => VideoScreen(),
          binding: ContentControllerBinging(),
        ),
      ],
    );
  }
}
