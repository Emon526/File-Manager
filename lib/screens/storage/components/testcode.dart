import 'package:flutter/material.dart';

const CETAGORIES = [
  {
    'image': 'images/Images.png',
    'name': 'Images',
  },
  {'image': 'images/Vedio.png', 'name': 'Video'},
  {'image': 'images/Document.png', 'name': 'Document'},
  {'image': 'images/Audio.png', 'name': 'Audio'},
  {'image': 'images/Apps.png', 'name': 'Apps'},
  {'image': 'images/Archives.png', 'name': 'Archives'},
  {'image': 'images/download.png', 'name': 'Download'},
  {'image': 'images/All.png', 'name': 'All'},
];

class StorageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(flex: 5, child: Container()),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFF1F1F3)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 25, 5, 25),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: CETAGORIES
                      .map(
                        (category) => Container(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFBBC8F8)),
                                child: Image.asset(
                                  "${category['image']}",
                                  height: 40,
                                  // color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${category['name']}',
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
