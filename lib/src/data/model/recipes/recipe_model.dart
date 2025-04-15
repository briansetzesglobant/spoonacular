import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';

part 'recipe_model.freezed.dart';

part 'recipe_model.g.dart';

@Freezed()
class RecipeModel extends RecipeEntity with _$RecipeModel {
  const factory RecipeModel({
    required String title,
    required String image,
    required int readyInMinutes,
    required String summary,
    required bool vegetarian,
    required bool vegan,
    required bool glutenFree,
    required bool dairyFree,
    required bool veryHealthy,
    required bool cheap,
    required bool veryPopular,
    required bool sustainable,
    required bool lowFodmap,
    required int id,
    required int aggregateLikes,
    required String instructions,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
