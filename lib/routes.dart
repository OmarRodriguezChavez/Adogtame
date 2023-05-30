import 'package:flutter/material.dart';
import 'package:proyectofinal_cont_rdz/screens/add_post_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/dashboard_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/edit_profile_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/list_razas_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/signin_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/theme_page.dart';
import 'package:proyectofinal_cont_rdz/screens/verify_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/dash': (BuildContext context) => DashboardScreen(),
    '/theme': (BuildContext context) => const ThemeChoose(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/save': (BuildContext context) => DashboardScreen(),
    '/cat': (BuildContext context) => const ListBreeds(),
    '/logout': (BuildContext context) => DashboardScreen(),
    '/verify':(BuildContext context) =>const VerifyEmail(),
    '/login':(BuildContext context) => const SignInScreen(),
    '/edit':(BuildContext context) => const EditProfile()
   
  };
}