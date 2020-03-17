import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class LogUtil {
  static bool _enableLog = false; //是否可以打印日志

  static set enableLog(bool value) {
    _enableLog = value;
  }

  static void log({@required dynamic TAG, String message = ""}) {
    if (_enableLog && kDebugMode) {
      debugPrint("flutter_custom_calendar------$TAG------>$message");
    }
  }
}