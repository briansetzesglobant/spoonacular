import 'package:flutter/material.dart';
import 'package:spoonacular/src/config/route/app_routes.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.splashScreenRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
