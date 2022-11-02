import 'package:flutter/material.dart';
import 'package:pr2/main.dart';

const String namePageTest = 'test';
const String namePageTest1 = 'test1';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case namePageTest:
        {
          return MaterialPageRoute(builder: (_) => Test());
        }

      case namePageTest1:
        {
          return MaterialPageRoute(builder: (_) => Test1());
        }
    }
  }
}
