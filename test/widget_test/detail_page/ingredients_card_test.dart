import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredient_entity.dart';
import 'package:spoonacular/src/presentation/widget/ingredients_card.dart';

void main() {
  late List<IngredientEntity> ingredients;

  setUp(() {
    ingredients = [
      IngredientEntity(
        image: 'blueberries.jpg',
        name: 'name',
      )
    ];
  });

  testWidgets('IngredientsCard() should display the ingredients card',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IngredientsCard(
              ingredients: ingredients,
              instructions: 'instructions',
            ),
          ),
        ),
      ),
    );
    expect(find.text('INGREDIENTS'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('NAME'), findsOneWidget);
    expect(find.text('INSTRUCTIONS'), findsOneWidget);
    expect(find.text('instructions'), findsOneWidget);
  });
}
