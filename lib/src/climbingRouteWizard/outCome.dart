import 'package:hundred_climbs/src/climbingRouteWizard/pageTitle.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/state/wizardState.dart';
import 'package:hundred_climbs/src/commons/customRadio.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutCome extends StatelessWidget {
  final GestureTapCallback autoNext;
  final double sizing;

  OutCome({this.autoNext, this.sizing});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WizardPageTitle(
          title: 'Succeded?',
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 160,
                height: 140,
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
              Container(
                width: 160,
                height: 140,
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
            ],
          ),
        ),
      ],
    );
  }
}
