import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class RecipesUseCase extends UseCaseInterface<DataState<RecipesListEntity>> {
  RepositoryInterface recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<DataState<RecipesListEntity>> call() {
    return recipesRepository.getRecipesRandom();
  }
}
