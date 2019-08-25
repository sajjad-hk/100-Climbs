import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/belay.dart';
import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/editRoute.dart';
import 'package:climbing_logbook/src/grade.dart';
import 'package:climbing_logbook/src/outCome.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:climbing_logbook/src/tags.dart';
import 'package:flutter/material.dart';
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


  @override
  void didUpdateWidget(RouteWizard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == 'EDIT') {
      currentPageIndex = 3;
    } else {
      currentPageIndex = 0;
    }
    d = DateTime.now();
  }



  _routeWizardWapper(BuildContext context) {
    PageController _controller = PageController(initialPage: 0);
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<ClimbingLogBookUser>(context);

    return Container(
      color: Color(0xffb3000000),
      padding: const EdgeInsets.all(12.0),
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
                    : EditRoute(),
              ),
            ),
            Container(
//                padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Visibility(
                    visible: currentPageIndex != 0 && widget.type != 'EDIT',
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

                          climbingRoteState.uid = user.uid; // todo: set id done by default!!
                          climbingRouteService.addRoute(climbingRoteState.route);
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
            ),
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
