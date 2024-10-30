import 'package:flutter/material.dart';

class BackgroundColors {
  static Color lightBackground = Colors.white;
  static Color darkBackground = Colors.black;
  static Color getBackgroundColor(bool isDarkTheme) {
    return isDarkTheme ? darkBackground : lightBackground;
  }
}

class Appbarcolor {
  static Color darkColorAppbar = Colors.black;
  static Color lightColorAppbar = const Color.fromARGB(255, 134, 136, 231);

  static Color getAppbarColor(bool isDarkTheme) {
    return isDarkTheme ? darkColorAppbar : lightColorAppbar;
  }
}

class Textcolor {
  static Color darkColorAppbar = Colors.white;
  static Color lightColorAppbar = const Color.fromARGB(255, 134, 136, 231);

  static Color getTextColor(bool isDarkTheme) {
    return isDarkTheme ? darkColorAppbar : lightColorAppbar;
  }
}
