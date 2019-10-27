import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/commons/customRadio.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimbingStyle extends StatelessWidget {
  final GestureTapCallback autoNext;

  ClimbingStyle({@required this.autoNext});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WizardPageTitle(
          title: 'Style',
        ),
        Flexible(
          flex: 5,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.col(
                        value: ClosureEnum.valueOf('onsight'),
                        groupValue: state.selectedClosure,
                        label: 'On Sight',
                        fontSize: 18,
                        iconSize: 50,
                        iconProvider: AppIcons.eye,
                        checkedContentColor: Colors.white,
                        checkedBgColor: Color(0xff4d000000),
                        unCheckedBgColor: Colors.transparent,
                        onChanged: (val) {
                          state.selectedClosure = val;
                          autoNext();
                        }),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: NewCustomRadio.col(
                        value: ClosureEnum.valueOf('flash'),
                        groupValue: state.selectedClosure,
                        label: 'FLASH',
                        fontSize: 18,
                        iconSize: 50,
                        iconProvider: AppIcons.flash,
                        checkedContentColor: Colors.white,
                        checkedBgColor: Color(0xff4d000000),
                        unCheckedBgColor: Colors.transparent,
                        onChanged: (val) {
                          state.selectedClosure = val;
                          autoNext();
                        }),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
