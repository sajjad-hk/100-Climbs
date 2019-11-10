import 'package:hundred_climbs/src/climbingRouteWizard/gradePicker/gradePicker.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/pageTitle.dart';
import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: WizardPageTitle(
            title: 'Grade',
          ),
        ),
        Flexible(
          flex: 4,
          child: GradePicker(),
        ),
      ],
    );
  }
}
