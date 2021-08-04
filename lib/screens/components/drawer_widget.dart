import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text("Theme mode"),
              trailing: Icon(Icons.bedtime),
              onTap: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
              },
            ),
            ListTile(
              title: Text("About"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}





