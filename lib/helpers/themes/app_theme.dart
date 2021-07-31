import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  // primarySwatch:  AppColor.secondaryColor,
  primaryColor: AppColor.primaryAppColor,
  brightness: Brightness.light,
  backgroundColor: AppColor.primaryAppColor,
  accentColor: AppColor.primaryButtonBgColor,
  accentIconTheme: IconThemeData(color: AppColor.primaryButtonBgColor),
  dividerColor: AppColor.primaryTextColor,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: AppColor.primaryAppColor,
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);
