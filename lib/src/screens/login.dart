import 'package:firebase_auth/firebase_auth.dart';
import 'package:hundred_climbs/src/services/auth.dart';

import 'screens.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final googleIconPath = 'assets/icons/google-icon.png';

  final facebookIconPath = 'assets/icons/facebook-icon.png';

  final envelopeIconPath = 'assets/icons/envelope-icon.png';

  @override
  void initState() {
    super.initState();
    authService.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
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
          colors: [AppColors.lightNavy, AppColors.dark],
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
                          onPressed: () async {
                            FirebaseUser user =
                                await authService.googleSignIn();
                            if (user != null) {
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(),
                )
              ],
            ),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 80,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        textColor: Colors.white,
        color: AppColors.dark,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 26.0,
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
