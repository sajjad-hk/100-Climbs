import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int currentPageValue = 0;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView(
              controller: _controller,
              onPageChanged: (int i) {
                setState(() {
                  currentPageValue = i;
                });
              },
              children: <Widget>[
                IntroPage(
                  ind: 1,
                ),
                IntroPage(
                  ind: 2,
                ),
                IntroPage(
                  ind: 3,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                  child: Text(
                    introText(currentPageValue),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < 3; i++)
                            if (i == currentPageValue) ...[
                              circleBar(true, i)
                            ] else
                              circleBar(false, 0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(5),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: toLogin,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          currentPageValue == 2 ? 'SIGN IN' : 'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.all(5),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: skipIntro,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'SKIP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  toLogin() async {
    if (currentPageValue == 2) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('IS_INTRO_VISITED', 'YES');
      Navigator.pushReplacementNamed(context, '/login-screen');
    } else
      _controller.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
  }

  Future checkIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String isVisited = prefs.getString('IS_INTRO_VISITED');
    return isVisited ?? 'NO';
  }

  skipIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('IS_INTRO_VISITED', 'YES');
    Navigator.pushReplacementNamed(context, '/login-screen');
  }

  Widget circleBar(bool isActive, int pgNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? circleColor(pgNo) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  Color circleColor(int i) {
    switch (i) {
      case 0:
        return AppColors.azure;
      case 1:
        return AppColors.topaz;
      case 2:
        return AppColors.coral2;
      default:
        return Colors.white;
    }
  }

  String introText(int i) {
    switch (i) {
      case 0:
        return 'Record and keep track of the routes you\'ve climbed (or tried). Build a history of your training sessions and track your progress';
      case 1:
        return 'We are starting small but while you\'re building your climbs history we are working hard to add new features. Expect some updates soon!';
      case 2:
        return 'We would love to know what you think. Our small Warsaw team is waiting for your feedback on 100climbs.app@gmail.com!';
      default:
        return '';
    }
  }
}
