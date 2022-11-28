import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/presentation/view/home_page.dart';
import 'package:spoonacular/src/presentation/view/splash_screen.dart';

class AppRoutes {
  static const String appRouteDefault = 'Undefined route';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RoutesConstants.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                appRouteDefault,
              ),
            ),
          ),
        );
    }
  }
}
