import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  // primarySwatch:  AppColor.secondaryColor,
  primaryColor: AppColor.primaryColor,
  brightness: Brightness.light,
<<<<<<< HEAD
  backgroundColor: AppColor.bgColor,
=======
  backgroundColor:  Colors.white,
>>>>>>> 511ce1d194a7d834c3aa9e4f34a2febf9f7966c4
  accentColor: AppColor.orangeColor,
  accentIconTheme: IconThemeData(color: AppColor.orangeColor),
  dividerColor: AppColor.titleColor,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
<<<<<<< HEAD
  backgroundColor: AppColor.bgColor,
=======
  backgroundColor: const Color(0xFF212121),
>>>>>>> 511ce1d194a7d834c3aa9e4f34a2febf9f7966c4
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);
