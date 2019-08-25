import 'package:climbing_logbook/src/climbingRoutes.dart';
import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/customDrawer.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/stackedBarChart.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Color listBackground = Color(0xffd8e2e5);
final Color appBarBackground = Color(0xFF000000);
final Color chartBackgroundFrom = Color(0xff165571);
final Color chartBackgroundTo = Color(0xff0e1823);

enum RouteWizardMode { CREATE, EDIT, NONE }

class Dashboard extends StatelessWidget {

 final Function callback;

  Dashboard({this.callback});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ClimbingLogBookUser>(context);
    final route = Provider.of<ClimbingRouteState>(context);
    return Scaffold(
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
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: StackedBarChart.withSampleData(),
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
          StreamBuilder<List<ClimbingRoute>>(
            stream: climbingRouteService.getRouteList(user.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ClimbingRoutes(
                  routes: snapshot.data,
                  onEdit: () => callback(RouteWizardMode.EDIT),
                );
              } else {
                return SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 200,
                        child: Center(
                          child: Text('Loading...'),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3.0,
        onPressed: () => callback(RouteWizardMode.CREATE),
        child: Icon(
          Icons.add,
          size: 45.0,
        ),
        backgroundColor: LogBookColors.getGradeColor(route.route.grade),
      ),
      drawer: CustomDrawer(
          accountType: 'Google'), // todo change static account type
    );
  }
}
