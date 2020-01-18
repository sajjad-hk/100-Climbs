import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(HundredClimbs());
}

class HundredClimbs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: authService.user,
        ),
        ChangeNotifierProvider.value(
          value: Store(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '100 Climbs',
        theme: ThemeData(
          primaryColor: AppColors.dark,
        ),
        routes: {
          '/': (context) => SafeArea(child: Login()),
          '/home': (context) => SafeArea(child: Home()),
          '/edit-climb-screen': (context) => SafeArea(child: EditRouteWizard()),
        },
      ),
    );
  }
}
