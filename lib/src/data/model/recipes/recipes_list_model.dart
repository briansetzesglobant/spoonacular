import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoonacular/src/data/model/recipes/recipe_model.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';

part 'recipes_list_model.freezed.dart';

part 'recipes_list_model.g.dart';

@Freezed()
class RecipesListModel extends RecipesListEntity with _$RecipesListModel {
  const factory RecipesListModel({
    required List<RecipeModel> recipes,
  }) = _RecipesListModel;

  factory RecipesListModel.fromJson(Map<String, dynamic> json) =>
      _$RecipesListModelFromJson(json);
}
