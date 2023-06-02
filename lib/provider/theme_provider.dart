import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal_cont_rdz/settings/styles_settings.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  String getTheme() {
    String theme = "light";
    if (_currentTheme == ThemeData.dark()) {
      theme = 'dark';
    }
    if (_currentTheme == ThemeData.light()) {
      theme = 'light';
    }
    if (_currentTheme == StylesSettings.obscureTheme()) {
      theme = 'obscure';
    }
    return theme;
  }

  ThemeProvider(String theme) {
    switch (theme) {
      case 'dark':
        _currentTheme = ThemeData.dark();
        break;
      case 'light':
        _currentTheme = ThemeData.light();
        break;
      case 'obscure':
        _currentTheme = StylesSettings.obscureTheme();
        break;
      default:
        _currentTheme = StylesSettings.obscureTheme();
        break;
    }
  }

  void toggleTheme(theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (theme) {
      case 'dark':
        _currentTheme = ThemeData.dark();
        sharedPreferences.setString('theme', 'dark');
        break;
      case 'light':
        _currentTheme = ThemeData.light();
        sharedPreferences.setString('theme', 'light');
        break;
      case 'obscure':
        _currentTheme = StylesSettings.obscureTheme();
        sharedPreferences.setString('theme', 'obscure');
        break;
      default:
        _currentTheme = StylesSettings.darkTheme();
        sharedPreferences.setString('theme', 'dark');
        break;
    }
    notifyListeners();
  }



  /*ThemeData? _themeData;

  ThemeProvider(int tema, BuildContext context) {
    setthemeData(tema, context);
    //_themeData = StylesSettings.lightTheme(context);
  }
  getthemeData() => this._themeData;
  setthemeData(int? caso, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (caso) {
      case 1:
        _themeData = StylesSettings.darkTheme(context);
        sharedPreferences.setInt('tema', 1);
        await sharedPreferences.setBool('is_dark', true);
        break;
      case 2:
        _themeData = StylesSettings.lightTheme(context);
        sharedPreferences.setInt('tema', 2);
        await sharedPreferences.setBool('is_light', true);
        break;
      default:
        _themeData = StylesSettings.lightTheme(context);
        sharedPreferences.setInt('tema', 2);
        await sharedPreferences.setBool('is_light', false);
        break;
    }
    notifyListeners();
  }*/
}
