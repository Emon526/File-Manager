import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PieChartPaint extends CustomPainter {
  double width;
  PieChartPaint({required this.width});

  List<ChartModel> spaceDetails = [
    ChartModel(name: 'Available', space: 200),
    ChartModel(name: 'Used', space: 400),
  ];

  final List<Color> colorList = [
    Colors.grey,
    Colors.deepOrange,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 2;

    double total = 0;

    spaceDetails.forEach((element) => total += element.space);

    double startRadian = pi / 2;

    for (int index = 0; index < spaceDetails.length; index++) {
      var currentSpace = spaceDetails.elementAt(index);

      var sweepRadian = currentSpace.space / total * 2 * pi;

      paint.color = colorList.elementAt(index);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ChartModel {
  final String? name;
  final double space;
  ChartModel({required this.name, required this.space});
}
