import 'package:climbing_logbook/src/dashboard/state/DashboardMode.dart';
import 'package:flutter/widgets.dart';

class DashboardState extends ChangeNotifier {
  int _mode;

  DashboardState()
      : _mode = DashboardMode.defaultDashboard,
        super();

  int get mode => _mode;

  close() {
    _mode = DashboardMode.defaultDashboard;
    notifyListeners();
  }

  openNew() {
    _mode = DashboardMode.newClimbingRouteWizardOpen;
    notifyListeners();
  }
}
