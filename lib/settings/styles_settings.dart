import 'package:flutter/material.dart';

class StylesSettings {

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }

  static ThemeData lightTheme() {
    return ThemeData.light();
  }

  static ThemeData obscureTheme() {
    return ThemeData.from(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 203, 99, 252),
          onPrimary: Color.fromARGB(255, 0, 0, 0),
          secondary: Color.fromARGB(255, 125, 45, 255),
          onSecondary: Color.fromARGB(255, 0, 0, 0),
          error: Color.fromARGB(255, 255, 45, 83),
          onError: Color.fromARGB(255, 0, 0, 0),
          background: Color.fromARGB(255, 199, 157, 193),
          onBackground: Color.fromARGB(255, 0, 0, 0),
          surface: Color.fromARGB(255, 125, 45, 255),
          onSurface: Color.fromARGB(255, 0, 0, 0),
        ),
        textTheme: TextTheme(bodyText1: TextStyle(color: Color.fromARGB(255, 255, 255, 255))));
  }
  /*static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 81, 82, 81)));
  }

  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 81, 82, 81)));
  }

  static ThemeData obscureTheme() {
    return ThemeData.from(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 203, 99, 252),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 125, 45, 255),
          onSecondary: Colors.white,
          error: Color.fromARGB(255, 255, 45, 83),
          onError: Colors.white,
          background: Color.fromARGB(255, 199, 157, 193),
          onBackground: Colors.white,
          surface: Color.fromARGB(255, 125, 45, 255),
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
  }*/

}