import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredient_entity.dart';

part 'ingredient_model.freezed.dart';

part 'ingredient_model.g.dart';

@Freezed()
class IngredientModel extends IngredientEntity with _$IngredientModel {
  const factory IngredientModel({
    required String image,
    required String name,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
}
