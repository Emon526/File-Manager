import 'package:file_manager/file_manager.dart';
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';

class MenuAre extends StatelessWidget {
  const MenuAre({Key? key, required this.controller}) : super(key: key);
  final FileManagerController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(15.0),
      width: size.width,
      // color: AppColor.orangeColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding:
                EdgeInsets.only(left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: AppColor.primaryButtonTextColor),
            child: Row(
              children: [
                // sText("Modified", AppColor.titleColor, 17.0, FontWeight.bold),
                SingleLineText(
                  text: "Modified",
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: AppColor.primaryTextColor,
                  size: 14.0,
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () => sort(context),
              icon: Icon(
                Icons.menu,
                color: AppColor.primaryTextColor,
              ))
        ],
      ),
    );
  }

  sort(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  title: Text("Name"),
                  onTap: () {
                    controller.sortedBy = SortBy.name;
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Size"),
                  onTap: () {
                    controller.sortedBy = SortBy.size;
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Date"),
                  onTap: () {
                    controller.sortedBy = SortBy.date;
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("type"),
                  onTap: () {
                    controller.sortedBy = SortBy.type;
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
