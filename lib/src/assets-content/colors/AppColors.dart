import 'dart:ui';

import 'package:hundred_climbs/src/models/enums.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color azure = Color(0xff00abff);

  static const Color white = Color(0xfff6f6f6);
  static const Color white2 = Color(0xffe8e8e8);
  static const Color paleGrey = Color(0xffe7ecee);
  static const Color paleGrey2 = Color(0xfff1f4f5);
  static const Color paleGrey3 = Color(0xffedf4f6);
  static const Color silver = Color(0xffd8e2e5);
  static const Color coolGrey = Color(0xff95989a);
  static const Color coolGrey2 = Color(0xffa7acad);
  static const Color warmGrey = Color(0xff8b8b8b);
  static const Color dark = Color(0xff0e1823);
  static const Color lightNavy = Color(0xff165571);
  static const Color black50 = Color(0x80000000);
  static const Color black30 = Color(0x4d000000);
  static const Color black7 = Color(0x12000000);
  static const Color black70 = Color(0xb3000000);

  static const Color iceBlue28 = Color(0x47f1f9ff);
  static const Color greyIsh = Color(0xffb1b1b1);
  static const Color green = Color(0xff15cb39);

  static const Color blurPle = Color(0xff4f3bd5);
  static const Color azul = Color(0xff3b5de8);
  static const Color azureTwo = Color(0xff009fee);
  static const Color brightSkyBlue = Color(0xff0ec2f0);
  static const Color topaz = Color(0xff15cdcb);
  static const Color turquoise = Color(0xff0abfa4);
  static const Color darkSeaFoam = Color(0xff1cb371);
  static const Color mediumGreen = Color(0xff42c054);
  static const Color apple = Color(0xff6bc440);
  static const Color grossGreen = Color(0xffa7ca12);
  static const Color mustardYellow = Color(0xffe0d00a);
  static const Color sunflowerYellow = Color(0xffffcc00);
  static const Color mangoTwo = Color(0xffffac2e);
  static const Color tangerine = Color(0xffff9200);
  static const Color pinkishOrangeTwo = Color(0xffff6c41);
  static const Color coral2 = Color(0xfff74444);
  static const Color strawberry = Color(0xffef2d3f);
  static const Color pinkishRedTwo = Color(0xffdf0e3e);
  static const Color cerise = Color(0xffe20866);
  static const Color strongPinkTwo = Color(0xfff71888);
  static const Color purplePinkTwo = Color(0xffe524aa);
  static const Color barney = Color(0xffc522a9);
  static const Color barney3 = Color(0xffa71ab2);
  static const Color barney4 = Color(0xffae26a3);
  static const Color purple = Color(0xff7c1eb2);
  static const Color violetBlue = Color(0xff7108cd);

  static Color getGradeColor(String grade) {
    switch (grade) {
      case '4':
        return blurPle;
      case '5a':
        return azul;
      case '5a+':
        return azureTwo;
      case '5b':
        return brightSkyBlue;
      case '5b+':
        return topaz;
      case '5c':
        return turquoise;
      case '5c+':
        return darkSeaFoam;
      case '6a':
        return mediumGreen;
      case '6a+':
        return apple;
      case '6b':
        return grossGreen;
      case '6b+':
        return mustardYellow;
      case '6c':
        return sunflowerYellow;
      case '6c+':
        return mangoTwo;
      case '7a':
        return tangerine;
      case '7a+':
        return pinkishOrangeTwo;
      case '7b':
        return coral2;
      case '7b+':
        return strawberry;
      case '7c':
        return pinkishRedTwo;
      case '7c+':
        return cerise;
      case '8a':
        return strongPinkTwo;
      case '8a+':
        return purplePinkTwo;
      case '8b':
        return barney;
      case '8b+':
        return barney3;
      case '8c':
        return purple;
      case '8c+':
        return violetBlue;
      default:
        return Colors.white;
    }
  }

  static String getGradeCSSColor(String grade) {
    switch (grade) {
      case '4':
        return '#4f3bd5';
      case '5a':
        return '#3b5de8';
      case '5a+':
        return '#009fee';
      case '5b':
        return '#0ec2f0';
      case '5b+':
        return '#15cdcb';
      case '5c':
        return '#0abfa4';
      case '5c+':
        return '#1cb371';
      case '6a':
        return '#42c054';
      case '6a+':
        return '#6bc440';
      case '6b':
        return '#a7ca12';
      case '6b+':
        return '#e0d00a';
      case '6c':
        return '#ffcc00';
      case '6c+':
        return '#ffac2e';
      case '7a':
        return '#ff9200';
      case '7a+':
        return '#ff6c41';
      case '7b':
        return '#f74444';
      case '7b+':
        return '#ef2d3f';
      case '7c':
        return '#df0e3e';
      case '7c+':
        return '#e20866';
      case '8a':
        return '#f71888';
      case '8a+':
        return '#e524aa';
      case '8b':
        return '#c522a9';
      case '8b+':
        return '#a71ab2';
      case '8c':
        return '#7c1eb2';
      case '8c+':
        return '#7108cd';
      default:
        return 'white';
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
