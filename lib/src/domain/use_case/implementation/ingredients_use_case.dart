import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class IngredientsUseCase
    extends UseCaseInterface<DataState<IngredientsListEntity>> {
  RepositoryInterface ingredientsRepository = Get.find<RecipesRepository>();

  @override
  Future<DataState<IngredientsListEntity>> call({
    int id = NumbersConstants.valueDefectMethodCall,
  }) {
    return ingredientsRepository.getIngredients(id: id);
  }
}
