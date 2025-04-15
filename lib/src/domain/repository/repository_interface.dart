import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';

abstract class RepositoryInterface {
  Future<DataState<RecipesListEntity>> getRecipesRandom();

  Future<DataState<String>> getNutritionFacts({
    required int id,
  });

  Future<DataState<IngredientsListEntity>> getIngredients({
    required int id,
  });

  Future<DataState<List<SimilarRecipesEntity>>> getSimilarRecipes({
    required int id,
  });

  Future<DataState<RecipeEntity>> getRecipeId({
    required int id,
  });
}
