import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/states/RouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customRadio.dart';

class OutCome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = Provider.of<RouteState>(context);
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              'Succeded?',
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
          flex: 5,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Consumer<RouteState>(
                          builder: (context, routeState, _) {
                            return ToggleRadio.columnStyle(
                              label: 'Yes',
                              value: 'Yes',
                              groupValue: routeState.route.outCome,
                              notCheckedIcon: Container(
                                width: 50,
                                height: 50,
                                child: CustomIcon(
                                  path: 'assets/icons/smile-icon.png',
                                ),
                              ),
                              checkedIcon: Container(
                                width: 50,
                                height: 50,
                                child: CustomIcon(
                                  path: 'assets/icons/smile-white-icon.png',
                                ),
                              ),
                              onChanged: (String val) {
                                route.outCome = val;
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Consumer<RouteState>(
                            builder: (context, routeState, _) {
                          return ToggleRadio.columnStyle(
                            label: 'No',
                            value: 'No',
                            groupValue: routeState.route.outCome,
                            notCheckedIcon: Container(
                              width: 50,
                              height: 50,
                              child: CustomIcon(
                                path: 'assets/icons/sad-icon.png',
                              ),
                            ),
                            checkedIcon: Container(
                              width: 50,
                              height: 50,
                              child: CustomIcon(
                                path: 'assets/icons/sad-white-icon.png',
                              ),
                            ),
                            onChanged: (String val) {
                              route.outCome = val;
                              print(route.route.outCome);
                            },
                          );
                        }),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
