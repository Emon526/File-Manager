import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:popup_menu_title/popup_menu_title.dart';

class MenuAre extends StatelessWidget {
  const MenuAre({Key? key}) : super(key: key);

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
          _buildMenuButton()
        ],
      ),
    );
  }

  Widget _buildMenuButton() {
    return PopupMenuButton(
      color: AppColor.primaryButtonTextColor,
      onSelected: (selcted) {
        print(selcted);
      },
      icon: const Icon(Icons.menu),
      tooltip: 'Show menu',
      itemBuilder: (context) => [
        PopupMenuTitle(
          title: 'Select',
          overflow: TextOverflow.fade,
          // The text style below is the default style, but is specified
          // here as an example of how to do so.
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        PopupMenuItem<Never>(child: const Text('name')),
        PopupMenuItem<Never>(child: const Text('size')),
        PopupMenuItem<Never>(child: const Text('date')),
      ],
    );
  }
}
