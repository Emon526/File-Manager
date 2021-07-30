import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StoragePieChart extends StatelessWidget {
  StoragePieChart({Key? key}) : super(key: key);

  final Map<String, double> dataMap = {
    "Available": 9,
    "Used": 5,
  };
  final List<Color> colorList = [
    Colors.grey,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 50,
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      centerText: "38%\nUsed",
      legendOptions: LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
      ),
      ringStrokeWidth: 32,
      emptyColor: Colors.white,
    );

    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= 600) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: chart,
                ),
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: chart,
                  margin: EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}




// Custom pie chart 

// import 'package:filemanager/helpers/pie_chart_paint.dart';
// import 'package:flutter/material.dart';

// class StoragePieChart extends StatelessWidget {
//   const StoragePieChart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: LayoutBuilder(
//         builder: (context, constrant) => Center(
//           child: SizedBox(
//             width: constrant.maxWidth * 0.6,
//             child: CustomPaint(
//               child: Center(),
//               foregroundPainter: PieChartPaint(
//                 width: constrant.maxWidth * 0.2,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
