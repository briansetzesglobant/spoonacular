import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class RecipeIdUseCase extends UseCaseInterface<DataState<RecipeEntity>> {
  RepositoryInterface recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<DataState<RecipeEntity>> call({
    int id = NumbersConstants.valueDefectMethodCall,
  }) {
    return recipesRepository.getRecipeId(id: id);
  }
}
