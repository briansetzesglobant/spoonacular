import 'package:spoonacular/src/domain/entity/recipe_entity.dart';

class RecipesListEntity {
  RecipesListEntity({
    required this.recipes,
  });

  final List<RecipeEntity> recipes;
}
