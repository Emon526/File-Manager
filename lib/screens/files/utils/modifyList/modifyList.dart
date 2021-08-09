import 'dart:io';
import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/screens/files/utils/modifyList/modyfylistitemWidget.dart';
import 'package:flutter/material.dart';
import 'package:file_manager/file_manager.dart';
import 'package:get/get.dart';

class ModifyList extends StatelessWidget {
  const ModifyList({Key? key, required this.controller}) : super(key: key);
  final FileManagerController controller;

  @override
  Widget build(BuildContext context) {
    List<FileSystemEntity> entities;
    FileSystemEntity entity;
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
            entities = snapshot;
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
              itemCount: entities.length > 0 ? entities.length : 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0),
              itemBuilder: (context, index) {
                entity = entities[index];
                return GestureDetector(
                  onTap: () async {
                    print("folder clicked");
                    if (FileManager.isDirectory(entity)) {
                      // open the folder
                      controller.openDirectory(entity);
                    } else {
                      Get.find<StorageController>()
                          .openFileWithDefaultApp(entities.elementAt(index));
                    }
                  },
                  child: ModifyListItemWidget(
                    entity: entity,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
