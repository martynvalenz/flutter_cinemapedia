
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    // colorSchemeSeed: const Color(0xff2E7DEF),
    colorSchemeSeed: Colors.white,
    brightness: Brightness.dark
  );
}