import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/screens/auth_screen.dart';
import 'package:flutter_tutorial_1_ecommerce_app/home.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(),
        settings: routeSettings,
      );

    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
        settings: routeSettings,
      );

    default:
      return MaterialPageRoute(
        builder: (context) {
          throw const Scaffold(
            body: Center(
              child: Text(
                  "It seems that the page you are looking for was strangely not found"),
            ),
          );
        },
      );
  }
}
