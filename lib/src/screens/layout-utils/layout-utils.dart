import 'dart:math';
import 'package:flutter/material.dart';

class LayoutUtils {
  String screenSize;

  LayoutUtils._(this.screenSize);

  factory LayoutUtils(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double diagonal = sqrt(pow(size.width, 2) + pow(size.height, 2));
    if (diagonal > 820) return LayoutUtils._('LARGE');
    if (diagonal < 720) return LayoutUtils._('SMALL');
    return LayoutUtils._('MEDIUM');
  }
}

Map screens = {
  'NEW_CLIMB': {
    'PAGE_ACTION_BUTTON': {'SMALL': 30.0, 'MEDIUM': 40.0, 'LARGE': 50.0},
    'PAGE_ACTION_FONT': {'SMALL': 14.0, 'MEDIUM': 16.0, 'LARGE': 18.0},
    'BUTTON_FONT': {'SMALL': 16.0, 'MEDIUM': 18.0, 'LARGE': 20.0},
    'PAGE_ICON': {'SMALL': 20.0, 'MEDIUM': 25.0, 'LARGE': 30.0},
    'GRADE_ICON': {'SMALL': 40.0, 'MEDIUM': 50.0, 'LARGE': 60.0},
  },
  'PAGE_OUT_COME': {
    'BUTTON_HEIGHT': {'SMALL': 120.0, 'MEDIUM': 140.0, 'LARGE': 160.0},
    'BUTTON_WIDTH': {'SMALL': 140.0, 'MEDIUM': 160.0, 'LARGE': 180.0},
  },
  'PAGE_GRADE': {
    'CIRCLE_MARGIN': {
      'SMALL': const EdgeInsets.all(30),
      'MEDIUM': const EdgeInsets.all(25),
      'LARGE': const EdgeInsets.all(20),
    },
    'KNOB_SIZE': {'SMALL': 35.0, 'MEDIUM': 40.0, 'LARGE': 45.0},
    'INNER_KNOB_SIZE': {'SMALL': 18.0, 'MEDIUM': 23.0, 'LARGE': 30.0},
  },
  'PAGE_BELAY_STYLE': {
    'BUTTON_HEIGHT': {'SMALL': 70.0, 'MEDIUM': 80.0, 'LARGE': 95.0},
    'BUTTON_WIDTH': {'SMALL': 160.0, 'MEDIUM': 170.0, 'LARGE': 190.0},
  },
  'EDIT_CLIMB': {
    'ICON_SIZE': {'SMALL': 20.0, 'MEDIUM': 25.0, 'LARGE': 30.0},
    'ICON_SIZE_2': {'SMALL': 20.0, 'MEDIUM': 30.0, 'LARGE': 40.0},
    'BUTTON_HEIGHT': {'SMALL': 40.0, 'MEDIUM': 50.0, 'LARGE': 60.0},
    'ACTION_ICON': {'SMALL': 20.0, 'MEDIUM': 25.0, 'LARGE': 30.0},
    'BUTTON_HEIGHT_2': {'SMALL': 40.0, 'MEDIUM': 55.0, 'LARGE': 60.0},
  },
  'DASHBOARD': {
    'FONT_SIZE': {'SMALL': 12.0, 'MEDIUM': 13.0, 'LARGE': 14.0},
    'FONT_SIZE_2': {'SMALL': 24.0, 'MEDIUM': 28.0, 'LARGE': 30.0},
    'TILE_HEIGHT': {'SMALL': 65.0, 'MEDIUM': 60.0, 'LARGE': 70.0},
    'ICON_SIZE': {'SMALL': 20.0, 'MEDIUM': 25.0, 'LARGE': 30.0},
    'FAILURE_DASHLINE_SKIP': {'SMALL': 3.1, 'MEDIUM': 3.3, 'LARGE': 3.3},
    'TAG_HEIGHT': {'SMALL': 25.0, 'MEDIUM': 30.0, 'LARGE': 35.0},
    'BORDER_RADIUS': {'SMALL': 14.0, 'MEDIUM': 14.0, 'LARGE': 20.0},
    'CHART_HEIGHT': {'SMALL': 280.0, 'MEDIUM': 300.0, 'LARGE': 330.0},
  },
  'DRAWER': {
    'PROFILE_PIC_SIZE': {'SMALL': 45.0, 'MEDIUM': 50.0, 'LARGE': 60.0},
    'BUTTON_HEIGHT': {'SMALL': 45.0, 'MEDIUM': 50.0, 'LARGE': 60.0}
  },
  'TAG_ICON': {'SMALL': 20.0, 'MEDIUM': 22.0, 'LARGE': 30.0},
  'INTRO': {
    'FONT_SIZE': {'SMALL': 12.0, 'MEDIUM': 14.0, 'LARGE': 16.0},
    'BUTTON': {
      'SMALL': const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 12.0, right: 12.0),
      'MEDIUM': const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 18.0, right: 18.0),
      'LARGE': const EdgeInsets.only(
          top: 15.0, bottom: 15.0, left: 25.0, right: 25.0),
    },
    'P_I': {
      'SMALL': const EdgeInsets.only(bottom: 20.0),
      'MEDIUM': const EdgeInsets.only(bottom: 30.0),
      'LARGE': const EdgeInsets.only(bottom: 30.0)
    },
    'ASPECTR': {'SMALL': 1.0, 'MEDIUM': 0.9, 'LARGE': 0.8},
    'MARGIN': {'SMALL': 20.0, 'MEDIUM': 30.0, 'LARGE': 40.0},
  }
};
