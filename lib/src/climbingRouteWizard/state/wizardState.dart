import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/cupertino.dart';

class WizardState with ChangeNotifier {
  WizardState() {
    _selectedGradingStyle = GradingStyleEnum.french;
    _selectedTags = List<String>();
    _selectedClimbingGrade = '4a';
  }

  OutComeEnum _selectedOutCome;
  GradingStyleEnum _selectedGradingStyle;
  String _selectedClimbingGrade;
  BelayingStyleEnum _selectedBelayStyle;
  ClosureEnum _selectedClosure;
  DateTime _selectedLoggedDate;
  List<String> _selectedTags;

  OutComeEnum get selectedOutCome => _selectedOutCome;

  GradingStyleEnum get selectedGradingStyle => _selectedGradingStyle;

  String get selectedClimbingGrade => _selectedClimbingGrade;

  BelayingStyleEnum get selectedBelayStyle => _selectedBelayStyle;

  ClosureEnum get selectedClosure => _selectedClosure;

  DateTime get selectedLoggedDate => _selectedLoggedDate;

  List<String> get selectedTags => _selectedTags;

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

  setLoggedDate([DateTime date]) {
    _selectedLoggedDate = date ?? DateTime.now();
    notifyListeners();
  }

  addTag(String tag) {
    _selectedTags.add(tag);
    notifyListeners();
  }

  removeTag(String tag) {
    _selectedTags.remove(tag);
    notifyListeners();
  }
}
