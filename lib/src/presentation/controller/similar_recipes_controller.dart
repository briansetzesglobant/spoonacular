import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/similar_recipes_use_case.dart';

class SimilarRecipesController extends GetxController
    with StateMixin<List<SimilarRecipesEntity>> {
  SimilarRecipesController({
    required this.similarRecipesUseCase,
  });

  UseCaseInterface similarRecipesUseCase;

  void getSimilarRecipes({
    required int id,
  }) async {
    change(null, status: RxStatus.loading());
    final response = await similarRecipesUseCase(id: id)
    as DataState<List<SimilarRecipesEntity>>;
    switch (response.type) {
      case DataStateType.success:
        change(
          response.data,
          status: RxStatus.success(),
        );
        break;
      case DataStateType.empty:
        change(
          null,
          status: RxStatus.empty(),
        );
        break;
      case DataStateType.error:
        change(
          null,
          status: RxStatus.error(response.error),
        );
        break;
    }
  }
}
