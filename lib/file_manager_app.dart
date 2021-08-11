import 'package:filemanager/controllers/content-controller/content_controller_binding.dart';
import 'package:filemanager/controllers/splash_controller/splash_controller.dart';
import 'package:filemanager/controllers/storage-controller/binding_storage_controller.dart';
import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/themes/app_theme.dart';
import 'package:filemanager/screens/apps/apps_screen.dart';
import 'package:filemanager/screens/archives/archives_screen.dart';
import 'package:filemanager/screens/audio/audio_List.dart';
import 'package:filemanager/screens/documents/document_List.dart';
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
    StorageController storageController = Get.put(StorageController());
    SplashController splashController = Get.put(SplashController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: storageController.getThemeData(),
      darkTheme: darkTheme,
      initialRoute: '/',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
            name: '/',
            page: () =>
                splashController.isOldYser() ? HomeScreen() : SplashScreen(),
            binding: BindingStorageController()),
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
        GetPage(name: '/audio', page: () => MyAudioList()),
        GetPage(name: '/document', page: () => MyDocumentList()),
        GetPage(name: '/apps', page: () => AppsScreen()),
        GetPage(name: '/archieves', page: () => ArchivesScreen()),
      ],
    );
  }
}
