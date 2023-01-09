import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spoonacular/src/presentation/widget/nutrition_facts_card.dart';
import '../../utils/mock_data_test.dart';

void main() {
  testWidgets('NutritionFactsCard() should display the nutrition facts card',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NutritionFactsCard(
            nutritionFactsSuccess,
          ),
        ),
      ),
    );
    expect(
      find.descendant(
        of: find.byType(ColoredBox),
        matching: find.byType(Html),
      ),
      findsOneWidget,
    );
  });
}
