import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/commons/customIcon.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/material.dart';

class ClimbingRouteItem extends StatelessWidget {
  final ClimbingRoute route;
  final Function edit;
  ClimbingRouteItem({@required this.route, this.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        shadowColor: Color(0xff290000),
        color: AppColors.getClimbingRouteOutcomeColor(route.outCome),
        child: InkWell(
          highlightColor: Colors.grey,
          onTap: () => edit(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: AppColors.getGradeColor(route.grade),
                  height: 110,
                  width: 6,
                ),
                Container(
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              route.grade,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 35,
                                  width: 35,
                                  child: Center(
                                    child: CustomIcon(
                                      path: AppIcons.getBelayStyleIcon(
                                          route.belayingStyle),
                                      color: AppColors.black_30,
                                      size: 17,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.silver,
                                  ),
                                ),
                                if (route.closure != null)
                                  Positioned(
                                    left: 28,
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      child: Center(
                                        child: CustomIcon(
                                          path:
                                              AppIcons.getRouteClimbClosureIcon(
                                                  route.closure),
                                          color: AppColors.black_30,
                                          size: 17,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.paleGrey,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          if (route.tags.isNotEmpty)
                            Row(
                              children: <Widget>[
                                for (String tag in route.tags)
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 2),
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.whiteTwo,
                                        )),
                                    child: Container(
                                      margin: const EdgeInsets.all(2.0),
                                      child: Center(
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                              color: AppColors.warmGrey),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
