import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class TileDetails extends StatelessWidget {
  final BelayingStyleEnum belayingStyle;

  TileDetails({this.belayingStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      child: Stack(
        children: <Widget>[
          TileIconsWrapper(
            icon: CustomIcon(
              path: AppIcons.getBelayStyleIcon(belayingStyle),
              color: AppColors.black30,
              size: 24,
            ),
            color: AppColors.silver,
          ),
        ],
      ),
    );
  }
}
