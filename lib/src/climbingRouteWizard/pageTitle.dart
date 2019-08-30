import 'package:flutter/material.dart';

class WizardPageTitle extends StatelessWidget {
  final String title;

  WizardPageTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 2.0),
                blurRadius: 3.0,
                color: Color(0xff29000000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
