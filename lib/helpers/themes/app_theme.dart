import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  // primarySwatch:  AppColor.secondaryColor,
  primaryColor: AppColor.primaryColor,
  brightness: Brightness.light,
  backgroundColor:  Colors.white,
  accentColor: AppColor.orangeColor,
  accentIconTheme: IconThemeData(color: AppColor.orangeColor),
  dividerColor: AppColor.titleColor,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);
