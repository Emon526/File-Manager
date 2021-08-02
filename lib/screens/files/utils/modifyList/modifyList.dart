import 'dart:io';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:file_manager/file_manager.dart';

class ModifyList extends StatelessWidget {
  // const ModifyList({Key? key}) : super(key: key);
  final FileManagerController controller = FileManagerController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.isRootDirectory()) {
          return true;
        } else {
          controller.goToParentDirectory();
          return false;
        }
      },
      child: Expanded(
          child: FileManager(
              controller: controller,
              builder: (context, snapshot) {
                final List<FileSystemEntity> entities = snapshot;
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
                  itemCount: entities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0),
                  itemBuilder: (context, index) {
                    FileSystemEntity entity = entities[index];
                    return GestureDetector(
                      onTap: () async {
                        print("folder clicked");
                        if (FileManager.isDirectory(entity)) {
                          // open the folder
                          controller.openDirectory(entity);

                          // delete a folder
                          // await entity.delete(recursive: true);

                          // rename a folder
                          // await entity.rename("newPath");

                          // Check weather folder exists
                          // entity.exists();

                          // get date of file
                          // DateTime date = (await entity.stat()).modified;
                        } else {
                          // delete a file
                          // await entity.delete();

                          // rename a file
                          // await entity.rename("newPath");

                          // Check weather file exists
                          // entity.exists();

                          // get date of file
                          // DateTime date = (await entity.stat()).modified;

                          // get the size of the file
                          // int size = (await entity.stat()).size;
                        }
                      },
                      child: Container(
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
                              // sText("4k Movies", AppColor.titleColor, 18.0,
                              //     FontWeight.bold),
                              SingleLineText(
                                text: FileManager.basename(entity),
                              ),

                              // sText("911 item", AppColor.titleColor, 14.0, FontWeight.normal)
                              // SingleLineText(
                              //   text: subtitle(entity),
                              //   isTitle: false,
                              // ),
                              // ListTile(
                              //   leading: FileManager.isFile(entity)
                              //       ? Icon(Icons.feed_outlined)
                              //       : Icon(Icons.folder),
                              //   title: Text(FileManager.basename(entity)),
                              //   subtitle: subtitle(entity),
                              //   onTap: () async {
                              //     if (FileManager.isDirectory(entity)) {
                              //       // open the folder
                              //       controller.openDirectory(entity);

                              //       // delete a folder
                              //       // await entity.delete(recursive: true);

                              //       // rename a folder
                              //       // await entity.rename("newPath");

                              //       // Check weather folder exists
                              //       // entity.exists();

                              //       // get date of file
                              //       // DateTime date = (await entity.stat()).modified;
                              //     } else {
                              //       // delete a file
                              //       // await entity.delete();

                              //       // rename a file
                              //       // await entity.rename("newPath");

                              //       // Check weather file exists
                              //       // entity.exists();

                              //       // get date of file
                              //       // DateTime date = (await entity.stat()).modified;

                              //       // get the size of the file
                              //       // int size = (await entity.stat()).size;
                              //     }
                              //   },
                              // ),
                            ]),
                      ),
                    );
                  },
                );
              })),
    );
  }
}
