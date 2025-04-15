import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/util/api_service_constants.dart';
import 'package:spoonacular/src/data/model/ingredients/ingredients_list_model.dart';
import 'package:spoonacular/src/data/model/recipes/recipe_model.dart';
import 'package:spoonacular/src/data/model/recipes/recipes_list_model.dart';
import 'package:spoonacular/src/data/model/similar_recipes/similar_recipes_model.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';

class RecipesApiService {
  RecipesApiService();

  static Map<String, dynamic> headers = {
    ApiServiceConstants.headerKey: dotenv.env[ApiServiceConstants.apiKey],
  };

  dio.Dio dioApiService = Get.find<dio.Dio>();

  Future<DataState<RecipesListEntity>> getRecipesRandom() async {
    try {
      final response = await dioApiService.get(
        ApiServiceConstants.endpointRecipesRandom,
        queryParameters: {
          ApiServiceConstants.apiKeyParameter:
              headers[ApiServiceConstants.headerKey],
          ApiServiceConstants.numberParameterRecipesRandom:
              ApiServiceConstants.numberParameterValueRecipesRandom,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final resp =
            RecipesListModel.fromJson(response.data as Map<String, dynamic>);
        if (resp.recipes.isNotEmpty) {
          return DataSuccess(resp);
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${ApiServiceConstants.textDataFailed} ${response.statusCode}',
        );
      }
    } on dio.DioError catch (e) {
      throw dio.DioError(
        requestOptions: e.requestOptions,
      );
    }
  }

  Future<DataState<String>> getNutritionFacts({
    required int id,
  }) async {
    try {
      final response = await dioApiService.get(
        '$id${ApiServiceConstants.endpointNutritionFacts}',
        queryParameters: {
          ApiServiceConstants.apiKeyParameter:
              headers[ApiServiceConstants.headerKey],
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          response.data as String,
        );
      } else {
        return DataFailed(
          '${ApiServiceConstants.textDataFailed} ${response.statusCode}',
        );
      }
    } on dio.DioError catch (e) {
      throw dio.DioError(
        requestOptions: e.requestOptions,
      );
    }
  }

  Future<DataState<IngredientsListEntity>> getIngredients({
    required int id,
  }) async {
    try {
      final response = await dioApiService.get(
        '$id${ApiServiceConstants.endpointIngredients}',
        queryParameters: {
          ApiServiceConstants.apiKeyParameter:
              headers[ApiServiceConstants.headerKey],
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final resp = IngredientsListModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        if (resp.ingredients.isNotEmpty) {
          return DataSuccess(
            resp,
          );
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${ApiServiceConstants.textDataFailed} ${response.statusCode}',
        );
      }
    } on dio.DioError catch (e) {
      throw dio.DioError(
        requestOptions: e.requestOptions,
      );
    }
  }

  Future<DataState<List<SimilarRecipesEntity>>> getSimilarRecipes({
    required int id,
  }) async {
    try {
      final response = await dioApiService.get(
        '$id${ApiServiceConstants.endpointSimilarRecipes}',
        queryParameters: {
          ApiServiceConstants.apiKeyParameter:
              headers[ApiServiceConstants.headerKey],
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final list = response.data as List;
        final List<SimilarRecipesModel> similarRecipesModelList = list
            .map(
              (similarRecipes) => SimilarRecipesModel.fromJson(
                similarRecipes as Map<String, dynamic>,
              ),
            )
            .toList();
        if (similarRecipesModelList.isNotEmpty) {
          return DataSuccess(
            similarRecipesModelList,
          );
        } else {
          return const DataEmpty();
        }
      } else {
        return DataFailed(
          '${ApiServiceConstants.textDataFailed} ${response.statusCode}',
        );
      }
    } on dio.DioError catch (e) {
      throw dio.DioError(
        requestOptions: e.requestOptions,
      );
    }
  }

  Future<DataState<RecipeEntity>> getRecipeId({
    required int id,
  }) async {
    try {
      final response = await dioApiService.get(
        '$id/${ApiServiceConstants.endpointRecipeIdInformation}',
        queryParameters: {
          ApiServiceConstants.apiKeyParameter:
              headers[ApiServiceConstants.headerKey],
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final resp = RecipeModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        return DataSuccess(
          resp,
        );
      } else {
        return DataFailed(
          '${ApiServiceConstants.textDataFailed} ${response.statusCode}',
        );
      }
    } on dio.DioError catch (e) {
      throw dio.DioError(
        requestOptions: e.requestOptions,
      );
    }
  }
}
