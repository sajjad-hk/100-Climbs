import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/commons/dashLinePainter.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteTiles/tileFailureWrapper.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteTiles/tileContent.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClimbingRouteTile extends StatelessWidget {
  final ClimbingRoute route;
  ClimbingRouteTile({@required this.route});

  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    final selected = dashboardState.isSelected(route);
    if (route.outCome == OutComeEnum.failure && !selected) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
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
        padding: const EdgeInsets.all(8.0),
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
      padding: EdgeInsets.all(8.0),
      child: TileContent(
        route: route,
        selected: selected,
      ),
    );
  }
}
