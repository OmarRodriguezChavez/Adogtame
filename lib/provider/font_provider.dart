import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontProvider with ChangeNotifier {
  TextStyle? _FontBar;
  FontProvider(String appFont, BuildContext context) {
    setFontBar(appFont, context);
    //_themeData = StylesSettings.lightTheme(context);
  }
  getFontBar() => this._FontBar;
  setFontBar(String? appFont, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (appFont) {
      case 'abel':
        //GoogleFonts.abel();
        sharedPreferences.setString('Font', 'abel');
        break;
      case 'aboreto':
       GoogleFonts.aboreto();
        sharedPreferences.setString('Font', 'aboreto');
        break;
      case 'alatsi':
        GoogleFonts.alatsi();
        sharedPreferences.setString('Font', 'alatsi');
        break;
      case 'bayon':
        GoogleFonts.bayon();
        sharedPreferences.setString('Font', 'bayon');
        break;
      case 'blaka':
        GoogleFonts.blaka();
        sharedPreferences.setString('Font', 'blaka');
        break;
      case 'underdog':
        GoogleFonts.underdog();
        sharedPreferences.setString('Font', 'underdog');
        break;
      default:
        _FontBar = GoogleFonts.candal();
        sharedPreferences.setString('Font', 'candal');
        break;
    }
    notifyListeners();
  }

  /*FontProvider(String appcolor) {
    switch (appcolor) {
      case 'gree':
        _currentColor = Colors.green;
        break;
      case 'red':
        _currentColor = Colors.red;
        break;
      case 'pink':
        _currentColor = Colors.pink;
        break;
      case 'yellow':
        _currentColor = Colors.yellow;
        break;
      case 'blue':
        _currentColor = Colors.blue;
        break;
      case 'purple':
        _currentColor = Colors.purple;
        break;
      default:
        _currentColor = Color.fromARGB(124, 68, 137, 255);
        break;
    }
  }*/

  /*toggleColor(appColor) async {
    Color? _currentColor; //= Color.fromARGB(124, 68, 137, 255);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    /*if (_currentTheme == StylesApp.darkTheme()) {
      _currentTheme = ThemeData.dark();
      sharedPreferences.setString('theme', 'dark');
    } else {
      if (_currentTheme == StylesApp.lightTheme()) {
        _currentTheme = StylesApp.lightTheme();
        sharedPreferences.setString('theme', 'obscure');
      }
    }*/
    switch (appColor) {
      case 'green':
        _currentColor = Colors.green;
        sharedPreferences.setString('Color', 'green');
        break;
      case 'red':
        _currentColor = Colors.red;
        sharedPreferences.setString('Color', 'red');
        break;
      case 'pink':
        _currentColor = Colors.pink;
        sharedPreferences.setString('Color', 'pink');
        break;
      case 'yellow':
        _currentColor = Colors.yellow;
        sharedPreferences.setString('Color', 'yellow');
        break;
      case 'blue':
        _currentColor = Colors.blue;
        sharedPreferences.setString('Color', 'blue');
        break;
      case 'purple':
        _currentColor = Colors.purple;
        sharedPreferences.setString('Color', 'purple');
        break;
      default:
        _currentColor = Color.fromARGB(124, 68, 137, 255);
        sharedPreferences.setString('Color', 'blueAccent');
        break;
    }
    return _currentColor;
    notifyListeners();
  }*/
}
