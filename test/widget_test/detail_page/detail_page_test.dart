import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';
import 'package:spoonacular/src/data/model/ingredients/ingredients_list_model.dart';
import 'package:spoonacular/src/data/model/similar_recipes/similar_recipes_model.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/ingredients_use_case.dart';
import 'package:spoonacular/src/domain/use_case/implementation/nutrition_facts_use_case.dart';
import 'package:spoonacular/src/domain/use_case/implementation/similar_recipes_use_case.dart';
import 'package:spoonacular/src/presentation/controller/ingredients_controller.dart';
import 'package:spoonacular/src/presentation/controller/nutrition_facts_controller.dart';
import 'package:spoonacular/src/presentation/controller/similar_recipes_controller.dart';
import 'package:spoonacular/src/presentation/view/detail_page.dart';
import 'package:spoonacular/src/presentation/widget/detail_app_bar.dart';
import 'package:spoonacular/src/presentation/widget/ingredients_card.dart';
import 'package:spoonacular/src/presentation/widget/nutrition_facts_card.dart';
import 'package:spoonacular/src/presentation/widget/similar_recipes_card.dart';
import '../../utils/mock_data_test.dart';
import 'detail_page_test.mocks.dart';

@GenerateMocks([
  GetStorageLocal,
  NutritionFactsUseCase,
  IngredientsUseCase,
  SimilarRecipesUseCase,
])
void main() {
  late GetStorageLocal getStorageLocal;
  late NutritionFactsController nutritionFactsController;
  late IngredientsController ingredientsController;
  late SimilarRecipesController similarRecipesController;
  late NutritionFactsUseCase nutritionFactsUseCase;
  late IngredientsUseCase ingredientsUseCase;
  late SimilarRecipesUseCase similarRecipesUseCase;
  late DataState<String> nutritionFactsDataStateSuccess;
  late DataState<String> nutritionFactsDataStateFailed;
  late DataState<IngredientsListEntity> ingredientsDataStateSuccess;
  late DataState<IngredientsListEntity> ingredientsDataStateEmpty;
  late DataState<IngredientsListEntity> ingredientsDataStateFailed;
  late DataState<List<SimilarRecipesEntity>> similarRecipesDataStateSuccess;
  late DataState<List<SimilarRecipesEntity>> similarRecipesDataStateEmpty;
  late DataState<List<SimilarRecipesEntity>> similarRecipesDataStateFailed;
  late IngredientsListModel ingredientsListModel;
  late List<SimilarRecipesModel> similarRecipesListModel;

  setUp(() {
    getStorageLocal = MockGetStorageLocal();
    nutritionFactsUseCase = MockNutritionFactsUseCase();
    ingredientsUseCase = MockIngredientsUseCase();
    similarRecipesUseCase = MockSimilarRecipesUseCase();
    nutritionFactsController = NutritionFactsController(
      nutritionFactsUseCase: nutritionFactsUseCase,
    );
    ingredientsController = IngredientsController(
      ingredientsUseCase: ingredientsUseCase,
    );
    similarRecipesController = SimilarRecipesController(
      similarRecipesUseCase: similarRecipesUseCase,
    );
    Get.replace(nutritionFactsController, tag: 'NutritionFactsController');
    Get.replace(ingredientsController, tag: 'IngredientsController');
    Get.replace(similarRecipesController, tag: 'SimilarRecipesController');
    ingredientsListModel = IngredientsListModel.fromJson(
      ingredientsListModelJsonSuccess,
    );
    similarRecipesListModel = [
      SimilarRecipesModel.fromJson(
        similarRecipesModelJsonSuccess,
      )
    ];
    nutritionFactsDataStateSuccess = const DataSuccess(
      nutritionFactsSuccess,
    );
    nutritionFactsDataStateFailed = const DataFailed(
      'error',
    );
    ingredientsDataStateSuccess = DataSuccess(
      ingredientsListModel,
    );
    ingredientsDataStateEmpty = const DataEmpty();
    ingredientsDataStateFailed = const DataFailed(
      'error',
    );
    similarRecipesDataStateSuccess = DataSuccess(
      similarRecipesListModel,
    );
    similarRecipesDataStateEmpty = const DataEmpty();
    similarRecipesDataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Detail page test', () {
    testWidgets('DetailPage() should display the success page',
        (WidgetTester tester) async {
      when(nutritionFactsUseCase(id: 000000))
          .thenAnswer((_) async => nutritionFactsDataStateSuccess);
      when(ingredientsUseCase(id: 000000))
          .thenAnswer((_) async => ingredientsDataStateSuccess);
      when(similarRecipesUseCase(id: 000000))
          .thenAnswer((_) async => similarRecipesDataStateSuccess);
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: DetailPage(
                id: 000000,
                title: 'title',
                aggregateLikes: 1,
                instructions: 'instructions',
                image:
                    'https://spoonacular.com/recipeImages/1043339-556x370.jpg',
                storage: getStorageLocal,
              ),
            ),
          ),
        );
      });
      expect(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(DetailAppBar),
        ),
        findsOneWidget,
      );
      expect(find.byType(NutritionFactsCard), findsOneWidget);
      expect(find.byType(IngredientsCard), findsOneWidget);
      expect(find.byType(SimilarRecipesCard), findsOneWidget);
      expect(find.text('NO RECIPES FOUND'), findsNothing);
      expect(find.byType(LottieBuilder), findsNothing);
    });

    testWidgets('DetailPage() should display the empty page',
        (WidgetTester tester) async {
      when(nutritionFactsUseCase(id: 000000))
          .thenAnswer((_) async => nutritionFactsDataStateSuccess);
      when(ingredientsUseCase(id: 000000))
          .thenAnswer((_) async => ingredientsDataStateEmpty);
      when(similarRecipesUseCase(id: 000000))
          .thenAnswer((_) async => similarRecipesDataStateEmpty);
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: DetailPage(
                  id: 000000,
                  title: 'title',
                  aggregateLikes: 1,
                  instructions: 'instructions',
                  image:
                      'https://spoonacular.com/recipeImages/1043339-556x370.jpg',
                  storage: getStorageLocal,
                ),
              ),
            ),
          ),
        );
      });
      expect(find.text('NO RECIPES FOUND'), findsNWidgets(2));
      expect(find.byType(NutritionFactsCard), findsOneWidget);
      expect(find.byType(IngredientsCard), findsNothing);
      expect(find.byType(SimilarRecipesCard), findsNothing);
      expect(find.byType(LottieBuilder), findsNothing);
    });

    testWidgets('DetailPage() should display the error page',
        (WidgetTester tester) async {
      when(nutritionFactsUseCase(id: 000000))
          .thenAnswer((_) async => nutritionFactsDataStateFailed);
      when(ingredientsUseCase(id: 000000))
          .thenAnswer((_) async => ingredientsDataStateFailed);
      when(similarRecipesUseCase(id: 000000))
          .thenAnswer((_) async => similarRecipesDataStateFailed);
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: DetailPage(
                  id: 000000,
                  title: 'title',
                  aggregateLikes: 1,
                  instructions: 'instructions',
                  image:
                      'https://spoonacular.com/recipeImages/1043339-556x370.jpg',
                  storage: getStorageLocal,
                ),
              ),
            ),
          ),
        );
      });
      expect(find.byType(LottieBuilder), findsNWidgets(3));
      expect(find.byType(NutritionFactsCard), findsNothing);
      expect(find.byType(IngredientsCard), findsNothing);
      expect(find.byType(SimilarRecipesCard), findsNothing);
      expect(find.text('NO RECIPES FOUND'), findsNothing);
    });
  });
}
