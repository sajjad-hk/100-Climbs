import 'package:flutter/widgets.dart';
import 'package:hundred_climbs/src/models/values.dart';

class Store with ChangeNotifier {
  bool _newClimbOpen = false;
  bool get isNewClimbOpen => _newClimbOpen;

  void openNewClimb(Climb climb) {
    _newClimbOpen = true;
    _selectedClimb = climb.rebuild((c) => c
      ..tags.clear()
      ..comment = '');
    notifyListeners();
  }

  void closeNewClimb() {
    _newClimbOpen = false;
    _currentPageIndex = 0;
    notifyListeners();
  }

  // ========================================================

  List<Climb> _selectedClimbs = List();
  Climb _selectedClimb;
  List<Climb> get climbs => _selectedClimbs;
  Climb get climb => _selectedClimb;

  void selectClimb(Climb climb) {
    _selectedClimb = climb;
    notifyListeners();
  }

  void selectMultiClimb(Climb climb) {
    if (!_selectedClimbs.contains(climb)) _selectedClimbs.add(climb);
    notifyListeners();
  }

  void unSelectClimb(Climb climb) {
    _selectedClimbs.remove(climb);
    notifyListeners();
  }

  void clearClimbs() {
    _selectedClimbs.clear();
    notifyListeners();
  }

  int numberOfClimbs() {
    return _selectedClimbs.length;
  }

  updateClimb(Climb climb) {
    _selectedClimb = climb;
    notifyListeners();
  }

  bool isClimbSelected(Climb climb) {
    return _selectedClimbs.contains(climb);
  }

  //========================================================================

  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
