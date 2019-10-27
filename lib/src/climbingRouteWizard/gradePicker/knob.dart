import 'package:flutter/material.dart';

class Knob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xff29000000),
              blurRadius: 4.0,
              spreadRadius: 2.5,
              offset: Offset(0.0, 2.0)),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff29000000),
                blurRadius: 3.0,
                spreadRadius: 3.0,
                offset: Offset(0.0, 1.0),
              ),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
