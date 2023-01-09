import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/use_case/implementation/nutrition_facts_use_case.dart';
import '../../utils/mock_data_test.dart';
import 'nutrition_facts_use_case_test.mocks.dart';

@GenerateMocks([
  RecipesRepository,
])
void main() {
  late UseCaseInterface nutritionFactsUseCase;
  late RecipesRepository recipesRepository;
  late DataState<String> dataStateSuccess;
  late DataState<String> dataStateFailed;

  setUp(() {
    recipesRepository = MockRecipesRepository();
    Get.replace(recipesRepository);
    nutritionFactsUseCase = NutritionFactsUseCase();
    dataStateSuccess = const DataSuccess(
      nutritionFactsSuccess,
    );
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Nutrition Facts use case test', () {
    test(
      'getNutritionFacts() should get the status success',
      () async {
        when(recipesRepository.getNutritionFacts(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        final response =
            await nutritionFactsUseCase(id: 000000) as DataState<String>;
        verify(recipesRepository.getNutritionFacts(id: 000000)).called(1);
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getNutritionFacts() should get the status failed',
      () async {
        when(recipesRepository.getNutritionFacts(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        final response =
            await nutritionFactsUseCase(id: 000000) as DataState<String>;
        verify(recipesRepository.getNutritionFacts(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          dataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });
}
