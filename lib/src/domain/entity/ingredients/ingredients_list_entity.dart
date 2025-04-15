import 'package:spoonacular/src/domain/entity/ingredients/ingredient_entity.dart';

class IngredientsListEntity {
  IngredientsListEntity({
    required this.ingredients,
  });

  final List<IngredientEntity> ingredients;
}
