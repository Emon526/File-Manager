import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/storage/components/storage_details_container.dart';
import 'package:flutter/material.dart';

class StorageSpaceInfo extends StatelessWidget {
  final double usedData;
  final double freeData;
  const StorageSpaceInfo({required this.usedData, required this.freeData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StorageDetailsContainer(
          title: "Used",
          data: usedData,
          color: AppColor.primaryButtonBgColor,
        ),
        StorageDetailsContainer(
          title: "free",
          data: freeData,
          color: AppColor.secondaryAppColor,
        ),
      ],
    );
  }
}
