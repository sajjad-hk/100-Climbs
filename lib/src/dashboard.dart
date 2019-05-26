import 'package:climbing_logbook/src/customDrawer.dart';
import 'package:climbing_logbook/src/routeWizard.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ClimbingRouteState>(
            builder: (context) => ClimbingRouteState(),
          ),
        ],
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
              RouteWizard.creator(
                onClose: () {
                  setState(
                    () => _mode = RouteWizardMode.NONE,
                  );
                },
              ),
            if (_mode == RouteWizardMode.EDIT)
              RouteWizard.editor(
                onClose: () {
                  setState(
                    () => _mode = RouteWizardMode.NONE,
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
