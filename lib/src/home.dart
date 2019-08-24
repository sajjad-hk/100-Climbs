import 'package:climbing_logbook/src/dashboard.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/routeWizard.dart';
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
  RouteWizardMode _mode = RouteWizardMode.NONE;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ClimbingLogBookUser>(context);

    if (user != null) {
      return SafeArea(
        child: Stack(
          children: <Widget>[
            Dashboard(
              callback: (RouteWizardMode mode) => {
                setState(
                  () => _mode = mode,
                )
              },
            ),
            if (_mode == RouteWizardMode.CREATE)
              RouteWizard.creator(
                onClose: () {
                  setState(
                    () => _mode = RouteWizardMode.NONE,
                  );
                },
              ),
            if (_mode == RouteWizardMode.EDIT)
              RouteWizard.editor(
                onClose: () {
                  setState(
                    () => _mode = RouteWizardMode.NONE,
                  );
                },
              )
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
