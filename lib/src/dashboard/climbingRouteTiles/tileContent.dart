import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteTiles/tileDetails.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteTiles/tileTag.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteTiles/triedTag.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TileContent extends StatelessWidget {
  final ClimbingRoute route;
  final bool selected;
  TileContent({@required this.route, @required this.selected});

  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Material(
      elevation: 2,
      shadowColor: AppColors.black7,
      color: AppColors.getClimbingRouteOutcomeColor(route.outCome),
      child: InkWell(
        onLongPress: () {
          dashboardState.selectClimbingRoute(route);
        },
        onTap: () {
          if (dashboardState.isSelected(route)) {
            dashboardState.unSelectClimbingRoute(route);
          } else {
            dashboardState.pickClimbingRoute(route);
            dashboardState.openEdit();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: AppColors.getGradeColor(route.grade),
                height: 110,
                width: 6,
              ),
              Container(
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            route.grade,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                            ),
                          ),
                        ),
                        Container(
                          child: TileDetails(
                            belayingStyle: route.belayingStyle,
                            closure: route.closure,
                          ),
                        ),
                        if (route.outCome == OutComeEnum.failure) TriedTag(),
                      ],
                    ),
                    Wrap(
                      children: <Widget>[
                        if (route.tags.isNotEmpty)
                          for (String tag in route.tags)
                            TileTags(
                              tagText: tag,
                            ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? AppColors.green : AppColors.paleGrey2,
                    ),
                    child: Icon(
                      Icons.done,
                      size: 32,
                      color:
                          AppColors.getClimbingRouteOutcomeColor(route.outCome),
                    ),
                  ),
                  onPressed: () => dashboardState.selectClimbingRoute(route),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
