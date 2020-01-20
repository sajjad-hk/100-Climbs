import 'package:hundred_climbs/src/screens/screens.dart';

class IntroPage extends StatelessWidget {
  final int ind;

  const IntroPage({Key key, this.ind}) : super(key: key);
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
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/onboarding_$ind.png'),
            ),
          ),
        ),
      ),
    );
  }
}
