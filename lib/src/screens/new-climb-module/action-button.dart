import 'package:flutter/material.dart';

class PageActionButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onTap;
  final AlignmentGeometry alignment;

  const PageActionButton({Key key, this.iconData, this.onTap, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
