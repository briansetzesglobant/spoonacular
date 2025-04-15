import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/parameter/parameter_object.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/presentation/view/detail_page.dart';
import 'package:spoonacular/src/presentation/view/home_page.dart';
import 'package:spoonacular/src/presentation/view/splash_screen.dart';

class AppRoutes {
  static const String detailPageId = 'id';
  static const String detailPageTitle = 'title';
  static const String detailPageAggregateLikes = 'aggregateLikes';
  static const String detailPageInstructions = 'instructions';
  static const String detailPageImage = 'image';
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
      case RoutesConstants.detailRoute:
        return MaterialPageRoute(
          builder: (_) => DetailPage(
            parameterDetailPage: settings.arguments! as ParameterDetailPage,
          ),
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
