import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/states/constants.dart';
import 'package:flutter/cupertino.dart';

class WizardState with ChangeNotifier {
  WizardState(Climb lastClimb) {
    _selectedOutCome = lastClimb?.outCome ?? OutComeEnum.success;
    _selectedGradingStyle = lastClimb?.gradingStyle ?? GradingStyleEnum.french;
    _selectedClimbingGrade =
        lastClimb?.grade ?? Constants.grades[_selectedGradingStyle][0];
    _selectedBelayStyle = lastClimb?.belayingStyle ?? BelayingStyleEnum.lead;
    _selectedTags = List<String>();
    _currentPageIndex = 0;
  }

  OutComeEnum _selectedOutCome;
  GradingStyleEnum _selectedGradingStyle;
  String _selectedClimbingGrade;
  BelayingStyleEnum _selectedBelayStyle;
  DateTime _selectedLoggedDate;
  List<String> _selectedTags;
  int _currentPageIndex;

  OutComeEnum get selectedOutCome => _selectedOutCome;

  GradingStyleEnum get selectedGradingStyle => _selectedGradingStyle;

  String get selectedClimbingGrade => _selectedClimbingGrade;

  BelayingStyleEnum get selectedBelayStyle => _selectedBelayStyle;

  DateTime get selectedLoggedDate => _selectedLoggedDate;

  List<String> get selectedTags => _selectedTags;

  int get currentPageIndex => _currentPageIndex;

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

  set currentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  flush() {
    selectedOutCome = _selectedOutCome;
    selectedBelayStyle = _selectedBelayStyle;
    setLoggedDate();
    currentPageIndex = 0;
    _selectedTags = List<String>();
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
