import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/storage/components/storage_chart.dart';
import 'package:filemanager/screens/storage/components/storage_space_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<StorageController>(
      builder: (controller) => SafeArea(
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
                      DropdownButton<int>(
                        value: 0,
                        items: [
                          DropdownMenuItem(
                            child: Text("Internal"),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("External"),
                            value: 1,
                          ),
                        ],
                        onChanged: (val) {
                          print("Selected: $val");
                        },
                      ),
                      // SizedBox(
                      //   height: height * 0.03,
                      // ),
                      StoragePieChart(
                        freeData: controller.getFreeSpace(),
                        usedData: controller.getUsedSpace(),
                      ),
                      // SizedBox(
                      //   height: height * 0.03,
                      // ),
                      StorageSpaceInfo(
                        freeData: controller.getFreeSpace(),
                        usedData: controller.getUsedSpace(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                child: Placeholder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
