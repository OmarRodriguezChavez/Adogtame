import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/provider/color_provider.dart';
import 'package:proyectofinal_cont_rdz/provider/theme_provider.dart';
//import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeChoose extends StatefulWidget {
  const ThemeChoose({super.key});

  @override
  State<ThemeChoose> createState() => _ThemeChooseState();
}

class _ThemeChooseState extends State<ThemeChoose> {

  void _toggleTheme(theme) {
    final settings = Provider.of<ThemeProvider>(context, listen: false);
    settings.toggleTheme(theme);
  }
  final texto = const Text(
    "Elige un tema",
    style: TextStyle(
      backgroundColor: Color.fromARGB(123, 223, 187, 80),
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );

  final spaceHorizont = const SizedBox(height: 20);
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    //ColorProvider colorApp = Provider.of<ColorProvider>(context);
    final btndark = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 78, 77, 77),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        _toggleTheme('dark');
      },
      child: const Text("Dark Theme"),
    );
    final btnlight = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 244, 243, 224),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        _toggleTheme('light');
      },
      child: const Text("Light Theme"),
    );
    final btnrose = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 225, 168, 231),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        _toggleTheme('obscure');
      },
      child: const Text("Rose Theme"),
    );
    

    return Scaffold(
      appBar: AppBar(
          title: const Text('Choose Theme'),),
      body:  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              texto,
              spaceHorizont,
              btndark,
                      SizedBox(height: 15,),
                      btnlight,
                      SizedBox(height: 15,),
                      btnrose,
              spaceHorizont,
      
            ],
          ),
      ),
      
    );
  }
}
