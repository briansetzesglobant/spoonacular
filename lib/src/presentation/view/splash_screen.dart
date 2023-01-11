import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const double gifHeight = 0.7;
  static const double gifWidth = 0.5;
  static const int duration = 3000;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(
        milliseconds: duration,
      ),
      () {
        Navigator.of(context).pushReplacementNamed(
          RoutesConstants.homeRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * gifHeight,
                  width: MediaQuery.of(context).size.width * gifWidth,
                  child: Lottie.asset(
                    AssetsConstants.lottiePrepareFood,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
