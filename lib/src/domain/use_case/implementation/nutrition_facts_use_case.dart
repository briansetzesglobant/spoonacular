import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class NutritionFactsUseCase extends UseCaseInterface<DataState<String>> {
  RepositoryInterface nutritionFactsRepository = Get.find<RecipesRepository>();

  @override
  Future<DataState<String>> call({
    int id = NumbersConstants.valueDefectMethodCall,
  }) {
    return nutritionFactsRepository.getNutritionFacts(id: id);
  }
}
