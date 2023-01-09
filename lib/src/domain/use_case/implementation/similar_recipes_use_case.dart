import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';

class SimilarRecipesUseCase
    extends UseCaseInterface<DataState<List<SimilarRecipesEntity>>> {
  RepositoryInterface similarRecipesRepository = Get.find<RecipesRepository>();

  @override
  Future<DataState<List<SimilarRecipesEntity>>> call({
    int id = NumbersConstants.valueDefectMethodCall,
  }) {
    return similarRecipesRepository.getSimilarRecipes(id: id);
  }
}
