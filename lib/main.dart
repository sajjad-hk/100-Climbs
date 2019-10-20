import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/services/auth.dart';
import 'package:climbing_logbook/src/home.dart';
import 'package:climbing_logbook/src/login.dart';
import 'package:climbing_logbook/src/models/values.dart';
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
      child: MaterialApp(
        title: 'CLIMBING LOGBOOK',
        home: Consumer<FirebaseUser>(
          builder: (context, firebaseUser, _) {
            if (firebaseUser != null) {
              return StreamProvider<AppUser>.value(
                stream: authService.climbingLogBookUser(firebaseUser?.uid),
                child: ChangeNotifierProvider.value(
                  notifier: DashboardState(),
                  child: Home(),
                ),
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
