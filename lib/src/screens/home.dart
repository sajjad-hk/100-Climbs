import 'package:firebase_auth/firebase_auth.dart';
import 'package:hundred_climbs/src/screens/dashboard-screen/dashboard-screen.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<FirebaseUser>(context);
    final store = Provider.of<Store>(context);
    return SafeArea(
      child: StreamProvider.value(
        value: authService.userInfo(firebaseUser?.uid),
        child: Stack(
          children: <Widget>[
            Dashboard(),
            if (store.isNewClimbOpen) NewClimb(),
          ],
        ),
      ),
    );
  }
}
