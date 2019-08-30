import 'package:climbing_logbook/src/climbingRouteWizard/belay.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/climbingStyle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/grade.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/outCome.dart';
import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/values.dart';

class RouteWizard extends StatefulWidget {
  final GestureTapCallback onClose;

  RouteWizard.creator({this.onClose}) : super();

  RouteWizard.editor({this.onClose}) : super();

  @override
  _RouteWizardState createState() => _RouteWizardState();
}

class _RouteWizardState extends State<RouteWizard> {
  int currentPageIndex;
  DateTime d;

  @override
  void didUpdateWidget(RouteWizard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    currentPageIndex = 0;
    d = DateTime.now();
  }

  _routeWizardWrapper(BuildContext context) {
    PageController _controller = PageController(initialPage: 0);
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<ClimbingLogBookUser>(context);

    return Container(
      child: AnimatedContainer(
        color: Color(0xffb3000000),
        padding: const EdgeInsets.all(12.0),
        duration: Duration(microseconds: 500),
        child: Card(
          color: LogBookColors.getGradeColor(climbingRoteState.route.grade),
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
                    child: PageView(
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
                    ClimbingStyle(),
                    Tags(),
                  ],
                )),
              ),
              Column(
                children: <Widget>[
                  Visibility(
                    visible: currentPageIndex >= 2,
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Color(0xff4d000000),
                                  size: 35,
                                ),
                                Text(
                                  'SEVE AND LOG ANOTHER',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff4d000000)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child: Visibility(
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
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Visibility(
                            visible: currentPageIndex >= 2,
                            child: InkWell(
                              onTap: () {
                                climbingRoteState.uid =
                                    user.uid; // todo: set id done by default!!
                                climbingRouteService
                                    .addRoute(climbingRoteState.route);
                                widget.onClose();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    'SAVE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 2.0),
                                          blurRadius: 3.0,
                                          color: Color(0xff29000000),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Visibility(
                            visible: currentPageIndex != 4,
                            child: IconButton(
                              iconSize: 50,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _controller.nextPage(
                                  duration: Duration(
                                    milliseconds: 200,
                                  ),
                                  curve: Curves.easeIn,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _routeWizardWrapper(context);
  }
}
