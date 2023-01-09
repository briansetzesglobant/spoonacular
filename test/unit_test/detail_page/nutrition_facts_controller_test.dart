import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/domain/use_case/implementation/nutrition_facts_use_case.dart';
import 'package:spoonacular/src/presentation/controller/nutrition_facts_controller.dart';
import '../../utils/mock_data_test.dart';
import 'nutrition_facts_controller_test.mocks.dart';

@GenerateMocks([
  NutritionFactsUseCase,
])
void main() {
  late NutritionFactsController nutritionFactsController;
  late NutritionFactsUseCase nutritionFactsUseCase;
  late DataState<String> dataStateSuccess;
  late DataState<String> dataStateFailed;

  setUp(() {
    nutritionFactsUseCase = MockNutritionFactsUseCase();
    nutritionFactsController = NutritionFactsController(
      nutritionFactsUseCase: nutritionFactsUseCase,
    );
    dataStateSuccess = const DataSuccess(
      nutritionFactsSuccess,
    );
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Nutrition Facts controller test', () {
    test(
      '.getNutritionFacts() should get the status success',
      () async {
        when(nutritionFactsUseCase(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        nutritionFactsController.getNutritionFacts(id: 000000);
        verify(nutritionFactsUseCase()).called(1);
      },
    );

    test(
      'getNutritionFacts() should get the status failed',
      () async {
        when(nutritionFactsUseCase(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        nutritionFactsController.getNutritionFacts(id: 000000);
        verify(nutritionFactsUseCase()).called(1);
      },
    );
  });
}
