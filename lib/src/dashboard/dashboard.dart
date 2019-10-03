import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/dashboard/climbingRoutes.dart';
import 'package:climbing_logbook/src/dashboard/customDrawer.dart';
import 'package:climbing_logbook/src/dashboard/state/DashboardMode.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/dashboard/stackedBarChart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Color listBackground = Color(0xffd8e2e5);
final Color appBarBackground = Color(0xFF000000);
final Color chartBackgroundFrom = Color(0xff165571);
final Color chartBackgroundTo = Color(0xff0e1823);

class Dashboard extends StatelessWidget {
  Dashboard();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final state = Provider.of<DashboardState>(context);
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
          StreamProvider<Map<DateTime, List<ClimbingRoute>>>.value(
            stream: climbingRouteService.getClimbingRoutesGroupByDate(user.uid),
            child: ClimbingRoutes(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3.0,
        onPressed: () => state.openNew(),
        child: Icon(
          Icons.add,
          size: 45.0,
        ),
        backgroundColor: AppColors.getGradeColor(
            user.lastClimb.grade), //LogBookColors.getGradeColor(),
      ),
      drawer: CustomDrawer(
          accountType: 'Google'), // todo change static account type
    );
  }
}
