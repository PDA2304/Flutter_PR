import 'package:flutter/material.dart';
import 'package:pr1/screen_three.dart';
import 'package:pr1/screen_one.dart';
import 'package:pr1/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenThree(),
    );
  }
}
