import 'package:climbing_logbook/src/customRadio.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutCome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final route = Provider.of<ClimbingRouteState>(context);
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
                        child: NewCustomRadio.col(
                          value: OutComeEnum.valueOf('success'),
                          groupValue: route.route.outCome,
                          label: 'Yes',
                          iconProvider: LogBookIcons.smile,
                          checkedContentColor: Colors.white,
                          checkedBgColor: Color(0xff4d000000),
                          unCheckedBgColor: Colors.transparent,
                          onChanged: (val) {
                            route.outCome = val.toString();
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
                        child: NewCustomRadio.col(
                          value: OutComeEnum.valueOf('failure'),
                          groupValue: route.route.outCome,
                          label: 'No',
                          iconProvider: LogBookIcons.sad,
                          checkedContentColor: Colors.white,
                          checkedBgColor: Color(0xff4d000000),
                          unCheckedBgColor: Colors.transparent,
                          onChanged: (val) {
                            route.outCome = val.toString();
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
