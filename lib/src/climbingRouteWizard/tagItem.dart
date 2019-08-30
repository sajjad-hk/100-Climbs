import 'package:flutter/material.dart';

class TagItem extends StatelessWidget {
  final String text;
  final Function onTab;
  TagItem({@required this.text, this.onTab});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTab,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Color(0xff4c000000),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        width: text.length * 9.0 + 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              Icons.close,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
