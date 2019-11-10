import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/commons/customIcon.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Color chartBackgroundTo = Color(0xff0e1823);
final Color text = Color(0xFFd8e2e5);

class CustomDrawer extends StatelessWidget {
  CustomDrawer({@required this.accountType});

  final String accountType;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return Drawer(
      child: Container(
        color: chartBackgroundTo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 35.0, top: 25.0),
              child: Image(
                image: AssetImage('assets/icons/100_climbs.png'),
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
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.getGradeColor('5b'),
                          ),
                        ),
                        Positioned(
                            left: 2.5,
                            top: 2.5,
                            child: user.photoUrl == null
                                ? Icon(
                                    Icons.account_circle,
                                    color: Color(0xff14d8e2e5),
                                    size: 100,
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(user.photoUrl),
                                    backgroundColor: Color(0x14d8e2e5),
                                  )),
                      ],
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
                padding: const EdgeInsets.only(left: 35.0, bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: FlatButton(
                        color: Colors.black,
                        onPressed: () => authService.signOut(context),
                        child: Container(
                          width: 100,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                'SIGN OUT',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
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
