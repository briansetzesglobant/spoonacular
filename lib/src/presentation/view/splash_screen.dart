import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(
        milliseconds: NumbersConstants.splashScreenDuration,
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
                  height: MediaQuery.of(context).size.height *
                      NumbersConstants.splashScreenGifHeight,
                  width: MediaQuery.of(context).size.width *
                      NumbersConstants.splashScreenGifWidth,
                  child: Lottie.asset(StringsConstants.splashScreenGif),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
