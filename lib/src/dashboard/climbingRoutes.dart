import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/commons/customIcon.dart';
import 'package:hundred_climbs/src/dashboard/climbingRouteTiles/tileClimbingRouteoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Climb>> groupedRoutes =
        Provider.of<Map<DateTime, List<Climb>>>(context);
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 60),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          flattenGroupedRoutes(groupedRoutes),
        ),
      ),
    );
  }

  List<Widget> flattenGroupedRoutes(Map<DateTime, List<Climb>> groupedRoutes) {
    if (getDateTimeKeys(groupedRoutes).isEmpty)
      return [
        Container(
          height: double.maxFinite,
          color: Colors.deepPurple,
        )
      ];
    return getDateTimeKeys(groupedRoutes)
        .reversed
        .map((it) {
          return [createDateItem(it), ...createRouteItems(groupedRoutes[it])];
        })
        .expand((i) => i)
        .toList();
  }

  List<DateTime> getDateTimeKeys(Map<DateTime, List<Climb>> groupedRoutes) {
    return groupedRoutes == null ? [] : groupedRoutes.keys.toList()
      ..sort();
  }

  Widget createDateItem(DateTime date) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 2),
      child: Row(
        children: <Widget>[
          CustomIcon(
            color: AppColors.warmGrey,
            path: AppIcons.calendar,
            size: 25,
          ),
          Text(
            DateFormat.yMMMMEEEEd().format(date),
            style: TextStyle(color: AppColors.warmGrey),
          ),
        ],
      ),
    );
  }

  List<Widget> createRouteItems(List<Climb> routes) {
    routes.sort((a, b) => a.loggedDate.compareTo(b.loggedDate));
    return routes.reversed
        .map(
          (it) => ClimbingRouteTile(
            route: it,
          ),
        )
        .toList();
  }
}
