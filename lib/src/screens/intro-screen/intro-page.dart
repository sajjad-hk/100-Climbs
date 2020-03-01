import 'package:flutter/gestures.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class IntroPage extends StatelessWidget {
  final int ind;
  final TapGestureRecognizer emailTapRecognizer;
  final TapGestureRecognizer privacyLinkTapRecognizer;

  IntroPage(
      {Key key,
      this.ind,
      this.privacyLinkTapRecognizer,
      this.emailTapRecognizer});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              child: AspectRatio(
                aspectRatio: screens['INTRO']['ASPECTR']
                    [LayoutUtils(context).screenSize],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/onboarding_$ind.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: introText(ind - 1, context),
          ),
        ],
      ),
    );
  }

  RichText introText(int i, context) {
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
                fontSize: screens['INTRO']['FONT_SIZE']
                    [LayoutUtils(context).screenSize]),
            children: [
              TextSpan(
                  text:
                      '100 climbs is a simple climb logging app. It lets you record the routes you climbed and build a history of your sessions to track your progress.'),
            ],
          ),
        );
      case 1:
        return RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            height: 1.5,
            fontSize: screens['INTRO']['FONT_SIZE']
                [LayoutUtils(context).screenSize],
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
            fontSize: screens['INTRO']['FONT_SIZE']
                [LayoutUtils(context).screenSize],
          ),
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text:
                      'We would love to know what you think. Our small Warsaw-based team is waiting for your feedback on '),
              TextSpan(
                  text: '100climbs.app@gmail.com',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: emailTapRecognizer),
            ],
          ),
        );
      case 3:
        return RichText(
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            height: 1.5,
            fontSize: screens['INTRO']['FONT_SIZE']
                [LayoutUtils(context).screenSize],
          ),
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text:
                      'We treat privacy seriously. We don\'t sell or share your data with third parties. Read more in our\n'),
              TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: privacyLinkTapRecognizer),
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
