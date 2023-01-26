import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';

class RecipesListEntity {
  RecipesListEntity({
    required this.recipes,
  });

  final List<RecipeEntity> recipes;
}
