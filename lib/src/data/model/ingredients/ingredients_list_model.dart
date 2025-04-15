import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoonacular/src/data/model/ingredients/ingredient_model.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';

part 'ingredients_list_model.freezed.dart';

part 'ingredients_list_model.g.dart';

@Freezed()
class IngredientsListModel extends IngredientsListEntity with _$IngredientsListModel {
  const factory IngredientsListModel({
    required List<IngredientModel> ingredients,
  }) = _IngredientsListModel;

  factory IngredientsListModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientsListModelFromJson(json);
}
