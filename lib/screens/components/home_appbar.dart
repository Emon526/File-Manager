import 'package:flutter/material.dart';

class HomeAppBar {
  static primaryAppBar(String title, int tabLength) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
      bottom: TabBar(
        
        tabs: [
          Tab(
            text: "Storage",
          ),
          Tab(
            text: "Files",
          ),
        ],
      ),
    );
  }
}
