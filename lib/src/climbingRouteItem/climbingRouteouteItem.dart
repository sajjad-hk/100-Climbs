import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
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
        color: LogBookColors.getClimbingRouteOutcomeColor(route.outCome),
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
                  color: LogBookColors.getGradeColor(route.grade),
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
                                      path: LogBookIcons.getBelayStyleIcon(
                                          route.belayingStyle),
                                      color: LogBookColors.black_30,
                                      size: 17,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: LogBookColors.silver,
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
                                          path: LogBookIcons
                                              .getRouteClimbClosureIcon(
                                                  route.closure),
                                          color: LogBookColors.black_30,
                                          size: 17,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: LogBookColors.paleGrey,
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
                          Container(
                            padding: const EdgeInsets.all(3.5),
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: LogBookColors.white,
                                border: Border.all(
                                  color: LogBookColors.whiteTwo,
                                )),
                            child: Wrap(
                              children: <Widget>[
                                for(String tag in route.tags)
                                  Center(
                                    child: Text(tag),
                                  ),
                              ],
                            ),
                          )
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
