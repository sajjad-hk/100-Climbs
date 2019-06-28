import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  final List<ClimbingRoute> routes;

  ClimbingRoutes({this.routes});

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
                  color: Colors.redAccent,
                  height: 65,
                  width: 6,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
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
                        onPressed: () {},
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
