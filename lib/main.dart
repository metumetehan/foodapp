import 'package:flutter/material.dart';
import 'package:kendin_ye/burger_login_screen.dart';
import 'package:kendin_ye/sign_up_screen.dart';

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
