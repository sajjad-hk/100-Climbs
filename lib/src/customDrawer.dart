import 'package:climbing_logbook/src/auth.dart';
import 'package:climbing_logbook/src/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/widgets.dart';

final Color chartBackgroundTo = Color(0xff0e1823);
final Color text = Color(0xFFd8e2e5);

class CustomDrawer extends StatelessWidget {
  CustomDrawer({@required this.accountType, @required this.user});

  final String accountType;
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: chartBackgroundTo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 35.0, top: 25.0),
              child: Text(
                'CLIMBING LOGBOOK',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0x14d8e2e5),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Signed in with " + accountType + " account as",
                        style: TextStyle(
                          color: text,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        user.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: RaisedButton(
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  child: Container(
                                    height: double.infinity,
                                    child: Center(
                                      child: Text('SIGN OUT'),
                                    ),
                                  ),
                                  onPressed: () => authService.signOut(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    FlatButton(
                      color: chartBackgroundTo,
                      textColor: Colors.white,
                      child: Text('REPORT BUG'),
                      onPressed: () => null,
                    ),
                    FlatButton(
                      color: chartBackgroundTo,
                      textColor: Colors.white,
                      child: Text('REQUEST A FEATURE'),
                      onPressed: () => null,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
