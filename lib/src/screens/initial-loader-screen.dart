import 'package:flare_flutter/flare_actor.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/auth.dart';

class InitialLoader extends StatefulWidget {
  @override
  _InitialLoaderState createState() => _InitialLoaderState();
}

class _InitialLoaderState extends State<InitialLoader> {
  @override
  void initState() {
    authService.getUser.then(
      (user) {
        if (user != null) {
          Future.delayed(Duration(seconds: 5))
              .then((__) => Navigator.pushReplacementNamed(context, '/home'));
        } else {
          Navigator.pushReplacementNamed(context, '/intro-screen');
        }
      },
    );
    super.initState();
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
          animation: 'Loading animation',
        ),
      ),
    );
  }
}
