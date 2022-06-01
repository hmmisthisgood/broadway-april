import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger logger = Logger();

  static d(message, {StackTrace? s}) {
    if (kDebugMode) logger.d(message);
  }

  static e(message, {StackTrace? s}) {
    if (kDebugMode) logger.e(message);
  }

  static i(message, {StackTrace? s}) {
    if (kDebugMode) logger.i(message);
  }
}
