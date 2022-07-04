import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger log = Logger();

  static i(dynamic data) {
    if (kDebugMode) log.i(data);
  }

  static e(dynamic data) {
    if (kDebugMode) log.e(data);
  }

  static d(dynamic data) {
    if (kDebugMode) log.d(data);
  }
}
