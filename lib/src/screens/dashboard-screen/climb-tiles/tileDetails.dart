import 'package:flutter/material.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class TileDetails extends StatelessWidget {
  final BelayingStyleEnum belayingStyle;
  final OutComeEnum outCome;

  TileDetails({this.belayingStyle, this.outCome});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: screens['DASHBOARD']['TAG_HEIGHT']
          [LayoutUtils(context).screenSize],
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
          if (outCome == OutComeEnum.failure)
            Positioned(
              left: 27,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screens['DASHBOARD']['BORDER_RADIUS']
                          [LayoutUtils(context).screenSize]),
                    ),
                    color: AppColors.paleGrey3),
                height: screens['DASHBOARD']['TAG_HEIGHT']
                        [LayoutUtils(context).screenSize] -
                    2,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: CustomIcon(
                        path: AppIcons.sad,
                        color: AppColors.black30,
                        size: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        'FAILURE',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.coolGrey2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
