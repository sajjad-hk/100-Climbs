import 'package:hundred_climbs/src/models/enums.dart';

class AppIcons {
  AppIcons._();

  static const String lead = 'assets/icons/lead_icon.png';
  static const String auto = 'assets/icons/auto_icon.png';
  static const String topRope = 'assets/icons/toprope_icon.png';
  static const String calendar = 'assets/icons/calendar_icon.png';
  static const String flash = 'assets/icons/flash_icon.png';
  static const String google = 'assets/icons/google-icon.png';
  static const String minus = 'assets/icons/minus-icon.png';
  static const String plus = 'assets/icons/plus-icon.png';
  static const String sad = 'assets/icons/sad-white-icon.png';
  static const String smile = 'assets/icons/smile-white-icon.png';
  static const String paperPlane = 'assets/icons/paper_plane.png';
  static const String logOut = 'assets/icons/log_out.png';
  static const String emptyIllustration = 'assets/icons/empty_illustration.png';

  static String getBelayStyleIcon(BelayingStyleEnum style) {
    switch (style) {
      case BelayingStyleEnum.toprope:
        return topRope;
      case BelayingStyleEnum.auto:
        return auto;
      case BelayingStyleEnum.lead:
        return lead;
      default:
        return null;
    }
  }
}
