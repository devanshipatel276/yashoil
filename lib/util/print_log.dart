import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

void printLog(dynamic message, [dynamic error]){
  if (kDebugMode) {
    if (error == null) {
      _logger.d(message);
    } else {
      _logger.e(message, error);
    }
  }
}