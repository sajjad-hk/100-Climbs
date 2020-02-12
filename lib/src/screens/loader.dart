import 'package:flare_flutter/flare_actor.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class Loader extends StatelessWidget {
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
