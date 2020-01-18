import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/climbingCountChartService.dart';
import 'package:hundred_climbs/src/services/climbingRouteService.dart';
import 'package:provider/provider.dart';

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: MultiProvider(
                        providers: [
                          StreamProvider<
                              Map<String, Map<DateTime, List<Climb>>>>.value(
                            value: climbingCountChartService
                                .getClimbingCountChartData(user?.uid),
                          ),
                          StreamProvider<Map<DateTime, List<Climb>>>.value(
                              value: climbingRouteService
                                  .getClimbingRoutesGroupByDate(user?.uid)),
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
          expandedHeight: 280,
//          expandedHeight: constraints.maxHeight / 2.2,
        ),
        StreamProvider<Map<DateTime, List<Climb>>>.value(
          value: climbingRouteService.getClimbingRoutesGroupByDate(user?.uid),
          child: ClimbingRoutes(),
        ),
      ],
    );
  }
}
