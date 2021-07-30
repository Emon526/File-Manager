import 'package:filemanager/screens/storage/components/space_test.dart';
import 'package:filemanager/screens/storage/components/storage_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          // storage pie chart
          Expanded(
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
                StoragePieChart(),
              ],
            ),
          ),

          ElevatedButton(onPressed: (){
            Get.to(MyApp());
          }, child: Text("Files"),),

          Card(
            // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            child: Text("All albums"),
          ),
        ],
      ),
    );
  }
}
