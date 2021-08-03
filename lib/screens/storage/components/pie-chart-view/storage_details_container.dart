import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class StorageDetailsContainer extends StatelessWidget {
  final String? title;
  final RxDouble data;
  final Color? color;
  StorageDetailsContainer(
      {required this.title, required this.data, required this.color, Key? key})
      : super(key: key);

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
                title!,
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Text("${data.toStringAsFixed(2)}GB"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
