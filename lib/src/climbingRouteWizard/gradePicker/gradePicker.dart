import 'dart:math';
import 'package:climbing_logbook/src/climbingRouteWizard/gradePicker/gradePickerControllers.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/gradePicker/knob.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/states/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Action { minus, plus }

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

  onAction(WizardState state, [Action action]) {
    List<String> grades = Constants.grades[state.selectedGradingStyle];
    int indexOfGrade = grades.indexOf(state.selectedClimbingGrade);
    double newKnobAngle;
    if (action == Action.minus) {
      indexOfGrade = (--indexOfGrade % grades.length);
    }
    if (action == Action.plus) {
      indexOfGrade = ++indexOfGrade % grades.length;
    }
    state.selectedClimbingGrade = grades[indexOfGrade];
    newKnobAngle = indexOfGrade * 2 * pi / grades.length;
    setState(() => knobAngle = newKnobAngle);
  }

  onKnobDrag(Offset globalPosition, WizardState state) {
    RenderBox box = _key.currentContext.findRenderObject();
    Offset center = calculateCenter(box);
    double width = box.size.width;
    setState(
      () => knobAngle = calculateAngle(globalPosition, center, width),
    );
    List<String> grades = Constants.grades[state.selectedGradingStyle];
    state.selectedClimbingGrade =
        grades[calculateGradeIndex(knobAngle, grades.length)];
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);
    List<String> grades = Constants.grades[state.selectedGradingStyle];
    int indexOfGrade = grades.indexOf(state.selectedClimbingGrade);
    knobAngle = indexOfGrade * 2 * pi / grades.length;
    return Container(
      padding: const EdgeInsets.all(5),
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
                        onKnobDrag(details.globalPosition, state);
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
              grade: state.selectedClimbingGrade,
              onMinus: () => onAction(state, Action.minus),
              onPlus: () => onAction(state, Action.plus),
            ),
          ),
        ],
      ),
    );
  }
}
