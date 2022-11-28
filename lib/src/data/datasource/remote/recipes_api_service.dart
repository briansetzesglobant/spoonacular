import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/util/api_service_constants.dart';
import 'package:spoonacular/src/data/model/recipes_list_model.dart';
import 'package:spoonacular/src/domain/entity/recipes_list_entity.dart';

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
          ApiServiceConstants.numberParameter:
              ApiServiceConstants.numberParameterValue,
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
}
