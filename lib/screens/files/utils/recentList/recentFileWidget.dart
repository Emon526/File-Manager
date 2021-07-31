import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';

class RecentFileItemWidger extends StatelessWidget {
  const RecentFileItemWidger(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.isVideo,
      required this.tap})
      : super(key: key);
  final String imageUrl;
  final String title;
  final bool isVideo;
  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      onLongPress: tap,
      child: Container(
        margin: EdgeInsets.only(left: 14.0, bottom: 9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4.0),
                  width: 66.0,
                  height: 66.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                isVideo
                    ? Positioned(
                        left: 20.0,
                        top: 20.0,
                        child: Container(
                          height: 25.0,
                          alignment: Alignment.center,
                          width: 25.0,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryButtonBgColor.withOpacity(0.4),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            // sText(title, AppColor.titleColor, 14.0, FontWeight.w500)
            SingleLineText(
              text: title,
              isTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}
