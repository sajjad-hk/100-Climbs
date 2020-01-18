import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter(
      {@required this.strokeWidth,
      @required this.color,
      this.dashLength,
      this.skipLength,
      this.sides})
      : super() {
    if (this.sides == null)
      this.sides = SideBorders(
          leftSide: true, rightSide: true, topSide: true, bottomSide: true);
  }

  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double skipLength;
  SideBorders sides;

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    double start = strokeWidth / 2;
//    double end = size.height + strokeWidth;
    double step = dashLength + skipLength;
    for (double i = -start; i < size.height; i += step) {
      Offset beginLeft = Offset(0, i);
      Offset finishLeft = Offset(0, i + dashLength);
      Offset beginRight = Offset(size.width, i);
      Offset finishRight = Offset(size.width, i + dashLength);
      if (sides.leftSide) canvas.drawLine(beginLeft, finishLeft, dashPaint);
      if (sides.rightSide) canvas.drawLine(beginRight, finishRight, dashPaint);
    }

    for (double i = 0; i < size.width; i += step) {
      Offset beginTop = Offset(i, 0);
      Offset finishTop = Offset(
          i + dashLength > size.width ? size.width + start : i + dashLength, 0);
      Offset beginBottom = Offset(i, size.height);
      Offset finishBottom = Offset(
          i + dashLength > size.width ? size.width + start : i + dashLength,
          size.height);
      if (sides.topSide) canvas.drawLine(beginTop, finishTop, dashPaint); // top
      if (sides.bottomSide)
        canvas.drawLine(beginBottom, finishBottom, dashPaint); // down
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SideBorders {
  bool leftSide;
  bool rightSide;
  bool topSide;
  bool bottomSide;

  SideBorders({this.bottomSide, this.leftSide, this.rightSide, this.topSide});
}
