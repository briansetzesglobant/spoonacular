// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeModel _$$_RecipeModelFromJson(Map<String, dynamic> json) =>
    _$_RecipeModel(
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: json['readyInMinutes'] as int,
      summary: json['summary'] as String,
      vegetarian: json['vegetarian'] as bool,
      vegan: json['vegan'] as bool,
      glutenFree: json['glutenFree'] as bool,
      dairyFree: json['dairyFree'] as bool,
      veryHealthy: json['veryHealthy'] as bool,
      cheap: json['cheap'] as bool,
      veryPopular: json['veryPopular'] as bool,
      sustainable: json['sustainable'] as bool,
      lowFodmap: json['lowFodmap'] as bool,
      id: json['id'] as int,
      aggregateLikes: json['aggregateLikes'] as int,
      instructions: json['instructions'] as String,
    );

Map<String, dynamic> _$$_RecipeModelToJson(_$_RecipeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'readyInMinutes': instance.readyInMinutes,
      'summary': instance.summary,
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'veryHealthy': instance.veryHealthy,
      'cheap': instance.cheap,
      'veryPopular': instance.veryPopular,
      'sustainable': instance.sustainable,
      'lowFodmap': instance.lowFodmap,
      'id': instance.id,
      'aggregateLikes': instance.aggregateLikes,
      'instructions': instance.instructions,
    };
