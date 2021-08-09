import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class FolderInner extends StatelessWidget {
  final FileManagerController controller = FileManagerController();
  final FileSystemEntity folderPath;
  final baseStorage;
  FolderInner({required this.folderPath, this.baseStorage, Key? key})
      : super(key: key);

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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              // setting storage name
              FileManager.basename(folderPath) == '0'
                  ? "Internal"
                  : "External"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder<List<Directory>>(
            future: FileManager.getStorageList(), //getting storage list
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                snapshot.data!.forEach((element) {
                  // inserting storage
                  if (FileManager.basename(element) ==
                      FileManager.basename(baseStorage)) {
                    print("Same storage: $element");

                    controller.openDirectory(element);
                  }
                });
                return Container(
                  child: FileManager(
                    controller: controller,
                    builder: (context, snapshot) {
                      // inserting folders of storage in a list as entities
                      List<FileSystemEntity> entities = [];
                      snapshot.forEach((element) {
                        if (FileManager.basename(element) ==
                            FileManager.basename(folderPath)) {
                          entities.add(element);
                        }
                      });
                      if (entities.isEmpty) {
                        entities = snapshot;
                      }
                      return ListView.builder(
                        itemCount: entities.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: FileManager.isFile(entities[index])
                                  ? Get.find<StorageController>().getFileExtention(
                                              entities.elementAt(index)) ==
                                          "app"
                                      ? Icon(
                                          Icons.android,
                                          size: 35.0,
                                        )
                                      : Get.find<StorageController>().getFileExtention(
                                                  entities.elementAt(index)) ==
                                              "image"
                                          ? Icon(
                                              Icons.image,
                                              size: 35.0,
                                            )
                                          : Get.find<StorageController>()
                                                      .getFileExtention(entities
                                                          .elementAt(index)) ==
                                                  "video"
                                              ? Icon(
                                                  Icons.video_collection,
                                                  size: 35.0,
                                                )
                                              : Get.find<StorageController>()
                                                          .getFileExtention(
                                                              entities.elementAt(
                                                                  index)) ==
                                                      "doc"
                                                  ? Icon(
                                                      Icons.text_format,
                                                      size: 35.0,
                                                    )
                                                  : Get.find<StorageController>().getFileExtention(entities.elementAt(index)) ==
                                                          "audio"
                                                      ? Icon(
                                                          Icons.audiotrack,
                                                          size: 35.0,
                                                        )
                                                      : Icon(
                                                          Icons.feed_outlined,
                                                          size: 35.0,
                                                        )
                                  : Icon(
                                      Icons.folder,
                                      size: 35.0,
                                    ),
                              title:
                                  Text(FileManager.basename(entities[index])),
                              onTap: () {
                                if (FileManager.isDirectory(entities[index])) {
                                  controller.openDirectory(
                                      entities[index]); // open directory
                                } else {
                                  print("THis is a: " +
                                      Get.find<StorageController>()
                                          .getFileExtention(
                                              entities.elementAt(index)));
                                  Get.find<StorageController>()
                                      .openFileWithDefaultApp(
                                          entities.elementAt(index));
                                }
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }

              // print("Base: path ${snapshot.data}");
            },
          ),
        ),
      ),
    );
  }
}

Widget subtitle(FileSystemEntity entity) {
  return FutureBuilder<FileStat>(
    future: entity.stat(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (entity is File) {
          int size = snapshot.data!.size;

          return Text(
            "${FileManager.formatBytes(size)}",
          );
        }
        return Text(
          "${snapshot.data!.modified}",
        );
      } else {
        return Text("");
      }
    },
  );
}
