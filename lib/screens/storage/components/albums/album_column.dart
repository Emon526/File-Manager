import 'package:flutter/material.dart';

class AlbumsColumn extends StatelessWidget {
  final String imagePath;
  final String titile;
  const AlbumsColumn({required this.titile, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFBBC8F8)),
            child: Image.asset(
              imagePath,

              fit: BoxFit.cover,
              // color: Colors.grey[400],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            titile,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
