import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/core/util/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringsConstants.homePageTitle,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          StringsConstants.homePageText,
          style: TextStyles.homePageTextTextStyle,
        ),
      ),
    );
  }
}
