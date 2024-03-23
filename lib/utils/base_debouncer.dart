import 'package:flutter/foundation.dart';
import 'dart:async';

class BaseDebouncer {
  final int? seconds;
  Timer? timer;

  BaseDebouncer({this.timer, this.seconds});

  run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(seconds: seconds??1), action);
  }
}