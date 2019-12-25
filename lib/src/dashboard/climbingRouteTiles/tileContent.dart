import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/dashboard/climbingRouteTiles/tileDetails.dart';
import 'package:hundred_climbs/src/dashboard/climbingRouteTiles/tileTag.dart';
import 'package:hundred_climbs/src/dashboard/state/dashboardState.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:provider/provider.dart';

class TileContent extends StatelessWidget {
  final Climb route;
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
            border: Border(
              left: BorderSide(
                color: AppColors.getGradeColor(route.grade),
                width: 6,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
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
                          padding: const EdgeInsets.all(10),
                          child: TileDetails(
                            belayingStyle: route.belayingStyle,
                            closure: route.closure,
                          ),
                        ),
                      ],
                    ),
                    if (route.tags.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        child: Wrap(
                          runSpacing: 5.0,
                          children: <Widget>[
                            for (String tag in route.tags)
                              TileTags(
                                tagText: tag,
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                height: 100,
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
