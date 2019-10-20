import 'package:climbing_logbook/src/climbingRouteWizard/gradePicker/gradePicker.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              WizardPageTitle(
                title: 'Scale and Grade',
              ),
            ],
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
