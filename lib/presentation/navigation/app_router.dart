import 'package:flutter/material.dart';
import '../screens/ingredient_selector.dart';
import '../screens/burger_login_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const BurgerLoginScreen());
      case '/ingredients':
        return MaterialPageRoute(builder: (_) => const IngredientSelector());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('404'))),
        );
    }
  }
}
