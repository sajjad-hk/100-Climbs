import 'package:climbing_logbook/src/auth.dart';
import 'package:climbing_logbook/src/dashboard.dart';
import 'package:climbing_logbook/src/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(ClimbingLogbook());

class ClimbingLogbook extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLIMBING LOGBOOK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Dashboard(user: snapshot.data);
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
