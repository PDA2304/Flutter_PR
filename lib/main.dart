import 'package:flutter/material.dart';
import 'package:pr2/app_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRouter,
      initialRoute: namePageTest,
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('1'),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, namePageTest1, (route) => false);
          },
          child: Text('Переход на экран 2'),
        )
      ]),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _TestState1();
}

class _TestState1 extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('2'),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Переход на экран 1'),
        )
      ]),
    );
  }
}
