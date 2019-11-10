import 'package:hundred_climbs/src/services/auth.dart';
import 'package:hundred_climbs/src/commons/customIcon.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final googleIconPath = 'assets/icons/google-icon.png';
  final facebookIconPath = 'assets/icons/facebook-icon.png';
  final envelopeIconPath = 'assets/icons/envelope-icon.png';

  final Color backgroundFrom = Color(0xff165571);
  final Color backgroundTo = Color(0xff0e1823);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backgroundFrom, backgroundTo],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(40.0),
                child: Image(
                  image: AssetImage('assets/icons/100_climbs.png'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 4,
                          child: LoginButton(
                            label: 'Sign in with Google',
                            path: googleIconPath,
                            onPressed: () => authService.googleSignIn(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
// TOdo in future
//                  Expanded(
//                    flex: 2,
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 1,
//                          child: Container(),
//                        ),
//                        Expanded(
//                          flex: 4,
//                          child: LoginButton(
//                            label: 'Sign in with Facebook',
//                            path: facebookIconPath,
//                            onPressed: () {},
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child: Container(),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          flex: 1,
//                          child: Container(),
//                        ),
//                        Expanded(
//                          flex: 4,
//                          child: LoginButton(
//                            label: 'Sign in with email',
//                            path: envelopeIconPath,
//                            onPressed: () {},
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child: Container(),
//                        ),
//                      ],
//                    ),
//                  ),
                  Expanded(
                    flex: 4,
                    child: Container(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton(
      {@required this.label, @required this.onPressed, @required this.path});

  final String label;
  final GestureTapCallback onPressed;
  final path;
  final Color backgroundButton = Color(0xFF0e1823);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        textColor: Colors.white,
        color: backgroundButton,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              child: CustomIcon(
                path: path,
              ),
            ),
            Container(
              child: Text(
                label,
              ),
            )
          ],
        ),
      ),
    );
  }
}
