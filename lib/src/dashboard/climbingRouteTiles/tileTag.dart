import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:flutter/material.dart';

class TileTags extends StatelessWidget {
  final String tagText;
  TileTags({this.tagText});
  @override
  Widget build(BuildContext context) {
    int txtLength = this.tagText.length < 5 ? 5 : this.tagText.length;
    return Container(
      width: txtLength * 9.0,
      padding:
          const EdgeInsets.only(top: 4.0, right: 2.0, left: 2.0, bottom: 4.0),
      margin:
          const EdgeInsets.only(top: 2.0, right: 2.0, left: 10, bottom: 2.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.whiteTwo,
        ),
      ),
      child: Center(
        child: Text(
          tagText,
          style: TextStyle(
            color: AppColors.warmGrey,
          ),
        ),
      ),
    );
  }
}
