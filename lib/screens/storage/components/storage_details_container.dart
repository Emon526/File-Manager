import 'package:flutter/material.dart';

class StorageDetailsContainer extends StatelessWidget {
  final String title;
  final double data;
  final Color color;
  const StorageDetailsContainer({required this.title, required this.data, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                title,
              ),
              SizedBox(
                height: 5,
              ),
              Text("$data GB"),
            ],
          ),
        ],
      ),
    );
  }
}
