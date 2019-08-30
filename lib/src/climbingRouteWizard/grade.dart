import 'dart:core';
import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/customRadio.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/gradePicker.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/enums.dart';

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final climbingRouteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<ClimbingLogBookUser>(context);
    return Column(
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                WizardPageTitle(
                  title: 'Scale and Grade',
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewCustomRadio.row(
                              value: GradingStyleEnum.valueOf('french'),
                              groupValue: climbingRouteState.route.gradingStyle,
                              label: 'French',
                              fontSize: 18,
                              checkedContentColor: Colors.white,
                              checkedBgColor: Color(0xff4d000000),
                              unCheckedBgColor: Colors.transparent,
                              onChanged: (val) {
                                climbingRouteState.gradingStyle =
                                    val.toString();
                                climbingRouteState.grade =
                                    climbingRouteState.climbingGradeValues[0];
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewCustomRadio.row(
                              value: GradingStyleEnum.valueOf('polish'),
                              groupValue: climbingRouteState.route.gradingStyle,
                              label: 'Polish',
                              fontSize: 18,
                              checkedContentColor: Colors.white,
                              checkedBgColor: Color(0xff4d000000),
                              unCheckedBgColor: Colors.transparent,
                              onChanged: (val) {
                                climbingRouteState.gradingStyle =
                                    val.toString();
                                climbingRouteState.grade =
                                    climbingRouteState.climbingGradeValues[0];
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: GradePicker(),
        ),
      ],
    );
  }
}
