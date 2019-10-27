import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GradePickerControllers extends StatelessWidget {
  final GestureTapCallback onMinus;
  final GestureTapCallback onPlus;
  final String grade;

  GradePickerControllers(
      {@required this.onMinus, @required this.onPlus, @required this.grade});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: onMinus,
          child: Container(
            width: 60,
            height: 60,
            child: CustomIcon(
              path: AppIcons.minus,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          width: 80,
          child: Text(
            grade,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              decoration: TextDecoration.none,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 2.0),
                  blurRadius: 3.0,
                  color: Color(0xff29000000),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: onPlus,
          child: Container(
            width: 60,
            height: 60,
            child: CustomIcon(
              path: AppIcons.plus,
            ),
          ),
        ),
      ],
    );
  }
}
