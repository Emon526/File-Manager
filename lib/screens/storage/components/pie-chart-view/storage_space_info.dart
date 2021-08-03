import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/storage/components/pie-chart-view/storage_details_container.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class StorageSpaceInfo extends StatelessWidget {
  const StorageSpaceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StorageDetailsContainer(
          title: "Used",
          data: Get.find<StorageController>().usedSpace,
          color: AppColor.primaryButtonBgColor,
        ),
        StorageDetailsContainer(
          title: "free",
          data: Get.find<StorageController>().freeSpace,
          color: AppColor.freeSpaceColor,
        ),
      ],
    );
  }
}
