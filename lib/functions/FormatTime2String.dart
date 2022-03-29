///
/// When Displaying DayTime type Variables use this function
/// to format the TimeStamp to hours and Minutes only
/// and converting it to a String
///
String FormatTime2String(DateTime time){
  return time.year.toString() + ':' + time.month.toString().padLeft(2, '0') + ':' + time.day.toString().padLeft(2, '0') + '  ' + time.hour .toString().padLeft(2, '0') + ':' + time.minute.toString().padLeft(2, '0') ;
}

