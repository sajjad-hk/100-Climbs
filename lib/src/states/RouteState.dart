import 'package:climbing_logbook/src/models/ClimbingRoute.dart';
import 'package:flutter/foundation.dart';

class RouteState with ChangeNotifier {
  ClimbingRoute _route = ClimbingRoute(
      outCome: 'Yes',
      gradingStyle: 'FRENCH',
      grade: '6a',
      belayingStyle: 'LEAD',
      closure: 'FLASH',
      tags: []);

  ClimbingRoute get route => _route;

  set outCome(String val) {
    _route.outCome = val;
    notifyListeners();
  }

  set route(ClimbingRoute route) {
    _route = route;
    print(route.outCome);
    notifyListeners();
  }
}
