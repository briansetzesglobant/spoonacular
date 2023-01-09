import 'package:get/get.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/domain/use_case/implementation/nutrition_facts_use_case.dart';

class NutritionFactsController extends GetxController with StateMixin<String> {
  NutritionFactsController({
    required this.nutritionFactsUseCase,
  });

  UseCaseInterface nutritionFactsUseCase;

  void getNutritionFacts({
    required int id,
  }) async {
    change(null, status: RxStatus.loading());
    final response = await nutritionFactsUseCase(id: id) as DataState<String>;
    switch (response.type) {
      case DataStateType.success:
        change(
          response.data,
          status: RxStatus.success(),
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
