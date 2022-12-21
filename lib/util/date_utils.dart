import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateConstants {
  static const String apiDateFormat = "yyyy-MM-dd HH:mm:ss";
  static const String dateFormat = "yyyy-MM-dd";
  static const String displayDateFormat = "dd MMMM yyyy";
  static const String commonDateFormat = "dd MMM yyyy";
  static const String commonTimeFormat = "hh:mm a";
  static const String notificationDateFormat = "dd/MM";
  static const String notificationTimeFormat = "H:mm";
  static const String isoDateFormat = "yyyy-MM-ddTHH:mm:ss.SSS";
  static const String entrNotificationDateFormat = "dd/M/yyyy";
}

String getCurrentDateString(String dateFormat) {
  initializeDateFormatting();
  return DateFormat(dateFormat).format(DateTime.now()).toString();
}

String getUtcDate() {
  var dateUtc = DateTime.now().toUtc();
  var date = DateFormat(DateConstants.apiDateFormat).format(dateUtc);
  return date;
}

String getLocalTime(String dateUtc) {
  // convert it to local
  var dateTime = DateFormat(DateConstants.apiDateFormat).parse(dateUtc, true);
  var dateLocal = dateTime.toLocal();
  return DateFormat(DateConstants.commonTimeFormat)
      .format(dateLocal)
      .replaceAll(' ', '')
      .toLowerCase();
}

String dateToString (DateTime date,
    {String dateFormat = DateConstants.commonDateFormat}){
  return DateFormat(dateFormat).format(date);
}

DateTime stringToDate(String dateString,
    {String dateFormat = DateConstants.commonDateFormat}){
  try{
    return DateFormat(dateFormat).parse(dateString);
  } on Exception catch (e) {
    return DateTime.now();
  }
}

String dateToISOString(DateTime date){
  return DateFormat(DateConstants.isoDateFormat).format(date);
}

// convert date from API response to app date format
String getConvertedDate(String dateString, {String dateFormat = DateConstants.commonDateFormat}){
  try {
    var dateTime = DateFormat(DateConstants.apiDateFormat).parse(dateString);
    var formattedDate = DateFormat(dateFormat).format(dateTime.toLocal());
    return formattedDate;
  } on Exception catch (e) {
    return "";
  }
}

// convert date from API response to app time format
String getConvertedTime(String dateString){
  try {
    var dateTime = DateFormat(DateConstants.apiDateFormat).parse(dateString);
    var formattedDate = DateFormat(DateConstants.commonTimeFormat).format(dateTime.toLocal());
    return formattedDate;
  } on Exception catch(e){
    return "";
  }
}
String convertedDateFormat(String dateString,{
  String fromThis=DateConstants.apiDateFormat,
  String toThis=DateConstants.commonDateFormat}){
  var dateTime = DateFormat(fromThis).parse(dateString);
  var formattedDate = DateFormat(toThis).format(dateTime.toLocal());
  return formattedDate;
}

String parseDate(String dateUtc) {
  var date = DateFormat(DateConstants.apiDateFormat).parse(dateUtc, true);
  var dateLocal = date.toLocal();
  var formattedDate =
  DateFormat("${DateConstants.dateFormat}").format(dateLocal);
  var currentDate = DateFormat(DateConstants.dateFormat).format(DateTime.now());
  if (formattedDate == currentDate) {
    return DateFormat(DateConstants.commonTimeFormat)
        .format(dateLocal)
        .replaceAll(' ', '')
        .toLowerCase();
  }
  return DateFormat(DateConstants.commonDateFormat).format(dateLocal);
}

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}