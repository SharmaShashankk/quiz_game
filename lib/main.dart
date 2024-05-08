import 'package:flutter/material.dart';
import 'package:quiz_game/module/home_screen_module/screen/home_screen.dart';
// import 'package:quiz_app/models/questions.dart';
// import 'package:quiz_app/screens/quiz_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
