import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/files/utils/menu/menubar.dart';
import 'package:filemanager/screens/files/utils/modifyList/modifyList.dart';
import 'package:filemanager/screens/files/utils/recentList/recentList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileScreen extends StatelessWidget {
  FileScreen({Key? key}) : super(key: key);
  final FileManagerController controller = FileManagerController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          if (await controller.isRootDirectory()) {
            return true;
          } else {
            controller.goToParentDirectory();
            return false;
          }
        },
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: GestureDetector(
              onTap: () {
                createFolder(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8.0),
                height: 54.0,
                child: Icon(Icons.add, color: AppColor.secondaryButtonBgColor),
                width: 54.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColor.primaryButtonBgColor,
                ),
              ),
            ),
            body: screenBody(size)));
  }

  Widget screenBody(size) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //recent file listveiw
                  RecentList(),
                  //Modify Item Menu
                  MenuAre(),
                  //Modify Graidview

                  ModifyList(),
                  SizedBox(
                    height: 14.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//create folder dialog

  createFolder(BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        TextEditingController folderName = TextEditingController();
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text(
                      //   "New Folder",
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(
                      //     color: AppColor.orangeColor,
                      //   ),
                      // ),
                      TextField(
                        decoration: InputDecoration(hintText: 'New folder'),
                        textAlign: TextAlign.start,
                        controller: folderName,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                        print("Back");
                      },
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                          color: AppColor.primaryButtonBgColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        try {
                          print("add");
                          print(context);
                          // Create Folder
                          await FileManager.createFolder(
                              controller.getCurrentPath, folderName.text);

                          // Open Created Folder
                          controller.setCurrentPath =
                              controller.getCurrentPath + "/" + folderName.text;
                        } catch (e) {
                          print(e);
                        }

                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: AppColor.primaryButtonBgColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
