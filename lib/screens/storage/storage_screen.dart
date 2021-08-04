import 'dart:io';
import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/storage/components/pie-chart-view/storage_chart.dart';
import 'package:filemanager/screens/storage/components/pie-chart-view/storage_space_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
// import 'package:get/get.dart';

class StorageScreen extends StatelessWidget {
  StorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // storage pie chart
          Expanded(
            flex: 3,
            child: Container(
              // padding: EdgeInsets.only(top: 10),
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: AppColor.secondaryAppColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => DropdownButton<Directory>(
                        value:
                            Get.find<StorageController>().selectedStorage.value,
                        items: Get.find<StorageController>()
                            .storageList
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(
                                    "${Get.find<StorageController>().getStorageName(e)}"),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          Get.find<StorageController>().setSelectedStorage(val);
                          var allPath = val!.path;
                          var audioPath = val.path + '/Music';
                          var videoPath = val.path + '/Movies';
                          var imagePath = val.path + '/Pictures';
                          var documentsPath = val.path + '/Documents';
                          var downloadPath = val.path + '/Download';
                          var appsPath = val.path + '/Download';
                          var archivesPath = val.path + '/Download';

                          print("Selected: $allPath");
                          print("Selected: $audioPath");
                          print("Selected: $videoPath");
                          print("Selected: $imagePath");
                          print("Selected: $documentsPath");
                          print("Selected: $downloadPath");
                          print("Selected: $appsPath");
                          print("Selected: $archivesPath");
                        },
                      ),
                    ),
                    // pie chart
                    StoragePieChart(),
                    // space info
                    StorageSpaceInfo(),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
