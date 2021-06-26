import 'package:flutter/material.dart';
import 'package:flutter_learning/presentation/screens/home_screen.dart';
import 'package:flutter_learning/presentation/screens/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    } else if (settings.name == '/home') {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else {
      return null;
    }
  }
}
