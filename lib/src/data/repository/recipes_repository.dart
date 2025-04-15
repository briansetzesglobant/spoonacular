import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class RecipesRepository extends RepositoryInterface {
  RecipesApiService recipesApiService = Get.find<RecipesApiService>();

  @override
  Future<DataState<RecipesListEntity>> getRecipesRandom() {
    return recipesApiService.getRecipesRandom();
  }

  @override
  Future<DataState<String>> getNutritionFacts({
    required int id,
  }) {
    return recipesApiService.getNutritionFacts(id: id);
  }

  @override
  Future<DataState<IngredientsListEntity>> getIngredients({
    required int id,
  }) {
    return recipesApiService.getIngredients(id: id);
  }

  @override
  Future<DataState<List<SimilarRecipesEntity>>> getSimilarRecipes({
    required int id,
  }) {
    return recipesApiService.getSimilarRecipes(id: id);
  }

  @override
  Future<DataState<RecipeEntity>> getRecipeId({
    required int id,
  }) {
    return recipesApiService.getRecipeId(id: id);
  }
}
