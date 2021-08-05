import 'package:filemanager/controllers/content-controller/image_controller.dart';
import 'package:filemanager/screens/photos/components/thumbnail_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotoScreen extends StatelessWidget {
  final String title;
  const PhotoScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: GetBuilder<ImageController>(
          builder: (controller) {
            return controller.getAllImages!.isNotEmpty
                // ? GridView.count(
                //     crossAxisCount: 3,
                //     mainAxisSpacing: 1.0,
                //     crossAxisSpacing: 1.0,
                //     children: <Widget>[
                //       ...?controller.getAllImages?.map(
                //         (medium) => GestureDetector(
                //           // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //           //     builder: (context) => ViewerPage(medium))),
                //           child: Container(
                //             color: Colors.grey[300],
                //             child: medium.id.isNotEmpty ?  FadeInImage(
                //               fit: BoxFit.cover,
                //               placeholder: MemoryImage(kTransparentImage),
                //               image: ThumbnailProvider(
                //                 mediumId: medium.id,
                //                 mediumType: medium.mediumType,
                //                 highQuality: true,
                //               ),
                //             ): Text("data"),
                //           ),
                //         ),
                //       ),
                //     ],
                //   )
                ? GridView.builder(
                    itemCount: controller.getAllImages!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print("Image clicked");
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          color: Colors.red,
                          child: ThumbnailGet(
                            medium: controller.getAllImages![index],
                          ),
                          // child: FadeInImage(
                          //   fit: BoxFit.cover,
                          //   placeholder: MemoryImage(kTransparentImage),
                          //   image: ThumbnailProvider(
                          //     mediumId: controller.getAllImages![index].id,
                          //     mediumType:
                          //         controller.getAllImages![index].mediumType,
                          //     height: 100,
                          //     width: 100,
                          //     highQuality: true,
                          //   ),
                          // ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("no images"),
                  );
          },
        ),
        // child: Column(
        //   children: [
        //     Center(
        //       child: Obx(
        //         () => Text(
        //           Get.find<ImageController>().count.toString(),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.find<ImageController>().countUpdate();
        },
      ),
    );
  }
}
