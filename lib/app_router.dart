import 'package:flutter/material.dart';
import 'package:pr2/main.dart';

const String screen1NamePage = 'screen1';
const String screen2NamePage = 'screen2';
const String screen3NamePage = 'screen3';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case screen1NamePage:
        {
          return MaterialPageRoute(builder: (_) => Screen1());
        }
      case screen2NamePage:
        {
          return MaterialPageRoute(builder: (_) => Screen2());
        }
      case screen3NamePage:
        {
          return MaterialPageRoute(builder: (_) => Screen3());
        }
    }
  }
}
