import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/model/ingredients/ingredients_list_model.dart';
import 'package:spoonacular/src/data/model/recipes/recipe_model.dart';
import 'package:spoonacular/src/data/model/recipes/recipes_list_model.dart';
import 'package:spoonacular/src/data/model/similar_recipes/similar_recipes_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';
import '../utils/mock_data_test.dart';
import 'recipes_repository_test.mocks.dart';

@GenerateMocks([
  RecipesApiService,
])
void main() {
  late RepositoryInterface recipesRepository;
  late RecipesApiService recipesApiService;
  late DataState<RecipesListEntity> recipesDataStateSuccess;
  late DataState<RecipesListEntity> recipesDataStateEmpty;
  late DataState<RecipesListEntity> recipesDataStateFailed;
  late DataState<String> nutritionFactsDataStateSuccess;
  late DataState<String> nutritionFactsDataStateFailed;
  late DataState<IngredientsListEntity> ingredientsDataStateSuccess;
  late DataState<IngredientsListEntity> ingredientsDataStateEmpty;
  late DataState<IngredientsListEntity> ingredientsDataStateFailed;
  late DataState<List<SimilarRecipesEntity>> similarRecipesDataStateSuccess;
  late DataState<List<SimilarRecipesEntity>> similarRecipesDataStateEmpty;
  late DataState<List<SimilarRecipesEntity>> similarRecipesDataStateFailed;
  late DataState<RecipeEntity> recipeIdDataStateSuccess;
  late DataState<RecipeEntity> recipeIdDataStateFailed;
  late RecipesListModel recipesListModel;
  late IngredientsListModel ingredientsListModel;
  late List<SimilarRecipesModel> similarRecipesListModel;
  late RecipeModel recipeModel;

  setUp(() {
    recipesApiService = MockRecipesApiService();
    Get.replace(recipesApiService);
    recipesRepository = RecipesRepository();
    recipesListModel = RecipesListModel.fromJson(
      recipesListModelJsonSuccess,
    );
    ingredientsListModel = IngredientsListModel.fromJson(
      ingredientsListModelJsonSuccess,
    );
    similarRecipesListModel = [
      SimilarRecipesModel.fromJson(
        similarRecipesModelJsonSuccess,
      )
    ];
    recipeModel = RecipeModel.fromJson(
      recipeModelJsonSuccess,
    );
    recipesDataStateSuccess = DataSuccess(
      recipesListModel,
    );
    recipesDataStateEmpty = const DataEmpty();
    recipesDataStateFailed = const DataFailed(
      'error',
    );
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
    recipeIdDataStateSuccess = DataSuccess(
      recipeModel,
    );
    recipeIdDataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Recipes repository test', () {
    test(
      'getRecipesRandom() should get the status success',
      () async {
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => recipesDataStateSuccess);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
        expect(
          response.data,
          recipesDataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getRecipesRandom() should get the status empty',
      () async {
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => recipesDataStateEmpty);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'getRecipesRandom() should get the status failed',
      () async {
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => recipesDataStateFailed);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          recipesDataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });

  group('Nutrition Facts repository test', () {
    test(
      'getNutritionFacts() should get the status success',
      () async {
        when(recipesApiService.getNutritionFacts(id: 000000))
            .thenAnswer((_) async => nutritionFactsDataStateSuccess);
        final response = await recipesRepository.getNutritionFacts(id: 000000);
        verify(recipesApiService.getNutritionFacts(id: 000000)).called(1);
        expect(
          response.data,
          nutritionFactsDataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getNutritionFacts() should get the status failed',
      () async {
        when(recipesApiService.getNutritionFacts(id: 000000))
            .thenAnswer((_) async => nutritionFactsDataStateFailed);
        final response = await recipesRepository.getNutritionFacts(id: 000000);
        verify(recipesApiService.getNutritionFacts(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          nutritionFactsDataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });

  group('Ingredients repository test', () {
    test(
      'getIngredients() should get the status success',
      () async {
        when(recipesApiService.getIngredients(id: 000000))
            .thenAnswer((_) async => ingredientsDataStateSuccess);
        final response = await recipesRepository.getIngredients(id: 000000);
        verify(recipesApiService.getIngredients(id: 000000)).called(1);
        expect(
          response.data,
          ingredientsDataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getIngredients() should get the status empty',
      () async {
        when(recipesApiService.getIngredients(id: 000000))
            .thenAnswer((_) async => ingredientsDataStateEmpty);
        final response = await recipesRepository.getIngredients(id: 000000);
        verify(recipesApiService.getIngredients(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'getIngredients() should get the status failed',
      () async {
        when(recipesApiService.getIngredients(id: 000000))
            .thenAnswer((_) async => ingredientsDataStateFailed);
        final response = await recipesRepository.getIngredients(id: 000000);
        verify(recipesApiService.getIngredients(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          ingredientsDataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });

  group('Similar Recipes repository test', () {
    test(
      'getSimilarRecipes() should get the status success',
      () async {
        when(recipesApiService.getSimilarRecipes(id: 000000))
            .thenAnswer((_) async => similarRecipesDataStateSuccess);
        final response = await recipesRepository.getSimilarRecipes(id: 000000);
        verify(recipesApiService.getSimilarRecipes(id: 000000)).called(1);
        expect(
          response.data,
          similarRecipesDataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getSimilarRecipes() should get the status empty',
      () async {
        when(recipesApiService.getSimilarRecipes(id: 000000))
            .thenAnswer((_) async => similarRecipesDataStateEmpty);
        final response = await recipesRepository.getSimilarRecipes(id: 000000);
        verify(recipesApiService.getSimilarRecipes(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'getSimilarRecipes() should get the status failed',
      () async {
        when(recipesApiService.getSimilarRecipes(id: 000000))
            .thenAnswer((_) async => similarRecipesDataStateFailed);
        final response = await recipesRepository.getSimilarRecipes(id: 000000);
        verify(recipesApiService.getSimilarRecipes(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          similarRecipesDataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });

  group('Recipe Id repository test', () {
    test(
      'getRecipeId() should get the status success',
      () async {
        when(recipesApiService.getRecipeId(id: 000000))
            .thenAnswer((_) async => recipeIdDataStateSuccess);
        final response = await recipesRepository.getRecipeId(id: 000000);
        verify(recipesApiService.getRecipeId(id: 000000)).called(1);
        expect(
          response.data,
          recipeIdDataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getRecipeId() should get the status failed',
      () async {
        when(recipesApiService.getRecipeId(id: 000000))
            .thenAnswer((_) async => recipeIdDataStateFailed);
        final response = await recipesRepository.getRecipeId(id: 000000);
        verify(recipesApiService.getRecipeId(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          recipeIdDataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });
}
