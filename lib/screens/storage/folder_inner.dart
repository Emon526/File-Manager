import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class FolderInner extends StatelessWidget {
  const FolderInner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    // onWillPop: () async {
    //   if (await Get.find<StorageController>()
    //       .fileManagerController
    //       .isRootDirectory()) {
    //     return true;
    //   } else {
    //     Get.find<StorageController>()
    //         .fileManagerController
    //         .goToParentDirectory();
    //     return false;
    //   }
    // },
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<String>(
          valueListenable:
              Get.find<StorageController>().fileManagerController.titleNotifier,
          builder: (context, title, _) => Text(title),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await Get.find<StorageController>()
                .fileManagerController
                .goToParentDirectory();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: FileManager(
          controller: Get.find<StorageController>().fileManagerController,
          builder: (context, snapshot) {
            final List<FileSystemEntity> entities = snapshot;
            return ListView.builder(
              itemCount: entities.length,
              itemBuilder: (context, index) {
                FileSystemEntity entity = entities[index];
                return Card(
                  child: ListTile(
                    leading: FileManager.isFile(entity)
                        ? Icon(Icons.feed_outlined)
                        : Icon(Icons.folder),
                    title: Text(FileManager.basename(entity)),
                    subtitle: subtitle(entity),
                    onTap: () async {
                      if (FileManager.isDirectory(entity)) {
                        // open the folder
                        Get.find<StorageController>()
                            .fileManagerController
                            .openDirectory(entity);

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
