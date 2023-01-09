import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';
import 'package:spoonacular/src/presentation/view/detail_page.dart';
import 'package:spoonacular/src/presentation/view/favorites_recipes_page.dart';
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
            id: (settings.arguments! as Map<String, dynamic>)[detailPageId]
                as int,
            title: (settings.arguments!
                as Map<String, dynamic>)[detailPageTitle] as String,
            aggregateLikes: (settings.arguments!
                as Map<String, dynamic>)[detailPageAggregateLikes] as int,
            instructions: (settings.arguments!
                as Map<String, dynamic>)[detailPageInstructions] as String,
            image: (settings.arguments!
                as Map<String, dynamic>)[detailPageImage] as String,
            storage: GetStorageLocal.instance,
          ),
        );
      case RoutesConstants.favoritesRoute:
        return MaterialPageRoute(
          builder: (_) => FavoritesRecipesPage(
            storage: GetStorageLocal.instance,
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
