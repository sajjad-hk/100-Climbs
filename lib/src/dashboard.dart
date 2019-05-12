import 'package:climbing_logbook/routeWizard.dart';
import 'package:climbing_logbook/src/customDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum RouteWizardMode { CREATE, EDIT, NONE }

final Color listBackground = Color(0xffd8e2e5);
final Color appBarBackground = Color(0xFF000000);
final Color chartBackgroundFrom = Color(0xff165571);
final Color chartBackgroundTo = Color(0xff0e1823);

class Dashboard extends StatefulWidget {
  final FirebaseUser user;

  Dashboard({this.user});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  RouteWizardMode _mode = RouteWizardMode.NONE;
  List<Widget> top = [];

  @override
  Widget build(BuildContext context) {
    switch (_mode) {
      case RouteWizardMode.CREATE:
        top.add(RouteWizard.creator());
        break;
      case RouteWizardMode.EDIT:

      case RouteWizardMode.NONE:
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: listBackground,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text("CLIMBING LOGBOOK"),
                  centerTitle: true,
                  leading: Builder(
                    builder: (context) => IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                  ),
                  backgroundColor: appBarBackground,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Center(
                                child: Placeholder(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Center(
                                child: Placeholder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [chartBackgroundFrom, chartBackgroundTo],
                        ),
                      ),
                    ),
                  ),
                  expandedHeight: 300,
                ),
//            RouteLogs(
//              routes: List<RouteLog>.generate(
//                100,
//                    (i) => i % 6 == 0
//                    ? HeadingItem(
//                  DateFormat("EEEE, MMMM d, y").format(DateTime.now()),
//                )
//                    : ClimbingRoute("6a+"),
//              ),
//            )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 3.0,
              onPressed: () {
                setState(() => _mode = RouteWizardMode.CREATE);
              },
              child: Icon(
                Icons.add,
                size: 45.0,
              ),
              backgroundColor: Color(0xffffdd00),
            ),
            drawer: CustomDrawer(accountType: 'Google', user: widget.user),
          ),
          if (_mode == RouteWizardMode.CREATE)
            RouteWizard.creator(onClose: () {
              setState(
                () => _mode = RouteWizardMode.NONE,
              );
            }),
        ],
      ),
    );
  }
}
