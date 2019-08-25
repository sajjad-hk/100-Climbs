import 'package:climbing_logbook/src/models/enums.dart';

class LogBookIcons {
  LogBookIcons._();

  static const String lead = 'assets/icons/icon_lead_active.png';
  static const String auto = 'assets/icons/icon_auto.png';
  static const String toprope = 'assets/icons/icon_toprope.png';
  static const String calendar = 'assets/icons/calendar-icon.png';
  static const String arrowLeft = 'assets/icons/arrow_left-icon.png';
  static const String envelope = 'assets/icons/envelope-icon.png';
  static const String eye = 'assets/icons/eye_white-icon.png';
  static const String facebook = 'assets/icons/facebook-icon.png';
  static const String flash = 'assets/icons/flash_white-icon.png';
  static const String google = 'assets/icons/google-icon.png';
  static const String minus = 'assets/icons/minus-icon.png';
  static const String plus = 'assets/icons/plus-icon.png';
  static const String sad = 'assets/icons/sad-white-icon.png';
  static const String smile = 'assets/icons/smile-white-icon.png';

  static String getBelayStyleIcon(BelayingStyleEnum style) {
    switch(style) {
      case BelayingStyleEnum.toprope:
        return toprope;
      case BelayingStyleEnum.auto:
        return lead;
      case BelayingStyleEnum.lead:
        return lead;
      default:
        return null;
    }
  }

  static String getRouteClimbClosureIcon(ClosureEnum closure) {
    switch(closure) {
      case ClosureEnum.flash:
        return flash;
      case ClosureEnum.onsight:
        return eye;
      default:
        return null;
    }
  }
}
