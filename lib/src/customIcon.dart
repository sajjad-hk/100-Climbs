import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String path;
  final Color color;

  CustomIcon({@required this.path, @required this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ImageIcon(
        AssetImage(path),
        color: color,
        size: constraint.biggest.height,
      );
    });
  }
}
