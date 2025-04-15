import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredient_entity.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/ingredients_use_case.dart';

class IngredientsController extends GetxController
    with StateMixin<List<IngredientEntity>> {
  IngredientsController({
    required this.ingredientsUseCase,
  });

  UseCaseInterface ingredientsUseCase;

  void getIngredients({
    required int id,
  }) async {
    change(null, status: RxStatus.loading());
    final response =
    await ingredientsUseCase(id: id) as DataState<IngredientsListEntity>;
    switch (response.type) {
      case DataStateType.success:
        change(
          response.data!.ingredients,
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
