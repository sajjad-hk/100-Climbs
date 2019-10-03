import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    DateTime date = dashboardState.selectedClimbingRoute == null
        ? DateTime.now()
        : dashboardState.selectedClimbingRoute.loggedDate;
    return FlatButton(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.black_30,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomIcon(
              color: Colors.white,
              path: AppIcons.calendar,
            ),
            Text(
              DateFormat.yMEd().format(date).toString(),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      color: Colors.transparent,
      onPressed: () => selectDate(context),
    );
  }

  selectDate(BuildContext context) async {
    final dashboardState = Provider.of<DashboardState>(context);
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: dashboardState.selectedClimbingRoute.loggedDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    ClimbingRoute route = dashboardState.selectedClimbingRoute.rebuild(
        (r) => r..loggedDate = picked ?? dashboardState.selectedClimbingRoute);
    dashboardState.selectClimbingRoute(route);
    return route.loggedDate;
  }
}
