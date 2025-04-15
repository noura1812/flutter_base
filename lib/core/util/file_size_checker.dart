import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';

Future<bool> checkLargeFile(String filepath, {double? maxSizeInKB}) async {
  var file = File(filepath);
  int bytes = await file.length();
  if (bytes <= 0) return false;
  // var i = (log(bytes) / log(1024)).floor();
  bool isLarge = (bytes / pow(1024, 1)) > (maxSizeInKB ?? 1024);
  if (kDebugMode) {
    debugPrint('SIZEEEEE${(bytes / pow(1024, 1))}');
  }
  return isLarge;
}
