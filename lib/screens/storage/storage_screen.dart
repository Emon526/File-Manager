import 'dart:io';
import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/storage/components/albums/album_column.dart';

import 'package:filemanager/screens/storage/components/pie-chart-view/storage_chart.dart';
import 'package:filemanager/screens/storage/components/pie-chart-view/storage_space_info.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
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
              child: Container(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: AppColor.secondaryAppColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().imagesFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Images",
                              imagePath: "assets/images/Images.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().videoFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Video",
                              imagePath: "assets/images/Vedio.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().documentsFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Documents",
                              imagePath: "assets/images/Document.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().audioFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Audio",
                              imagePath: "assets/images/Audio.png",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().appsFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Apps",
                              imagePath: "assets/images/Apps.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().archivesFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Archives",
                              imagePath: "assets/images/Archives.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().downloadFolder();
                            },
                            child: AlbumsColumn(
                              titile: "Download",
                              imagePath: "assets/images/download.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<StorageController>().allFolder();
                            },
                            child: AlbumsColumn(
                              titile: "All",
                              imagePath: "assets/images/All.png",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
