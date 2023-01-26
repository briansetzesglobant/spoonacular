import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';

class NutritionFactsCard extends StatelessWidget {
  const NutritionFactsCard({
    required this.htmlNutritionFactsCard,
    required this.instructions,
  });

  static const String textInstructions = 'INSTRUCTIONS';
  static const String style = 'h1';
  static const double textFontSize = 17.0;
  static const double fontSize = 32.0;
  static const int containerColorFirst = 700;
  static const double containerHeightFirst = 520.0;
  static const double containerWidthFirst = 445.0;
  static const int containerColorSecond = 800;
  static const double containerHeightSecond = 490.0;
  static const double containerWidthSecond = 370.0;
  static const int containerColorThird = 900;
  static const double containerHeightThird = 460.0;
  static const double containerWidthThird = 295.0;
  static const double sizeBoxHeight = 450.0;
  static const double sizeBoxWidth = 240.0;

  final String htmlNutritionFactsCard;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        border: Border.all(
          width: NumbersConstants.borderWith,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: NumbersConstants.paddingXXXSmall,
              ),
              child: Text(
                textInstructions,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w900,
                  fontFamily: StringsConstants.textFontFamily,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingXXXSmall,
                right: NumbersConstants.paddingXXXSmall,
                bottom: NumbersConstants.paddingXXXSmall,
              ),
              child: Html(
                data: instructions,
                style: {
                  '*': Style(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: NumbersConstants.paddingXMedium,
              ),
              child: Container(
                color: Colors.teal[containerColorFirst],
                height: containerHeightFirst,
                width: containerWidthFirst,
                child: Center(
                  child: Container(
                    color: Colors.teal[containerColorSecond],
                    height: containerHeightSecond,
                    width: containerWidthSecond,
                    child: Center(
                      child: Container(
                        color: Colors.teal[containerColorThird],
                        height: containerHeightThird,
                        width: containerWidthThird,
                        child: Center(
                          child: SizedBox(
                            height: sizeBoxHeight,
                            width: sizeBoxWidth,
                            child: Center(
                              child: Html(
                                data: htmlNutritionFactsCard,
                                style: {
                                  style: Style(
                                    fontSize: const FontSize(
                                      fontSize,
                                    ),
                                    fontWeight: FontWeight.w900,
                                  ),
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
