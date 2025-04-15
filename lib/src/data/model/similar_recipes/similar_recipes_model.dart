import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';

part 'similar_recipes_model.freezed.dart';

part 'similar_recipes_model.g.dart';

@Freezed()
class SimilarRecipesModel extends SimilarRecipesEntity
    with _$SimilarRecipesModel {
  const factory SimilarRecipesModel({
    required String imageType,
    required String title,
    required int id,
  }) = _SimilarRecipesModel;

  factory SimilarRecipesModel.fromJson(Map<String, dynamic> json) =>
      _$SimilarRecipesModelFromJson(json);
}
