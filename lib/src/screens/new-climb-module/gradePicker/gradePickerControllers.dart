import 'package:flutter/rendering.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

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
              color: Colors.black38,
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
                  color: Colors.black12,
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
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
