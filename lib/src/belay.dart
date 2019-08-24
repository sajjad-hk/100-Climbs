import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customRadio.dart';

class Belay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final climbingRouteState = Provider.of<ClimbingRouteState>(context);

    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              'Belay',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 2.0),
                    blurRadius: 3.0,
                    color: Color(0xff29000000),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: NewCustomRadio.row(
                          label: 'Lead',
                          fontSize: 18,
                          value: BelayingStyleEnum.valueOf('lead'),
                          groupValue: climbingRouteState.route.belayingStyle,
                          iconProvider: LogBookIcons.lead,
                          checkedContentColor: Colors.white,
                          checkedBgColor: Color(0xff4d000000),
                          unCheckedBgColor: Colors.transparent,
                          onChanged: (dynamic val) {
                            climbingRouteState.belayingStyle = val.toString();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: NewCustomRadio.row(
                          label: 'Auto',
                          fontSize: 18,
                          value: BelayingStyleEnum.valueOf('auto'),
                          groupValue: climbingRouteState.route.belayingStyle,
                          iconProvider: LogBookIcons.auto,
                          checkedContentColor: Colors.white,
                          checkedBgColor: Color(0xff4d000000),
                          unCheckedBgColor: Colors.transparent,
                          onChanged: (dynamic val) {
                            climbingRouteState.belayingStyle = val.toString();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: NewCustomRadio.row(
                          label: 'Toprope',
                          fontSize: 18,
                          value: BelayingStyleEnum.valueOf('toprope'),
                          groupValue: climbingRouteState.route.belayingStyle,
                          iconProvider: LogBookIcons.toprope,
                          checkedContentColor: Colors.white,
                          checkedBgColor: Color(0xff4d000000),
                          unCheckedBgColor: Colors.transparent,
                          onChanged: (dynamic val) {
                            climbingRouteState.belayingStyle = val.toString();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }
}
