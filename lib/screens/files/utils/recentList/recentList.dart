import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:filemanager/helpers/text/string.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:filemanager/screens/files/utils/recentList/recentFileWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentList extends StatelessWidget {
  const RecentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // StorageController controller = Get.put(StorageController());
    return GetBuilder<StorageController>(builder: (controller) {
      return controller.isDataAvailable()
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
                  child: SingleLineText(
                    text: RecentFileT,
                  ),
                ),
                // sText(RecentFileT, AppColor.titleColor, 17.0, FontWeight.bold)),
                Container(
                    height: 100.0,
                    width: size.width,
                    child: ListView.builder(
                        reverse: true,
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.recentList.length,
                        itemBuilder: (context, index) {
                          String title = controller.recentList[index].path
                              .split("/")
                              .last
                              .split(".")
                              .first
                              .split("_")
                              .first
                              .split("-")
                              .first;

                          bool isVideo = false;
                          String imageUrl;
                          String temp =
                              controller.recentList[index].path.split("/").last;
                          if (temp.contains(".mp4")) {
                            isVideo = true;
                          }

                          if (temp.contains(".jpg") || temp.contains(".png")) {
                            imageUrl = "assets/icons/Images.png";
                          } else if (temp.contains(".doc") ||
                              temp.contains(".pdf") ||
                              temp.contains(".txt") ||
                              temp.contains(".ppt")) {
                            imageUrl = "assets/icons/Document.png";
                          } else if (temp.contains(".mp4")) {
                            imageUrl = "assets/icons/Vedio.png";
                          } else if (temp.contains(".mp3") ||
                              temp.contains(".mve")) {
                            imageUrl = "assets/icons/Audio.png";
                          } else if (temp.contains(".apk")) {
                            imageUrl = "assets/icons/Apps.png";
                          } else {
                            imageUrl = "assets/icons/files.png";
                          }

                          return Padding(
                            padding: EdgeInsets.only(
                                right: index + controller.recentList.length ==
                                        controller.recentList.length
                                    ? 15.0
                                    : 0.0),
                            child: controller.recentList.length > 0
                                ? RecentFileItemWidger(
                                    imageUrl: imageUrl,
                                    title: title,
                                    isVideo: isVideo,
                                    tap: () {
                                      controller.recentopenFileWithDefaultApp(
                                          controller.recentList[index].path);
                                    },
                                  )
                                : SingleLineText(text: "Nothing"),
                          );
                        }))
              ],
            )
          : Container();
    });
  }
}
