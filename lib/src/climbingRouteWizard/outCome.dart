import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/commons/customRadio.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutCome extends StatelessWidget {
  final GestureTapCallback autoNext;

  OutCome({this.autoNext});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);
    return Column(
      children: <Widget>[
        WizardPageTitle(
          title: 'Succeded?',
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: NewCustomRadio.col(
                      value: OutComeEnum.valueOf('success'),
                      groupValue: state.selectedOutCome,
                      label: 'Yup',
                      fontSize: 18,
                      iconProvider: AppIcons.smile,
                      iconSize: 40,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (val) {
                        state.selectedOutCome = val;
                        autoNext();
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: NewCustomRadio.col(
                      value: OutComeEnum.valueOf('failure'),
                      groupValue: state.selectedOutCome,
                      label: 'Tried but failed',
                      fontSize: 18,
                      iconProvider: AppIcons.sad,
                      iconSize: 40,
                      checkedContentColor: Colors.white,
                      checkedBgColor: Color(0xff4d000000),
                      unCheckedBgColor: Colors.transparent,
                      onChanged: (val) {
                        state.selectedOutCome = val;
                        autoNext();
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
        ),
      ],
    );
  }
}
