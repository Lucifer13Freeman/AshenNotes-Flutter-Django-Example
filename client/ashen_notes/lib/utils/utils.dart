import 'dart:io';
import 'package:flutter/material.dart';


class Utils
{
  static String dateFormat(DateTime date)
  {
    date = date.toLocal();

    int day = date.day;
    int month = date.month;
    int year = date.year;
    int hour = date.hour;
    int minute = date.minute;

    return '$day.$month.$year $hour:$minute';
  }

  static bool isMobile()
  {
    try { return Platform.isAndroid || Platform.isIOS; } 
    catch(e) { return false; }
  }

  static MaterialColor createMaterialColor(Color color) 
  {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) 
    {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}