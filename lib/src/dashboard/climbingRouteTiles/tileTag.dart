import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:flutter/material.dart';

class TileTags extends StatelessWidget {
  final String tagText;
  TileTags({this.tagText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.whiteTwo,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        child: Center(
          child: Text(
            tagText,
            style: TextStyle(
              color: AppColors.warmGrey,
            ),
          ),
        ),
      ),
    );
  }
}
