import 'package:flutter/material.dart';
import 'package:pr2/app_router.dart';
import 'package:pr2/core/db/data_base_helper.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRouter,
      initialRoute: screeen,
    );
  }
}

class Screeen extends StatelessWidget {
  const Screeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Первый экран'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, screeen2);
            },
            child: Text('Кнопка')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('asdasd'))
      ]),
    );
  }
}

class Screeen2 extends StatelessWidget {
  const Screeen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Второй экран экран'),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => Screeen3()));
            },
            child: Text('Кнопка')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Назад'))
      ]),
    );
  }
}

/// Screeen

class Screeen3 extends StatelessWidget {
  const Screeen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Третий экран'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, screeen, (route) => false);
            },
            child: Text('Кнопка')),
        ElevatedButton(onPressed: () {}, child: Text('Перейти на экран 2')),
      ]),
    );
  }
}
