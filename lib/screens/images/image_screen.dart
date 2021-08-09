import 'dart:io';

import 'package:filemanager/controllers/content-controller/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.parameters["titleValue"].toString(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GetBuilder<ImageController>(
          builder: (controller) {
            return controller.getAllImages!.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          controller.openFileWithDefaultApp(
                              controller.getAllImages!.elementAt(index));
                        },
                        leading: Icon(
                          Icons.image,
                          size: 35.0,
                        ),
                        title: FutureBuilder<File>(
                          future: controller.getAllImages![index].getFile(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!.path.split('/').last,
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: controller.getAllImages!.length,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
