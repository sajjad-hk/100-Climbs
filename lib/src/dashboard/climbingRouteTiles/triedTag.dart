import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:flutter/material.dart';

class TriedTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(
          color: AppColors.warmGrey,
        ),
      ),
      child: Center(
        child: Text(
          'TRIED',
          style: TextStyle(
            color: AppColors.warmGrey,
          ),
        ),
      ),
    );
  }
}
