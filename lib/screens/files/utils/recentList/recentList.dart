import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/text/string.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:filemanager/screens/files/utils/recentList/recentFileWidget.dart';
import 'package:flutter/material.dart';

class RecentList extends StatelessWidget {
  const RecentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
            child:
                sText(RecentFileT, AppColor.titleColor, 17.0, FontWeight.bold)),
        Container(
          height: 100.0,
          width: size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 9 ? 15.0 : 0.0),
                  child: RecentFileItemWidger(
                    imageUrl: "assets/images/testimage.jpg",
                    title: "Nature",
                    isVideo: true,
                    tap: () {},
                  ),
                );
              }),
        )
      ],
    );
  }
}
