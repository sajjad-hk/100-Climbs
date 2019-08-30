import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customRadio.dart';

class Belay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final climbingRouteState = Provider.of<ClimbingRouteState>(context);

    return Column(
      children: <Widget>[
        WizardPageTitle(
          title: 'Belay',
        ),
        Flexible(
          child: Container(),
        ),
        Flexible(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.row(
                      label: 'Lead',
                      fontSize: 18,
                      value: BelayingStyleEnum.valueOf('lead'),
                      groupValue: climbingRouteState.route.belayingStyle,
                      iconSize: 40,
                      iconProvider: LogBookIcons.lead,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (dynamic val) {
                        climbingRouteState.belayingStyle = val.toString();
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.row(
                      label: 'Auto',
                      fontSize: 18,
                      value: BelayingStyleEnum.valueOf('auto'),
                      groupValue: climbingRouteState.route.belayingStyle,
                      iconSize: 40,
                      iconProvider: LogBookIcons.auto,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (dynamic val) {
                        climbingRouteState.belayingStyle = val.toString();
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.row(
                      label: 'Toprope',
                      fontSize: 18,
                      value: BelayingStyleEnum.valueOf('toprope'),
                      groupValue: climbingRouteState.route.belayingStyle,
                      iconSize: 40,
                      iconProvider: LogBookIcons.toprope,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (dynamic val) {
                        climbingRouteState.belayingStyle = val.toString();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
