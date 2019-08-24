import 'package:climbing_logbook/src/colors/LogBookColors.dart';
import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  final List<ClimbingRoute> routes;
  final GestureTapCallback onEdit;

  ClimbingRoutes({this.routes, this.onEdit});

  @override
  Widget build(BuildContext context) {
//    final r = Provider.of<List<ClimbingRoute>>(context);

    return SliverList(
        delegate: SliverChildListDelegate(routes.map((it) {
      return Container(
        padding: EdgeInsets.all(5.0),
        child: Card(
          shape: BeveledRectangleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: LogBookColors.getGradeColor(it.grade),
                  height: 90,
                  width: 6,
                ),
                Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  it.grade,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 35,
                            width: 35,
                            child: Center(child: CustomIcon(
                              path: LogBookIcons.toprope,
                              color: LogBookColors.black_30,
                              size: 25,
                            )),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: LogBookColors.silver,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 2.5,
                    children: <Widget>[
//                      _buildBelayTag('OS', Color(0xff374f94), Color(0xff374f94),
//                          Colors.white),
//                      _buildBelayTag('LD', Color(0xff2c666e), Color(0xff2c666e),
//                          Colors.white),
//                      _buildBelayTag('AB', Color(0xff2c666e),
//                          Color(0xff22e2c666e), Color(0xff2c666e)),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(1.0),
                      height: 40,
                      decoration: new BoxDecoration(
                        color: Color(0xffe7ecee),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        splashColor: Color(0xff8b8b8b),
                        icon: Icon(
                          Icons.mode_edit,
                          size: 20,
                          color: Color(0xff8b8b8b),
                        ),
                        onPressed: () {
                          onEdit();
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1.0),
                      height: 40,
                      decoration: new BoxDecoration(
                        color: Color(0xffffebeb),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        splashColor: Color(0xffd6acac),
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                          color: Color(0xffd6acac),
                        ),
                        onPressed: () {},
                      ),
                    ),
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
      );
    }).toList()));
  }
}
