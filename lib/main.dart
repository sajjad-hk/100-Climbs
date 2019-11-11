import 'dart:async';

import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/dashboard/state/dashboardState.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:hundred_climbs/src/home.dart';
import 'package:hundred_climbs/src/login.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(HundredClimbs());
}

class HundredClimbs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '100 Climbs',
        theme: ThemeData(primaryColor: AppColors.dark),
        home: Consumer<FirebaseUser>(
          builder: (context, firebaseUser, _) {
            if (firebaseUser != null) {
              return StreamProvider<AppUser>.value(
                stream: authService.hundredClimbsUser(firebaseUser?.uid),
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
