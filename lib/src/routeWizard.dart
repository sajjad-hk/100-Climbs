import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/Repositories/RouteRepository.dart';
import 'package:climbing_logbook/src/belay.dart';
import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/customRadio.dart';
import 'package:climbing_logbook/src/grade.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/outCome.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:climbing_logbook/src/tags.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'models/serializers.dart';
import 'models/values.dart';

class RouteWizard extends StatefulWidget {
  final GestureTapCallback onClose;
  final type;

  RouteWizard.creator({this.onClose})
      : type = 'NEW',
        super();

  RouteWizard.editor({this.onClose})
      : type = 'EDIT',
        super();

  @override
  _RouteWizardState createState() => _RouteWizardState();
}

class _RouteWizardState extends State<RouteWizard> {
  int currentPageIndex;
  DateTime d;
  ScrollController scrollController = new ScrollController();

  @override
  void didUpdateWidget(RouteWizard oldWidget) {
    super.didUpdateWidget(oldWidget);
    scrollController.animateTo(1000,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  void initState() {
    super.initState();

    currentPageIndex = 0;
    d = DateTime.now();
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    setState(() {
      d = picked;
    });
    return picked;
  }

  _routeWizardWapper(BuildContext context) {
    PageController _controller = PageController(initialPage: 0);
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<FirebaseUser>(context);

    return Container(
      color: Color(0xffb3000000),
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Color(0xffffdd00),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: widget.onClose,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: widget.type == 'NEW'
                    ? PageView(
                        controller: _controller,
                        onPageChanged: (ind) {
                          setState(() {
                            currentPageIndex = ind;
                          });
                        },
                        children: <Widget>[
                          OutCome(),
                          Grade(),
                          Belay(),
                          Tags(),
                        ],
                      )
                    : Container(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 5.0,
                                      ),
                                      child: Text(
                                        'Date',
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
                                Row(
                                  children: <Widget>[
                                    FlatButton(
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: LogBookColors.black_30,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            CustomIcon(
                                              color: Colors.white,
                                              path: LogBookIcons.calendar,
                                            ),
                                            Text(
                                              DateFormat.yMMMd()
                                                  .format(d)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                      color: Colors.transparent,
                                      onPressed: _selectDate,
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 5.0,
                                      ),
                                      child: Text(
                                        'Succeded?',
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: NewCustomRadio.col(
                                        value: OutComeEnum.valueOf('success'),
                                        groupValue:
                                            climbingRoteState.route.outCome,
                                        label: 'Yes',
                                        iconProvider: LogBookIcons.smile,
                                        checkedContentColor: Colors.white,
                                        checkedBgColor: Color(0xff4d000000),
                                        unCheckedBgColor: Colors.transparent,
                                        onChanged: (val) {
                                          climbingRoteState.outCome =
                                              val.toString();
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: NewCustomRadio.col(
                                        value: OutComeEnum.valueOf('failure'),
                                        groupValue:
                                            climbingRoteState.route.outCome,
                                        label: 'No',
                                        iconProvider: LogBookIcons.sad,
                                        checkedContentColor: Colors.white,
                                        checkedBgColor: Color(0xff4d000000),
                                        unCheckedBgColor: Colors.transparent,
                                        onChanged: (val) {
                                          climbingRoteState.outCome =
                                              val.toString();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 5.0,
                                      ),
                                      child: Text(
                                        'Scale and grade',
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 120,
                                      height: 50,
                                      child: NewCustomRadio.row(
                                        value:
                                            GradingStyleEnum.valueOf('french'),
                                        groupValue: climbingRoteState
                                            .route.gradingStyle,
                                        label: 'French',
                                        checkedContentColor: Colors.white,
                                        checkedBgColor: Color(0xff4d000000),
                                        unCheckedBgColor: Colors.transparent,
                                        onChanged: (val) {
                                          climbingRoteState.gradingStyle =
                                              val.toString();
                                          climbingRoteState.grade =
                                              climbingRoteState
                                                  .climbingGradeValues[0];
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 50,
                                      child: NewCustomRadio.row(
                                        value:
                                            GradingStyleEnum.valueOf('polish'),
                                        groupValue: climbingRoteState
                                            .route.gradingStyle,
                                        label: 'Polish',
                                        checkedContentColor: Colors.white,
                                        checkedBgColor: Color(0xff4d000000),
                                        unCheckedBgColor: Colors.transparent,
                                        onChanged: (val) {
                                          climbingRoteState.gradingStyle =
                                              val.toString();
                                          climbingRoteState.grade =
                                              climbingRoteState
                                                  .climbingGradeValues[0];
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  child: ListView.builder(
                                    controller: scrollController,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Center(
                                          child: Text(
                                            '$index',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        height: 50,
                                        width: 50,
                                        color: LogBookColors.black_30,
                                      );
                                    },
                                    scrollDirection: Axis.horizontal,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
              ),
            ),
            Container(
//                padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Visibility(
                    visible: currentPageIndex != 0,
                    child: IconButton(
                      iconSize: 50,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => _controller.previousPage(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            curve: Curves.easeIn,
                          ),
                    ),
                  ),
                  Container(
//                      padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      iconSize: 50,
                      icon: Icon(
                        currentPageIndex == 3
                            ? Icons.check
                            : Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (currentPageIndex == 3) {
                          final standardSerializers = (serializers.toBuilder()
                                ..addPlugin(StandardJsonPlugin()))
                              .build();
                          climbingRoteState.uid = user.uid;
                          final value2 = standardSerializers.serializeWith(
                              ClimbingRoute.serializer,
                              climbingRoteState.route);
//                          print(value2);
                          routeRepository.addRoute(value2);
                          widget.onClose();
                        } else {
                          _controller.nextPage(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _routeWizardWapper(context);
  }
}
