import 'package:flutter/material.dart';
import 'package:kendin_ye/presentation/screens/burger_login_screen.dart';
import 'package:kendin_ye/presentation/screens/ingredient_selector.dart';
import 'package:kendin_ye/login_screen_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BurgerLoginScreen(),
    );
  }
}
