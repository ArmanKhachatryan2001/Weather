import 'package:flutter/material.dart';

class GetColor {
  static Color? getColor(String str) {
    Map<String, Color?> colors = {
      'Sunny': Color(0xFF42C2FF),
      'Clear': Color(0xFF712B75),
      'Cloudy': Color(0xFFA8AAC4),
      'Snowy': Color(0xFF6BA7CC),
    };

    if (colors.containsKey(str)) {
      return colors[str];
    } else {
      return Color(0xFF42C2FF);
    }
  }
}
