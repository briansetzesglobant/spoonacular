// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientsListModel _$$_IngredientsListModelFromJson(
        Map<String, dynamic> json) =>
    _$_IngredientsListModel(
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IngredientsListModelToJson(
        _$_IngredientsListModel instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
    };
