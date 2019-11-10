import 'package:flutter/material.dart';

class TagItem extends StatelessWidget {
  final String text;
  final Function onTab;
  TagItem({@required this.text, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => onTab(text),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color(0xff4c000000),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 8.0, top: 0, bottom: 4.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                  text: text,
                  style: TextStyle(fontSize: 14),
                ),
                TextSpan(
                  text: '  \u00D7',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
