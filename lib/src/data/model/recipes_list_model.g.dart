// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipesListModel _$$_RecipesListModelFromJson(Map<String, dynamic> json) =>
    _$_RecipesListModel(
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipesListModelToJson(_$_RecipesListModel instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };
