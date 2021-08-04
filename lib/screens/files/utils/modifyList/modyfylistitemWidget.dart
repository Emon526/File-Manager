import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';

class ModifyListItemWidget extends StatelessWidget {
  const ModifyListItemWidget({Key? key, required this.entity})
      : super(key: key);
  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColor.secondaryAppColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FileManager.isFile(entity)
              ? Icon(
                  Icons.feed_outlined,
                  color: AppColor.secondaryTextColor,
                  size: 80,
                )
              : Icon(
                  Icons.folder,
                  color: AppColor.secondaryTextColor,
                  size: 80,
                ),

          SizedBox(
            height: 8.0,
          ),
         
          SingleLineText(
            text: FileManager.basename(entity),
          ),
        ],
      ),
    );
  }
}
