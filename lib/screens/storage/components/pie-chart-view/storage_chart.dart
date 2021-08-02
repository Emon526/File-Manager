import 'package:filemanager/helpers/config/pie_chart_paint.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';

class StoragePieChart extends StatelessWidget {
  final double? usedData;
  final double? freeData;
  const StoragePieChart(
      {required this.usedData, required this.freeData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalSpace = usedData! + freeData!;
    int usedPercent = ((usedData! / totalSpace) * 100).toInt();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.height * 0.020,
      ),
      child: Center(
        child: CustomPaint(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleLineText(text: "$usedPercent"),
                    SingleLineText(text: "%"),
                  ],
                ),
                SingleLineText(text: "Used"),
              ],
            ),
          ),
          foregroundPainter: PieChartPaint(usedData, freeData, 40.0),
        ),
      ),
    );
  }
}
