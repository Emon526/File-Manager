<<<<<<< HEAD
import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/screens/files/utils/menu/menubar.dart';
import 'package:filemanager/screens/files/utils/modifyList/modifyList.dart';
import 'package:filemanager/screens/files/utils/recentList/recentList.dart';
import 'package:flutter/material.dart';

class FileScreen extends StatelessWidget {
  const FileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 8.0),
          height: 54.0,
          child: Icon(Icons.add, color: AppColor.whitColor),
          width: 54.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColor.orangeColor,
          ),
        ),
        body: screenBody(size));
  }

  Widget screenBody(size) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //recent file listveiw
                  RecentList(),
                  //Modify Item Menu
                  MenuAre(),
                  //Modify Graidview

                  ModifyList(),
                  SizedBox(
                    height: 14.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class FileScreen extends StatelessWidget {
  const FileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
>>>>>>> 511ce1d194a7d834c3aa9e4f34a2febf9f7966c4
