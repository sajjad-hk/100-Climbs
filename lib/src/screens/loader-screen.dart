import 'package:flare_flutter/flare_actor.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/auth.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  void initState() {
    super.initState();
    authService.getUser.then(
      (user) {
        if (user != null) {
          Future.delayed(Duration(seconds: 2))
              .then((__) => Navigator.pushReplacementNamed(context, '/home'));
        } else {
          Navigator.pushReplacementNamed(context, '/intro-screen');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightNavy,
            AppColors.dark,
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: AspectRatio(
        aspectRatio: 1,
        child: FlareActor(
          'assets/loading.flr',
          alignment: Alignment.center,
          animation: 'loading',
        ),
      ),
    );
  }
}
