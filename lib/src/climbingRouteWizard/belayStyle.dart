import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../commons/customRadio.dart';

class BelayStyle extends StatelessWidget {
  final GestureTapCallback autoNext;

  BelayStyle({@required this.autoNext});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);

    return Column(
      children: <Widget>[
        WizardPageTitle(
          title: 'Belay',
        ),
        Flexible(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AspectRatio(
                    aspectRatio: 2.2,
                    child: Container(
                      child: NewCustomRadio.row(
                        label: 'Lead',
                        fontSize: 18,
                        value: BelayingStyleEnum.valueOf('lead'),
                        groupValue: state.selectedBelayStyle,
                        iconSize: 50,
                        iconProvider: AppIcons.lead,
                        checkedContentColor: Colors.white,
                        checkedBgColor: Color(0xff4d000000),
                        unCheckedBgColor: Colors.transparent,
                        onChanged: (val) {
                          state.selectedBelayStyle = val;
                          autoNext();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AspectRatio(
                    aspectRatio: 2.2,
                    child: Container(
                      child: NewCustomRadio.row(
                        label: 'Auto',
                        fontSize: 18,
                        value: BelayingStyleEnum.valueOf('auto'),
                        groupValue: state.selectedBelayStyle,
                        iconSize: 50,
                        iconProvider: AppIcons.auto,
                        checkedContentColor: Colors.white,
                        checkedBgColor: Color(0xff4d000000),
                        unCheckedBgColor: Colors.transparent,
                        onChanged: (val) {
                          state.selectedBelayStyle = val;
                          autoNext();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AspectRatio(
                    aspectRatio: 2.2,
                    child: Container(
                      child: NewCustomRadio.row(
                        label: 'Toprope',
                        fontSize: 18,
                        value: BelayingStyleEnum.valueOf('toprope'),
                        groupValue: state.selectedBelayStyle,
                        iconSize: 50,
                        iconProvider: AppIcons.toprope,
                        checkedContentColor: Colors.white,
                        checkedBgColor: Color(0xff4d000000),
                        unCheckedBgColor: Colors.transparent,
                        onChanged: (val) {
                          state.selectedBelayStyle = val;
                          autoNext();
                        },
                      ),
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
