import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';

abstract class TextStyles {
  static const homePageTextTextStyle = TextStyle(
    fontSize: NumbersConstants.homePageTextSize,
    color: Colors.teal,
    decoration: TextDecoration.underline,
  );
}
