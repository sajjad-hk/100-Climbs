import 'package:climbing_logbook/src/models/enums.dart';
import 'package:flutter/cupertino.dart';

class WizardState with ChangeNotifier {
  OutComeEnum _selectedOutCome;
  GradingStyleEnum _selectedGradingStyle;
  String _selectedClimbingGrade;
  BelayingStyleEnum _selectedBelayStyle;
  ClosureEnum _selectedClosure;

  OutComeEnum get selectedOutCome => _selectedOutCome;

  GradingStyleEnum get selectedGradingStyle => _selectedGradingStyle;

  String get selectedClimbingGrade => _selectedClimbingGrade;

  BelayingStyleEnum get selectedBelayStyle => _selectedBelayStyle;

  ClosureEnum get selectedClosure => _selectedClosure;

  set selectedOutCome(OutComeEnum outCome) {
    _selectedOutCome = outCome;
    notifyListeners();
  }

  set selectedGradingStyle(GradingStyleEnum gradingStyle) {
    _selectedGradingStyle = gradingStyle;
    notifyListeners();
  }

  set selectedClimbingGrade(String climbingGrade) {
    _selectedClimbingGrade = climbingGrade;
    notifyListeners();
  }

  set selectedBelayStyle(BelayingStyleEnum belayStyle) {
    _selectedBelayStyle = belayStyle;
    notifyListeners();
  }

  set selectedClosure(ClosureEnum closure) {
    _selectedClosure = closure;
    notifyListeners();
  }
}
