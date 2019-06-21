import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/customRadio.dart';
import 'package:climbing_logbook/src/models/ClimbingRoute.dart';
import 'package:climbing_logbook/src/models/serializers.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Repositories/RouteRepository.dart';

class Tags extends StatelessWidget {
  static TextEditingController tagTextController = TextEditingController();
  static List<Widget> tags;

  @override
  Widget build(BuildContext context) {
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<FirebaseUser>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Tags',
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
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: <Widget>[
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                        'Style',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
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
                  ],
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 2.0),
                            child: CustomRadio(
                              value: 'FLASH',
                              groupValue:
                                  climbingRoteState.route.closure == 'FLASH'
                                      ? 'FLASH'
                                      : null,
                              onChanged: (String val) {
                                climbingRoteState.closure = val;
                              },
                              checked: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x4d000000),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: CustomIcon(
                                        path:
                                            'assets/icons/flash_white-icon.png',
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Flash',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Arial-MT-Bold',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              notChecked: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: CustomIcon(
                                        path:
                                            'assets/icons/flash_dark-icon.png',
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Flash',
                                          style: TextStyle(
                                            fontFamily: 'Arial-MT-Bold',
                                            color: Color(0x4d000000),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 2.0),
                            child: CustomRadio(
                              value: 'On Sight',
                              groupValue:
                                  climbingRoteState.route.closure == 'On Sight'
                                      ? 'On Sight'
                                      : null,
                              onChanged: (String val) {
                                climbingRoteState.closure = val;
                              },
                              checked: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x4d000000),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: CustomIcon(
                                        path: 'assets/icons/eye_white-icon.png',
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'On Sight',
                                          style: TextStyle(
                                            fontFamily: 'Arial-MT-Bold',
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              notChecked: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: CustomIcon(
                                        path: 'assets/icons/eye_dark-icon.png',
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'On Sight',
                                          style: TextStyle(
                                            fontFamily: 'Arial-MT-Bold',
                                            color: Color(0x4d000000),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      'Other',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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
                ],
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 10,
                children: [
                  for (String tag in climbingRoteState.route.tags)
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xff4c000000),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        child: Container(
                          child: TextField(
                            textCapitalization: TextCapitalization.words,
                            textAlign: TextAlign.center,
                            controller: tagTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          if (tagTextController.text != null &&
                              tagTextController.text != '') {
                            climbingRoteState.tag = tagTextController.text;
                          }
                          tagTextController.text = '';
                        },
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Color(0xff8b8b8b),
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    final standardSerializers = (serializers.toBuilder()
                          ..addPlugin(StandardJsonPlugin()))
                        .build();
                    final value2 = standardSerializers.serializeWith(
                        ClimbingRoute.serializer, climbingRoteState.route);
                    print(value2);

////                    routeToSave['uid'] = user.uid;
                    routeRepository.addRoute(value2);
                    // Save the route
                    // Go back to first tab
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        '+ LOG ANOTHER ROUTE',
                        style: TextStyle(
                          color: Color(0xff4c000000),
                          fontSize: 18,
                        ),
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
