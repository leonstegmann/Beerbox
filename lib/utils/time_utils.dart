DateTime veryShortTime = DateTime.fromMillisecondsSinceEpoch(const Duration(minutes: 2).inMilliseconds);
DateTime shortTime = DateTime.fromMillisecondsSinceEpoch(const Duration(minutes: 4).inMilliseconds);
DateTime someTime = DateTime.fromMillisecondsSinceEpoch(const Duration(minutes: 6).inMilliseconds);
DateTime longTime = DateTime.fromMillisecondsSinceEpoch(const Duration(minutes: 8).inMilliseconds);
DateTime veryLongTime = DateTime.fromMillisecondsSinceEpoch(const Duration(minutes: 10).inMilliseconds);

/// When Displaying DayTime type Variables use this function
/// to format the TimeStamp to hours and Minutes only
/// and converting it to a String
String formatDateTime2DatetimeString(DateTime time) {
  return time.year.toString() +
      ':' + time.month.toString().padLeft(2, '0') +
      ':' + time.day.toString().padLeft(2, '0') +
      '  ' + time.hour.toString().padLeft(2, '0') +
      ':' + time.minute.toString().padLeft(2, '0');
}

String dateTime2TimeString(DateTime time) {
  return time.hour.toString().padLeft(2, '0') +
      ':' +
      time.minute.toString().padLeft(2, '0');
}

DateTime getTimePast(DateTime dateTime) {
  return DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().difference(dateTime).inMilliseconds
  );
}
