import 'package:filemanager/controllers/storage-controller/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StorageController storageController = Get.put(StorageController());
    return Drawer(
      child: SafeArea(
          child: Column(
        children: [
         

          ListTile(
              title: Text("Theme mode"),
              trailing: Icon(Icons.bedtime),
              onTap: () {
                if (storageController.isSavedDark()) {
                  storageController.isDarkTheme.value = false;
                  storageController.changeAppTheme(false);
                } else {
                  storageController.isDarkTheme.value = true;
                  storageController.changeAppTheme(true);
                }
              }),

          ListTile(
            title: Text("About"),
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
