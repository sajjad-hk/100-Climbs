import 'package:climbing_logbook/src/assets-content/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/assets-content/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteouteItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  final List<ClimbingRoute> routes;
  final GestureTapCallback onEdit;

  ClimbingRoutes({this.routes, this.onEdit});

  @override
  Widget build(BuildContext context) {
    List<Widget> dateRoutes = [];

    Map<DateTime, List<ClimbingRoute>> col =
        Provider.of<Map<DateTime, List<ClimbingRoute>>>(context);

    if (col != null) {
      List<DateTime> ds = col.keys.toList()..sort();
      ds.reversed.forEach((key) {
        Widget d = Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              CustomIcon(
                color: LogBookColors.warmGrey,
                path: LogBookIcons.calendar,
                size: 30,
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(key),
                style: TextStyle(color: LogBookColors.warmGrey),
              ),
            ],
          ),
        );
        dateRoutes.add(d);
        col[key]?.forEach((it) {
          dateRoutes.add(ClimbingRouteItem(
            route: it,
            edit: onEdit,
          ));
        });
      });
    } else {
      dateRoutes.add(Container());
    }

    return SliverList(
      delegate: SliverChildListDelegate(dateRoutes),
    );
  }
}
