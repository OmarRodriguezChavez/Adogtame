import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/firebase/notificaciones.dart';
import 'package:proyectofinal_cont_rdz/provider/flags_provider.dart';
import 'package:proyectofinal_cont_rdz/provider/font_provider.dart';
import 'package:proyectofinal_cont_rdz/provider/theme_provider.dart';
import 'package:proyectofinal_cont_rdz/routes.dart';
import 'package:proyectofinal_cont_rdz/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final theme = sharedPreferences.getString('theme') ?? 'light';
  await Firebase.initializeApp();
  runApp(MyApp(theme :theme));
}

class MyApp extends StatelessWidget {
  final String theme;
  //final String colorApp;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(theme)),
        ChangeNotifierProvider(create: (_) => FlagsProvider()),
        //ChangeNotifierProvider(create: (_) => FontProvider()),
        //ChangeNotifierProvider(create: (_) => ColorProvider(colorApp, context)),
      ],
      child: PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: theme.currentTheme,
      routes: getApplicationRoutes(),
      home: OnboardingPage(),
    );
  }
}
