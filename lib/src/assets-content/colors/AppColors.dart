import 'dart:ui';

import 'package:hundred_climbs/src/models/enums.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xfff6f6f6);
  static const Color whiteTwo = Color(0xffe8e8e8);
  static const Color paleGrey = Color(0xffe7ecee);
  static const Color paleGrey2 = Color(0xfff1f4f5);
  static const Color silver = Color(0xffd8e2e5);
  static const Color coolGrey = Color(0xff95989a);
  static const Color warmGrey = Color(0xff8b8b8b);
  static const Color dark = Color(0xff0e1823);
  static const Color lightNavy = Color(0xff165571);
  static const Color black_50 = Color(0x80000000);
  static const Color black30 = Color(0x4d000000);
  static const Color black7 = Color(0x12000000);
  static const Color dandelion = Color(0xffffe600);
  static const Color darkSalmon = Color(0xffd46666);
  static const Color lightishPurple = Color(0xff943ee0);
  static const Color lighterPurple = Color(0xff883ff5);
  static const Color warmBlue = Color(0xff614edf);
  static const Color azul = Color(0xff3b5de8);
  static const Color clearBlue = Color(0xff1f85fa);
  static const Color azure = Color(0xff00abff);
  static const Color lightBlue = Color(0xff62cee8);
  static const Color tealish = Color(0xff2fc4b5);
  static const Color lightSeaGreen = Color(0xff10a28c);
  static const Color elfGreen = Color(0xff179863);
  static const Color fruitSalad = Color(0xff48a657);
  static const Color emerald = Color(0xff4dbe86);
  static const Color grass = Color(0xff5cb133);
  static const Color grossGreen = Color(0xffa7ca12);
  static const Color mustardYellow = Color(0xffe0d00a);
  static const Color sunflowerYellow = Color(0xffffcc00);
  static const Color mango = Color(0xffffaa2b);
  static const Color tangerine = Color(0xffff9200);
  static const Color pinkishOrange = Color(0xffff7043);
  static const Color grapefruit = Color(0xfffd5e5e);
  static const Color coral = Color(0xfff14c4c);
  static const Color lightRed = Color(0xffff4052);
  static const Color tomato = Color(0xffe32727);
  static const Color pinkishRed = Color(0xffec1b5a);
  static const Color darkishPink = Color(0xffe82c7f);
  static const Color strongPink = Color(0xffff2b87);
  static const Color purplePink = Color(0xffec34b4);
  static const Color barney = Color(0xffc522a9);
  static const Color barneyTwo = Color(0xff992bb5);
  static const Color warmPurple = Color(0xff692c8c);
  static const Color greyish = Color(0xffb1b1b1);
  static const Color iceBlue28 = Color(0x47f1f9ff);
  static const Color green = Color(0xff15cb39);

  static Color getGradeColor(String grade) {
    switch (grade) {
      case '4a':
        return lightishPurple;
      case '4a+':
        return lighterPurple;
      case '4b':
        return warmBlue;
      case '4b+':
        return azul;
      case '4c':
        return clearBlue;
      case '4c+':
        return azure;
      case '5a':
        return lightBlue;
      case '5a+':
        return tealish;
      case '5b':
        return lightSeaGreen;
      case '5b+':
        return elfGreen;
      case '5c':
        return fruitSalad;
      case '5c+':
        return emerald;
      case '6a':
        return grass;
      case '6a+':
        return grossGreen;
      case '6b':
        return mustardYellow;
      case '6b+':
        return sunflowerYellow;
      case '6c':
        return mango;
      case '6c+':
        return tangerine;
      case '7a':
        return pinkishOrange;
      case '7a+':
        return grapefruit;
      case '7b':
        return coral;
      case '7b+':
        return lightRed;
      case '7c':
        return tomato;
      case '7c+':
        return pinkishRed;
      case '8a':
        return darkishPink;
      case '8a+':
        return strongPink;
      case '8b':
        return purplePink;
      case '8b+':
        return barney;
      case '8c':
        return barneyTwo;
      case '8c+':
        return warmPurple;
      default:
        return Colors.white;
    }
  }

  static Color getClimbingRouteOutcomeColor(OutComeEnum outCome) {
    switch (outCome) {
      case OutComeEnum.failure:
        return paleGrey;
      case OutComeEnum.success:
        return Colors.white;
      default:
        return null;
    }
  }

  static Color getClimbingRouteOutcomeBorderColor(OutComeEnum outCome) {
    switch (outCome) {
      case OutComeEnum.failure:
        return paleGrey;
      case OutComeEnum.success:
        return Colors.transparent;
      default:
        return null;
    }
  }
}
