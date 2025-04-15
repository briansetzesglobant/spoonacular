import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/presentation/widget/recipe_card.dart';

void main() {
  late RecipeEntity recipe;

  setUp(() {
    recipe = RecipeEntity(
      title: 'title',
      image: 'https://spoonacular.com/recipeImages/1043339-556x370.jpg',
      readyInMinutes: 45,
      summary: 'summary',
      vegetarian: false,
      vegan: false,
      glutenFree: false,
      dairyFree: false,
      veryHealthy: false,
      cheap: false,
      veryPopular: false,
      sustainable: false,
      lowFodmap: false,
      id: 000000,
      aggregateLikes: 1460,
      instructions: 'instructions',
    );
  });
  testWidgets('RecipeCard() should display the recipe card',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecipeCard(
            recipe: recipe,
          ),
        ),
      ),
    );
    expect(find.text('"title"'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('45 min'), findsOneWidget);
    expect(find.text('summary'), findsOneWidget);
    expect(find.text('VEGETARIAN'), findsOneWidget);
    expect(find.text('VEGAN'), findsOneWidget);
    expect(find.text('GLUTEN FREE'), findsOneWidget);
    expect(find.text('DAIRY FREE'), findsOneWidget);
    expect(find.text('VERY HEALTHY'), findsOneWidget);
    expect(find.text('CHEAP'), findsOneWidget);
    expect(find.text('VERY POPULAR'), findsOneWidget);
    expect(find.text('SUSTAINABLE'), findsOneWidget);
    expect(find.text('LOW FODMAP'), findsOneWidget);
  });
}
