import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/commons/customIcon.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/commons/dashLinePainter.dart';
import 'package:hundred_climbs/src/dashboard/climbingRouteTiles/tileFailureWrapper.dart';
import 'package:hundred_climbs/src/dashboard/climbingRouteTiles/tileContent.dart';
import 'package:hundred_climbs/src/dashboard/state/dashboardState.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/services/climbingRouteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimbingRouteTile extends StatelessWidget {
  final Climb route;
  ClimbingRouteTile({@required this.route});

  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    final selected = dashboardState.isSelected(route);
    if (route.outCome == OutComeEnum.failure && !selected) {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: FailureTileWrapper(
          tileContent: TileContent(
            route: route,
            selected: selected,
          ),
        ),
      );
    }
    if (selected) {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: AppColors.green,
            ),
          ),
          child: TileContent(
            route: route,
            selected: selected,
          ),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(5.0),
      child: TileContent(
        route: route,
        selected: selected,
      ),
    );
  }
}
