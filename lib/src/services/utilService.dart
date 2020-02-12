class UtilService {
  DateTime dateWithoutTime(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);
}

final utils = UtilService();
