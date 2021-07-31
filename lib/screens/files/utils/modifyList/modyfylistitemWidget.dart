import 'package:filemanager/controllers/theme_controller/theme_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyListItemWidget extends StatelessWidget {
  const ModifyListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: themeController.isSavedDark()
            ? AppColor.primaryTextColor.withOpacity(0.2)
            : AppColor.primaryAppColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.folder,
            color: AppColor.secondaryTextColor,
            size: 80,
          ),
          SizedBox(
            height: 8.0,
          ),
          // sText("4k Movies", AppColor.titleColor, 18.0,
          //     FontWeight.bold),
          SingleLineText(
            text: "4K Movies",
          ),
          // sText("911 item", AppColor.titleColor, 14.0, FontWeight.normal)
          SingleLineText(
            text: "911 items",
            isTitle: false,
          ),
        ],
      ),
    );
  }
}
