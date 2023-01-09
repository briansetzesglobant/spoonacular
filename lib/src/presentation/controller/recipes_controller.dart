import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipes_use_case.dart';

class RecipesController extends GetxController
    with StateMixin<List<RecipeEntity>> {
  RecipesController({
    required this.recipesUseCase,
  });

  UseCaseInterface recipesUseCase;

  void getRecipesRandom() async {
    change(
      null,
      status: RxStatus.loading(),
    );
    final response = await recipesUseCase() as DataState<RecipesListEntity>;
    switch (response.type) {
      case DataStateType.success:
        change(
          response.data!.recipes,
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
