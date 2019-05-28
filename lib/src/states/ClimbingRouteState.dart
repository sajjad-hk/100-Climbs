import 'package:climbing_logbook/src/models/ClimbingRoute.dart';
import 'package:flutter/foundation.dart';

const GRADE_SET = {
  "FRENCH": [
    '4a',
    '4a+',
    '4b',
    '4b+',
    '4c',
    '4c+',
    '5a',
    '5a+',
    '5b',
    '5b+',
    '5c',
    '5c+',
    '6a',
    '6a+',
    '6b',
    '6b+',
    '6c',
    '6c+',
    '7a',
    '7a+',
    '7b',
    '7b+',
    '7c',
    '7c+',
    '8a'
  ],
  'POLISH': [
    'IV+',
    'V-',
    'V',
    'V+',
    'VI-',
    'VI',
    'VI+',
    'VI.1',
    'VI.1+',
    'VI.2',
    'VI.2+',
    'VI.3',
    'VI.3+',
    'VI.4',
    'VI.4+',
    'VI.5',
    'VI.5+'
  ]
};

class ClimbingRouteState with ChangeNotifier {
  ClimbingRoute _route = ClimbingRoute(
      outCome: 'Yes',
      gradingStyle: 'FRENCH',
      grade: '4a',
      belayingStyle: 'LEAD',
      closures: ['FLASH'],
      tags: ['Makak']);

  List<String> _climbingGradeValues = GRADE_SET['FRENCH'];

  ClimbingRoute get route => _route;
  List<String> get climbingGradeValues => _climbingGradeValues;
  String get gradingStyle => _route.gradingStyle;

  set tag(String value) {
    _route.tags.add(value);
    notifyListeners();
  }

  set closure(String value) {
    if (_route.closures.contains(value)) {
      _route.closures.remove(value);
    } else {
      _route.closures.add(value);
    }
    notifyListeners();
  }

  set belayingStyle(String value) {
    _route.belayingStyle = value;
    notifyListeners();
  }

  set outCome(String value) {
    _route.outCome = value;
    notifyListeners();
  }

  set gradingStyle(String value) {
    _route.gradingStyle = value;
    _climbingGradeValues = GRADE_SET[value];
    notifyListeners();
  }

  set grade(String value) {
    _route.grade = value;
    notifyListeners();
  }

  set route(ClimbingRoute route) {
    _route = route;
    notifyListeners();
  }
}
