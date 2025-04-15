import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipe_id_use_case.dart';

class RecipeIdController extends GetxController with StateMixin<RecipeEntity> {
  RecipeIdController({
    required this.recipeIdUseCase,
  });

  UseCaseInterface recipeIdUseCase;

  Future<void> getRecipeId({
    required int id,
  }) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    final response = await recipeIdUseCase(id: id) as DataState<RecipeEntity>;
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
