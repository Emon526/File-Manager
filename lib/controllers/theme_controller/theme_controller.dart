import 'package:filemanager/helpers/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _getStorage = GetStorage();
  final storeKey = "isDark";
  var isDark = true.obs;

  @override
  void onInit() {
    if (isSavedDark()) {
      isDark = true.obs;
      print("Dark");
    } else {
      isDark = false.obs;
      print("Light");
    }
    super.onInit();
  }

  void changeAppTheme(state) {
    if (state == true) {
      isDark = true.obs;
      Get.changeTheme(darkTheme);
      saveThemeData(isDark.value);
    } else {
      isDark = false.obs;
      Get.changeTheme(lightTheme);
      saveThemeData(isDark.value);
    }
  }

  ThemeData getThemeData() {
    print("Got Theme");

    if (isSavedDark()) {
      isDark.value = true;
      return darkTheme;
    }

    isDark.value = false;
    return lightTheme;
  }

  bool isSavedDark() {
    print("Read Theme");
    return _getStorage.read(storeKey) ?? false;
  }

  void saveThemeData(bool isDark) {
    _getStorage.write(storeKey, isDark);
  }
}
