import 'package:flutter/material.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class NewClimbFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final user = Provider.of<AppUser>(context);
    return FloatingActionButton(
      heroTag: 'NEW_CLIMB',
      elevation: 3.0,
      autofocus: true,
      onPressed: () => store.openNewClimb(user?.lastClimb),
      child: Icon(
        Icons.add,
        size: 45.0,
      ),
      backgroundColor: AppColors.getGradeColor(
          user?.lastClimb?.grade ?? '4'), //LogBookColors.getGradeColor(),
    );
  }
}
