import 'package:climbing_logbook/src/dashboard/state/DashboardMode.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/widgets.dart';

class DashboardState extends ChangeNotifier {
  int _mode;
  ClimbingRoute _selectedClimbingRoute;

  DashboardState()
      : _mode = DashboardMode.defaultDashboard,
        super();

  int get mode => _mode;
  ClimbingRoute get selectedClimbingRoute => _selectedClimbingRoute;

  selectClimbingRoute(ClimbingRoute route) {
    _selectedClimbingRoute = route;
    notifyListeners();
  }

  close() {
    _mode = DashboardMode.defaultDashboard;
    notifyListeners();
  }

  openNew() {
    _mode = DashboardMode.newClimbingRouteWizardOpen;
    notifyListeners();
  }

  openEdit() {
    _mode = DashboardMode.editClimbingRoutePageOpen;
    notifyListeners();
  }
}
