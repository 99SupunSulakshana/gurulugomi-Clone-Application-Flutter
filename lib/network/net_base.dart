import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return 'prod url here';
    } else {
      return 'http://dev.gurulugomi.lk/api/v1.0/home';
    }
  }
}
