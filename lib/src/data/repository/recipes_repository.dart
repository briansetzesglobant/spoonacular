import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/domain/entity/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class RecipesRepository extends RepositoryInterface {
  RecipesApiService recipesApiService = Get.find<RecipesApiService>();

  @override
  Future<DataState<RecipesListEntity>> getRecipesRandom() {
    return recipesApiService.getRecipesRandom();
  }
}
