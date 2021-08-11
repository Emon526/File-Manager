import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class StoragePieChart extends StatelessWidget {
  const StoragePieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.height * 0.020,
      ),
      child: Center(
        child: CustomPaint(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => SingleLineText(
                          text:
                              "${Get.find<StorageController>().spacePercentage}"),
                    ),
                    SingleLineText(text: "%", color: Colors.black),
                  ],
                ),
                SingleLineText(text: "Used"),
              ],
            ),
          ),
          foregroundPainter: Get.find<StorageController>().paintPieChart(),
        ),
      ),
    );
  }
}
