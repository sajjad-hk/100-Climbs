import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:flutter/material.dart';

class TagInfoItem extends StatelessWidget {
  final String tagText;
  TagInfoItem({this.tagText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 4.0, right: 6.0, left: 6.0, bottom: 4.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.white2,
        ),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          tagText,
          style: TextStyle(
            color: AppColors.warmGrey,
          ),
        ),
      ]),
    );
  }
}
