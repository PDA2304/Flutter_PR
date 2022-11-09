import 'package:flutter/material.dart';
import 'package:pr2/main.dart';

const String screeen = 'screen';
const String screeen2 = 'screen2';
const String screeen3 = 'screen3';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case screeen:
        {
          return MaterialPageRoute(builder: (_) => Screeen());
        }
      case screeen2:
        {
          return MaterialPageRoute(builder: (_) => Screeen2());
        }
      case screeen3:
        {
          return MaterialPageRoute(builder: (_) => Screeen3());
        }
    }
  }
}
