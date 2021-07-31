import 'package:filemanager/screens/storage/components/storage_chart.dart';
import 'package:filemanager/screens/storage/components/storage_space_info.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double freeData = 2.0;
    double usedData = 3.0;
    return SafeArea(
      child: Column(
        children: [
          // storage pie chart
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
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
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Expanded(
                    child: StoragePieChart(
                      freeData: freeData,
                      usedData: usedData,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  StorageSpaceInfo(
                    freeData: freeData,
                    usedData: usedData,
                  ),
                ],
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
    );
  }
}
