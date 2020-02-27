import 'package:flutter/rendering.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
          child: Container(
            margin: screens['PAGE_GRADE']['CIRCLE_MARGIN']
                [LayoutUtils(context).screenSize],
            child: GradePicker(),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }
}
