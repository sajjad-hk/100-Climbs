import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/dashboard/dashboard.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/editeRouteWizard/editRouteWizard.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/climbingRouteWizard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final Color listBackground = Color(0xffd8e2e5);
final Color appBarBackground = Color(0xFF000000);
final Color chartBackgroundFrom = Color(0xff165571);
final Color chartBackgroundTo = Color(0xff0e1823);

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final state = Provider.of<DashboardState>(context);

    if (user != null) {
      return SafeArea(
        child: IndexedStack(
          index: state.mode,
          children: <Widget>[
            Dashboard(),
            ChangeNotifierProvider<WizardState>(
              builder: (context) => WizardState(user.lastClimb),
              child: ClimbingRouteWizard(),
            ),
            EditRouteWizard(),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.orange,
      );
    }
  }
}
