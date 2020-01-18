import 'dart:math';
import 'package:hundred_climbs/src/assets-content/constants.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

enum GradeAction { minus, plus }

class GradePicker extends StatefulWidget {
  @override
  _GradePickerState createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  double knobAngle;
  final GlobalKey _key = GlobalKey();

  static calculateAngle(Offset pos, Offset center, double width) {
    return atan2(pos.dy - (center.dy + width / 2),
            pos.dx - (center.dx + width / 2)) +
        pi / 2;
  }

  static calculateCenter(RenderBox box) {
    return Offset(
        -box.globalToLocal(Offset.zero).dx, -box.globalToLocal(Offset.zero).dy);
  }

  static calculateGradeIndex(double knobAngle, int length) {
    if (knobAngle < 0) {
      knobAngle += 2 * pi;
    }
    if (knobAngle > 2 * pi) {
      knobAngle -= 2 * pi;
    }
    return (knobAngle / ((2 * pi) / length)).floor();
  }

  onAction(BuildContext context, [GradeAction action]) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    List<String> grades = Constants.grades[GradingStyleEnum.french];
    int indexOfGrade = grades.indexOf(climb.grade);
    double newKnobAngle;
    if (action == GradeAction.minus) {
      indexOfGrade = (--indexOfGrade % grades.length);
    }
    if (action == GradeAction.plus) {
      indexOfGrade = ++indexOfGrade % grades.length;
    }
    store.updateClimb(climb.rebuild((c) => c..grade = grades[indexOfGrade]));
    newKnobAngle = indexOfGrade * 2 * pi / grades.length;
    setState(() => knobAngle = newKnobAngle);
  }

  onKnobDrag(BuildContext context, Offset globalPosition) {
    final store = Provider.of<Store>(context);
    RenderBox box = _key.currentContext.findRenderObject();
    Offset center = calculateCenter(box);
    double width = box.size.width;
    setState(
      () => knobAngle = calculateAngle(globalPosition, center, width),
    );
    List<String> grades = Constants.grades[GradingStyleEnum.french];
    store.updateClimb(store.climb.rebuild((c) =>
        c..grade = grades[calculateGradeIndex(knobAngle, grades.length)]));
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    List<String> grades = Constants.grades[GradingStyleEnum.french];
    int indexOfGrade = grades.indexOf(climb.grade);
    knobAngle = indexOfGrade * 2 * pi / grades.length;
    return Container(
      padding: const EdgeInsets.all(10),
      key: _key,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Transform.rotate(
              angle: knobAngle,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xff4d000000),
                        width: 8.0,
                      ),
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      onHorizontalDragUpdate: (DragUpdateDetails details) {
                        onKnobDrag(context, details.globalPosition);
                      },
                      child: Knob(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: GradePickerControllers(
              grade: climb.grade,
              onMinus: () => onAction(context, GradeAction.minus),
              onPlus: () => onAction(context, GradeAction.plus),
            ),
          ),
        ],
      ),
    );
  }
}
