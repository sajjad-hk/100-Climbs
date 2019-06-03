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
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: ToggleRadio.rowStyle(
                          label: 'Lead',
                          value: 'LEAD',
                          groupValue: climbingRouteState.route.belayingStyle,
                          onChanged: (String val) {
                            climbingRouteState.belayingStyle = val;
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
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: ToggleRadio.rowStyle(
                          label: 'Auto',
                          value: 'AUTO',
                          groupValue: climbingRouteState.route.belayingStyle,
                          onChanged: (String val) {
                            climbingRouteState.belayingStyle = val;
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
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        child: ToggleRadio.rowStyle(
                          label: 'Toprope',
                          value: 'TOPEROPE',
                          groupValue: climbingRouteState.route.belayingStyle,
                          onChanged: (String val) {
                            climbingRouteState.belayingStyle = val;
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
