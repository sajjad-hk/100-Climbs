import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
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
      child: Container(
        margin: const EdgeInsets.only(left: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Image(
                image: AssetImage(AppIcons.logoBeta),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 90,
              height: 90,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.getGradeColor(user.bestClimb.grade),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(user.photoUrl),
                      backgroundColor: Color(0x14d8e2e5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Signed in with Google account as",
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
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: screens['DRAWER']['BUTTON_HEIGHT']
                        [LayoutUtils(context).screenSize],
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FlatButton.icon(
                      splashColor: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 10, right: 18),
                      onPressed: sendEmail,
                      icon: Container(
                        child: CustomIcon(
                          path: AppIcons.paperPlane,
                          size: 30,
                        ),
                      ),
                      label: Text(
                        'CONTACT US',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: screens['DRAWER']['BUTTON_HEIGHT']
                        [LayoutUtils(context).screenSize],
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FlatButton.icon(
                      splashColor: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 10, right: 57),
                      onPressed: () => null,
                      icon: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      label: Text(
                        'SHARE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: screens['DRAWER']['BUTTON_HEIGHT']
                        [LayoutUtils(context).screenSize],
                    child: FlatButton.icon(
                      splashColor: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 10, right: 40),
                      color: Colors.black,
                      onPressed: () async {
                        await authService.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/intro-screen', (route) => false);
                      },
                      icon: Container(
                        child: CustomIcon(
                          path: AppIcons.logOut,
                          size: 30,
                        ),
                      ),
                      label: Text(
                        'SIGN OUT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
