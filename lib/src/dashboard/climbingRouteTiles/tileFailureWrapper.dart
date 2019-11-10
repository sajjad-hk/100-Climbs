import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/commons/dashLinePainter.dart';
import 'package:flutter/material.dart';

class FailureTileWrapper extends StatelessWidget {
  final Widget tileContent;
  FailureTileWrapper({this.tileContent});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        strokeWidth: 2.0,
        color: AppColors.coolGrey,
        dashLength: 4.5,
        skipLength: 3.0,
      ),
      child: tileContent,
    );
  }
}
