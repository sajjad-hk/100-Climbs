import 'dart:math';

import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradePicker extends StatefulWidget {
  @override
  _GradePickerState createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  double knobAngle = 0;
  final GlobalKey _key = GlobalKey();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onGradeChangeWithKnobMove() {}

  plus(ClimbingRouteState climbingRouteState) {
    setState(() {
      knobAngle += (2 * pi) / climbingRouteState.climbingGradeValues.length;
    });
    climbingRouteState.grade = climbingRouteState.climbingGradeValues[
        Calculator.calculateGradeIndex(
            knobAngle, climbingRouteState.climbingGradeValues.length)];
    _controller.text = climbingRouteState.route.grade;
  }

  minus(ClimbingRouteState climbingRouteState) {
    setState(() {
      knobAngle -= (2 * pi) / climbingRouteState.climbingGradeValues.length;
    });
    climbingRouteState.grade = climbingRouteState.climbingGradeValues[
        Calculator.calculateGradeIndex(
            knobAngle, climbingRouteState.climbingGradeValues.length)];
    _controller.text = climbingRouteState.route.grade;
  }

  setKnobAngle(ClimbingRouteState climbingRouteState) {
    setState(() {
      knobAngle =
          climbingRouteState.climbingGradeValues.indexOf(_controller.text) *
              ((2 * pi) / climbingRouteState.climbingGradeValues.length);
    });
  }

  @override
  void didUpdateWidget(GradePicker oldWidget) {
    final climbingRouteState = Provider.of<ClimbingRouteState>(context);
    _controller.text = climbingRouteState.route.grade;
    super.didUpdateWidget(oldWidget);
    if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    final climbingRouteState = Provider.of<ClimbingRouteState>(context);
    _controller.addListener(() => setKnobAngle(climbingRouteState));
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
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
                        RenderBox box = _key.currentContext.findRenderObject();
                        Offset center = Calculator.calculateCenter(box);
                        double width = box.size.width;
                        setState(() {
                          knobAngle = Calculator.calculateAngle(
                              details.globalPosition, center, width);
                        });
                        climbingRouteState.grade = climbingRouteState
                                .climbingGradeValues[
                            Calculator.calculateGradeIndex(knobAngle,
                                climbingRouteState.climbingGradeValues.length)];
                        _controller.text = climbingRouteState.route.grade;
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff29000000),
                                blurRadius: 4.0,
                                spreadRadius: 2.5,
                                offset: Offset(0.0, 2.0)),
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff29000000),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () => minus(climbingRouteState),
                  child: Container(
                    width: 60,
                    height: 60,
                    child: CustomIcon(
                      path: 'assets/icons/minus-icon.png',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 90,
                  child: TextField(
                    enableInteractiveSelection: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (String value) {
                      climbingRouteState.grade = climbingRouteState
                              .climbingGradeValues[
                          Calculator.calculateGradeIndex(knobAngle,
                              climbingRouteState.climbingGradeValues.length)];
                    },
                    controller: _controller,
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => plus(climbingRouteState),
                  child: Container(
                    width: 60,
                    height: 60,
                    child: CustomIcon(
                      path: 'assets/icons/plus-icon.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Calculator {
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
}
