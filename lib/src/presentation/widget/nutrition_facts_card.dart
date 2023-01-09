import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NutritionFactsCard extends StatelessWidget {
  const NutritionFactsCard(this.htmlNutritionFactsCard);

  static const String style = 'h1';
  static const double fontSize = 32.0;

  final String htmlNutritionFactsCard;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.teal,
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
    );
  }
}
