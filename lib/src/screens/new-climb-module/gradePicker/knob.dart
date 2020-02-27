import 'package:flutter/material.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';

class Knob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screens['PAGE_GRADE']['KNOB_SIZE']
          [LayoutUtils(context).screenSize],
      height: screens['PAGE_GRADE']['KNOB_SIZE']
          [LayoutUtils(context).screenSize],
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: screens['PAGE_GRADE']['INNER_KNOB_SIZE']
              [LayoutUtils(context).screenSize],
          height: screens['PAGE_GRADE']['INNER_KNOB_SIZE']
              [LayoutUtils(context).screenSize],
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
                spreadRadius: 3.0,
                offset: Offset(0.0, 1.0),
              ),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
