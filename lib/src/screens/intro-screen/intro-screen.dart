import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int currentPageValue = 0;
  final PageController _controller = PageController();
  TapGestureRecognizer _emailTapRecognizer;
  TapGestureRecognizer _privacyLinkTapRecognizer;

  @override
  void initState() {
    super.initState();
    _emailTapRecognizer = TapGestureRecognizer()..onTap = () => sendEmail();
    _privacyLinkTapRecognizer = TapGestureRecognizer()
      ..onTap = () => _launchURL();
  }

  void sendEmail() async {
    const email = 'mailto:100climbs.app@gmail.com';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }

  void _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                IntroPage(
                  ind: 4,
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < 4; i++)
                            if (i == currentPageValue) ...[
                              circleBar(true, i)
                            ] else
                              circleBar(false, 0),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: introText(currentPageValue),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: FlatButton.icon(
                    padding: const EdgeInsets.only(
                        left: 30, bottom: 15, right: 30, top: 15),
                    color: AppColors.dark,
                    icon: Image(
                      height: 30,
                      width: 30,
                      image: AssetImage(AppIcons.google),
                    ),
                    label: Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      FirebaseUser user = await authService.googleSignIn();
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, '/');
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
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
      case 3:
        return AppColors.barney4;
      default:
        return Colors.white;
    }
  }

  RichText introText(int i) {
    switch (i) {
      case 0:
        return RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            height: 1.5,
          ),
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text:
                      'Record and keep track of the routes you\'ve climbed (or tried). Build a history of your training sessions and track your progress'),
            ],
          ),
        );
      case 1:
        return RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            height: 1.5,
          ),
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text:
                      'We are starting small but while you\'re building your climbs history we are working hard to add new features. Expect some updates soon!'),
            ],
          ),
        );

      case 2:
        return RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            height: 1.5,
          ),
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text:
                      'We would love to know what you think. Our small Warsaw team is waiting for your feedback on '),
              TextSpan(
                  text: '100climbs.app@gmail.com!',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                  recognizer: _emailTapRecognizer),
            ],
          ),
        );
      case 3:
        return RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            height: 1.5,
          ),
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text:
                      'We value your privacy. We don\'t share your data with third parties. Read more in our'),
              TextSpan(
                  text: '\nPrivacy Policy.',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: _privacyLinkTapRecognizer),
            ],
          ),
        );
      default:
        return RichText(
          text: TextSpan(text: ''),
        );
    }
  }
}
