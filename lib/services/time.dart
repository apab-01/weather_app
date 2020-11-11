import 'package:intl/intl.dart';

class GetTimeWeather {
  dynamic getTimeIn12HourFormat(dynamic timeInEpoch,dynamic timezoneOffset) {
    var date = DateTime.fromMillisecondsSinceEpoch((timeInEpoch-19800+timezoneOffset) * 1000);
    var time = DateFormat.jm().format(date);
    return time;
  }
  dynamic getTimeIn24HourFormat(dynamic timeInEpoch,dynamic timezoneOffset) {
    var date = DateTime.fromMillisecondsSinceEpoch((timeInEpoch-19800+timezoneOffset) * 1000);
    var time = DateFormat.Hm().format(date);
    return time;
  }
  dynamic getDate(dynamic currentTimeInEpoch,dynamic timezoneOffset) {
    var date = DateTime.fromMillisecondsSinceEpoch((currentTimeInEpoch-19800+timezoneOffset) * 1000);
    var time = DateFormat.MMMEd().format(date);
    return time;
  }
}
