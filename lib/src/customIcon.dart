import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {

  final String path;

  CustomIcon({@required this.path});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path)
        ),
      ),
    );
  }
}
