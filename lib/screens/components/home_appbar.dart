import 'package:flutter/material.dart';

class HomeAppBar {
  static primaryAppBar(String title, int tabLength) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.grey[700]),
      ),

      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(
            Icons.apps_outlined,
            color: Colors.grey[700],
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey[700],
          ),
          onPressed: (){},
          // onPressed: () => showSearch(
          //   context: context,
          //   delegate: Data_Search(),
          // ),
        ),
      ],
      // TabBar Scection
      bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xFFFB7955),
          ),
          tabs: [
            Tab(
              text: "Storage",
            ),
            Tab(
              text: "Files",
            )
          ]),
    );
  }
}
