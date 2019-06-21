import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/ClimbingRoute.dart';

class ClimbingRoutes extends StatelessWidget {
  final List<ClimbingRoute> routes;

  ClimbingRoutes({this.routes});

  @override
  Widget build(BuildContext context) {
//    final r = Provider.of<List<ClimbingRoute>>(context);

    return SliverList(
        delegate: SliverChildListDelegate(routes.map((it) {
      return Card(
        child: Text(it.toString()),
      );
    }).toList()));
  }
}
