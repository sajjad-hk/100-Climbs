import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteouteItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<ClimbingRoute>> groupedRoutes =
        Provider.of<Map<DateTime, List<ClimbingRoute>>>(context);
    return SliverList(
      delegate: SliverChildListDelegate(
        flattenGroupedRoutes(groupedRoutes),
      ),
    );
  }

  List<Widget> flattenGroupedRoutes(
      Map<DateTime, List<ClimbingRoute>> groupedRoutes) {
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

  List<DateTime> getDateTimeKeys(
      Map<DateTime, List<ClimbingRoute>> groupedRoutes) {
    return groupedRoutes == null ? [] : groupedRoutes.keys.toList()
      ..sort();
  }

  Widget createDateItem(DateTime date) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          CustomIcon(
            color: AppColors.warmGrey,
            path: AppIcons.calendar,
            size: 30,
          ),
          Text(
            DateFormat.yMMMMEEEEd().format(date),
            style: TextStyle(color: AppColors.warmGrey),
          ),
        ],
      ),
    );
  }

  List<Widget> createRouteItems(List<ClimbingRoute> routes) {
    routes.sort((a, b) => a.loggedDate.compareTo(b.loggedDate));
    return routes.reversed
        .map(
          (it) => ClimbingRouteItem(
            route: it,
          ),
        )
        .toList();
  }
}
