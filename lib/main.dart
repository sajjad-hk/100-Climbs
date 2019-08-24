import 'package:climbing_logbook/src/auth.dart';
import 'package:climbing_logbook/src/home.dart';
import 'package:climbing_logbook/src/login.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ClimbingLogbook());
}

class ClimbingLogbook extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      catchError: (_, __) => null,
      child: MaterialApp(
        title: 'CLIMBING LOGBOOK',
        home: Consumer<FirebaseUser>(
          builder: (context, firebaseUser, _) {
            if (firebaseUser != null) {
              return MultiProvider(
                providers: [
                  StreamProvider<ClimbingLogBookUser>.value(
                    stream:
                    authService.climbingLogBookUser(firebaseUser.uid),
                    catchError: (_, __) => null,
                  ),
                  ChangeNotifierProvider<ClimbingRouteState>(
                    builder: (context) => ClimbingRouteState(),
                  ),
                ],
                child: Home(),
              );
            } else {
              return Login();
            }
          },
        ),
      ),
    );
  }
}
