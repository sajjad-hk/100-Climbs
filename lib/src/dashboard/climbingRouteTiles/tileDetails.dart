import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/dashboard/climbingRouteTiles/tileIconsWrapper.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:flutter/material.dart';

class TileDetails extends StatelessWidget {
  final BelayingStyleEnum belayingStyle;
  final ClosureEnum closure;

  TileDetails({this.closure, this.belayingStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: closure != null ? 70 : 35,
      child: Stack(
        children: <Widget>[
          TileIconsWrapper(
            icon: CustomIcon(
              path: AppIcons.getBelayStyleIcon(belayingStyle),
              color: AppColors.black_30,
              size: 32,
            ),
            color: AppColors.silver,
          ),
          if (closure != null)
            Positioned(
              left: 28,
              child: TileIconsWrapper(
                icon: CustomIcon(
                  path: AppIcons.getRouteClimbClosureIcon(closure),
                  color: AppColors.black_30,
                  size: 32,
                ),
                color: AppColors.paleGrey,
              ),
            ),
        ],
      ),
    );
  }
}
