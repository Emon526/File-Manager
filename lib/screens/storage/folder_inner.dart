import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';

class FolderInner extends StatelessWidget {
  final FileManagerController controller = FileManagerController();
  final FileSystemEntity folderPath;
  final baseStorage;
  FolderInner({required this.folderPath, this.baseStorage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FileManager.basename(folderPath)),
      ),
      body: FutureBuilder<List<Directory>>(
        future: FileManager.getStorageList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            snapshot.data!.forEach((element) {
              if (FileManager.basename(element) ==
                  FileManager.basename(baseStorage)) {
                print("Same storage: $element");
                controller.openDirectory(element);
              }
              // print("Storage: $element");
            });
            return Container(
              child: FileManager(
                controller: controller,
                builder: (context, snapshot) {
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
                              ? Icon(Icons.feed_outlined)
                              : Icon(Icons.folder),
                          title: Text(FileManager.basename(entities[index])),
                          onTap: () {
                            if (FileManager.isDirectory(entities[index])) {
                              controller.openDirectory(
                                  entities[index]); // open directory
                            } else {
                              // Perform file-related tasks.
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
