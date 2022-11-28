import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:spoonacular/src/core/util/api_service_constants.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipes_use_case.dart';
import 'package:spoonacular/src/presentation/controller/recipes_controller.dart';

class Di {
  void injectDependencies() {
    Get.lazyPut(
      () => RecipesController(),
    );
    Get.lazyPut(
      () => RecipesUseCase(),
    );
    Get.lazyPut(
      () => RecipesRepository(),
    );
    Get.lazyPut(
      () => RecipesApiService(),
    );
    Get.lazyPut(
      () => Dio(
        BaseOptions(
          baseUrl: ApiServiceConstants.uri,
        ),
      ),
    );
  }
}
