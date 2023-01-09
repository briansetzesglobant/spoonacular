import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipe_id_use_case.dart';
import 'package:spoonacular/src/presentation/controller/recipe_id_controller.dart';
import 'package:spoonacular/src/presentation/widget/similar_recipes_card.dart';
import '../../utils/mock_navigator_observer.dart';
import 'similar_recipes_card_test.mocks.dart';

@GenerateMocks([
  RecipeIdUseCase,
])

void main() {
  late RecipeIdController recipeIdController;
  late RecipeIdUseCase recipeIdUseCase;
  late List<SimilarRecipesEntity> similarRecipes;
  late NavigatorObserver mockObserver;

  setUp(() {
    recipeIdUseCase = MockRecipeIdUseCase();
    recipeIdController = RecipeIdController(
      recipeIdUseCase: recipeIdUseCase,
    );
    Get.replace(recipeIdController);
    similarRecipes = [
      SimilarRecipesEntity(
        imageType: 'jpg',
        title: 'title',
        id: 000000,
      )
    ];
    mockObserver = MockNavigatorObserver();
  });

  testWidgets('SimilarRecipesCard() should display the similar recipes card',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SimilarRecipesCard(
              similarRecipes: similarRecipes,
            ),
          ),
        ),
      ),
    );
    expect(find.text('SIMILAR RECIPES'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    //tester.tap(find.byType(InkWell));
    //await tester.pump();
    //verify(
    //       mockObserver.navigator
    //           ?.pushReplacementNamed(RoutesConstants.detailRoute),
    //     ).called(1);
  });
}
