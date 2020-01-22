import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return Container(
      color: AppColors.dark,
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
                          color: AppColors.getGradeColor(user.bestClimb.grade),
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
                                  backgroundImage: NetworkImage(user.photoUrl),
                                  backgroundColor: Color(0x14d8e2e5),
                                )),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Signed in with Gmail account as",
                      style: TextStyle(
                        color: AppColors.silver,
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
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 35.0, bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    color: Colors.black,
                    onPressed: () async {
                      await authService.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/intro-screen', (route) => false);
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CustomIcon(
                            path: AppIcons.logOut,
                            size: 40,
                          ),
                          Text(
                            'SIGN OUT',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: sendEmail,
                    child: Row(
                      children: <Widget>[
                        CustomIcon(
                          path: AppIcons.paperPlane,
                          size: 40,
                        ),
                        Text(
                          'CONTACT US',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  sendEmail() async {
    const email = 'mailto:100climbs.app@gmail.com';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }
}
