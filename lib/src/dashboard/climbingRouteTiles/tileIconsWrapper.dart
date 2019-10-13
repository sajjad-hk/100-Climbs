import 'package:flutter/material.dart';

class TileIconsWrapper extends StatelessWidget {
  final Widget icon;
  final Color color;
  TileIconsWrapper({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Center(
        child: icon,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
