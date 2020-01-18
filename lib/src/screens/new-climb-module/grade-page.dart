import 'package:flutter/rendering.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        WizardPageTitle(
          title: 'Grade',
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: GradePicker(),
        ),
      ],
    );
  }
}
