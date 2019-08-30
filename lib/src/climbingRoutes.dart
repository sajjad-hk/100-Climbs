import 'package:climbing_logbook/src/climbingRouteItem/climbingRouteouteItem.dart';
import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  final List<ClimbingRoute> routes;
  final GestureTapCallback onEdit;

  ClimbingRoutes({this.routes, this.onEdit});

  @override
  Widget build(BuildContext context) {
    var routeMapDate =
        groupBy(routes, (it) => DateFormat.yMMMMEEEEd().format(it.loggedDate));
    List dateKeys = routeMapDate.keys.toList()..sort();
    List dateRoutes = [];
    for(String dateKey in dateKeys) {
      dateRoutes.add(dateKey);
      dateRoutes.addAll(routeMapDate[dateKey]..sort((a, b)=> b.loggedDate.compareTo(a.loggedDate)));
    }
    return SliverList(
      delegate: SliverChildListDelegate(
        dateRoutes.map((it) {
          if (it is String) {
            return Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  CustomIcon(
                    color: LogBookColors.warmGrey,
                    path: LogBookIcons.calendar,
                    size: 30,
                  ),
                  Text(
                    it,
                    style: TextStyle(color: LogBookColors.warmGrey),
                  ),
                ],
              ),
            );
          }
          return ClimbingRouteItem(
            route: it,
            edit: onEdit,
          );
        }).toList(),
      ),
    );
  }
}
