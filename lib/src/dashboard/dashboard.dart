import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/newRouteWizard.dart';
import 'package:hundred_climbs/src/dashboard/FirstDashboard.dart';
import 'package:hundred_climbs/src/dashboard/climbingRoutes.dart';
import 'package:hundred_climbs/src/dashboard/customDrawer.dart';
import 'package:hundred_climbs/src/dashboard/stackedBarChart.dart';
import 'package:hundred_climbs/src/dashboard/state/dashboardState.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/services/climbingCountChartService.dart';
import 'package:hundred_climbs/src/services/climbingRouteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  Dashboard();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final state = Provider.of<DashboardState>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: AppColors.silver,
              body: user.totalNumOfClimbs != 0
                  ? CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          centerTitle: true,
                          leading: Builder(
                            builder: (context) => IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                            ),
                          ),
                          backgroundColor: Colors.black,
                          floating: true,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              padding: EdgeInsets.only(top: 50.0),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: MultiProvider(
                                        providers: [
                                          StreamProvider<
                                              Map<
                                                  String,
                                                  Map<DateTime,
                                                      List<Climb>>>>.value(
                                            value: climbingCountChartService
                                                .getClimbingCountChartData(
                                                    user.uid),
                                          ),
                                          StreamProvider<
                                                  Map<DateTime,
                                                      List<Climb>>>.value(
                                              value: climbingRouteService
                                                  .getClimbingRoutesGroupByDate(
                                                      user.uid)),
                                        ],
                                        child: StackedBarChart.withData(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.lightNavy, AppColors.dark],
                                ),
                              ),
                            ),
                          ),
                          expandedHeight: constraints.maxHeight / 2.2,
                        ),
                        StreamProvider<Map<DateTime, List<Climb>>>.value(
                          value: climbingRouteService
                              .getClimbingRoutesGroupByDate(user.uid),
                          child: ClimbingRoutes(),
                        ),
                      ],
                    )
                  : FirstDashboard(
                      openDrawer: (context) => Scaffold.of(context).openDrawer,
                    ),
              floatingActionButton: FloatingActionButton(
                heroTag: 'Hero2',
                elevation: 3.0,
                autofocus: true,
                onPressed: () => state.openNew(),
                child: Icon(
                  Icons.add,
                  size: 45.0,
                ),
                backgroundColor: AppColors.getGradeColor(
                    user.lastClimb.grade), //LogBookColors.getGradeColor(),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              drawer: CustomDrawer(
                accountType: 'Google',
              ), // todo change static account type
              bottomNavigationBar: BottomAppBar(
                color: Colors.black,
                child: Visibility(
                  visible: state.selectedClimbingRoutes.isNotEmpty,
                  child: Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: IconButton(
                            onPressed: () => state.clearSelections(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Center(
                            child: Text(
                              '${state.selectedClimbingRoutes.length} Route${state.selectedClimbingRoutes.length > 1 ? 's' : ''} selected',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: FlatButton(
                            onPressed: () {
                              climbingRouteService.removeClimbingRoutes(state
                                  .selectedClimbingRoutes
                                  .map((i) => i.documentId)
                                  .toList());
                              state.clearSelections();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'DELETE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state.isNewModalOpen) NewRouteWizard(),
          ],
        );
      },
    );
  }
}
