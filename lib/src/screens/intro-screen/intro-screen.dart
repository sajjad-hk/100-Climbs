import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
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

  @override
  void initState() {
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
      child: Stack(
        alignment: AlignmentDirectional.center,
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
                emailTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => sendEmail(),
                privacyLinkTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => _launchURL(),
              ),
              IntroPage(
                ind: 2,
                emailTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => sendEmail(),
                privacyLinkTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => _launchURL(),
              ),
              IntroPage(
                ind: 3,
                emailTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => sendEmail(),
                privacyLinkTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => _launchURL(),
              ),
              IntroPage(
                ind: 4,
                emailTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => sendEmail(),
                privacyLinkTapRecognizer: TapGestureRecognizer()
                  ..onTap = () => _launchURL(),
              )
            ],
          ),
          Positioned(
            bottom: screens['INTRO']['MARGIN'][LayoutUtils(context).screenSize],
            child: Semantics(
              readOnly: true,
              label: 'Sign in with Google account',
              button: true,
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        margin: screens['INTRO']['P_I']
                            [LayoutUtils(context).screenSize],
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
                  Semantics(
                    label: 'Sign in with Google',
                    button: true,
                    child: FlatButton.icon(
                      padding: screens['INTRO']['BUTTON']
                          [LayoutUtils(context).screenSize],
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
    const url = 'https://climbs-dev.firebaseapp.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
}
