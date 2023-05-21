import 'package:flutter/material.dart';
import 'package:proyectofinal_cont_rdz/screens/dashboard_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/dash': (BuildContext context) => DashboardScreen(),
    '/theme': (BuildContext context) => DashboardScreen(),
    '/add': (BuildContext context) => DashboardScreen(),
    '/save': (BuildContext context) => DashboardScreen(),
    '/cat': (BuildContext context) => DashboardScreen(),
    '/logout': (BuildContext context) => DashboardScreen(),
   
  };
}