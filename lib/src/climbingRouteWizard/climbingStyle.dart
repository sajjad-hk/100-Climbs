import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/customRadio.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimbingStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    return Column(
      children: <Widget>[
        WizardPageTitle(
          title: 'Style',
        ),
        Flexible(
          child: Container(),
        ),
        Flexible(
          flex: 5,
          child: Column(
            children: <Widget>[
              Flexible(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.row(
                      value: ClosureEnum.valueOf('onsight'),
                      groupValue: climbingRoteState.route.closure,
                      label: 'On Sight',
                      fontSize: 18,
                      iconSize: 40,
                      iconProvider: LogBookIcons.eye,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (val) {
                        climbingRoteState.closure = val.toString();
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.row(
                      value: ClosureEnum.valueOf('flash'),
                      groupValue: climbingRoteState.route.closure,
                      label: 'FLASH',
                      fontSize: 18,
                      iconSize: 40,
                      iconProvider: LogBookIcons.flash,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (val) {
                        climbingRoteState.closure = val.toString();
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(),
              )
            ],
          ),
        )
      ],
    );
  }
}
