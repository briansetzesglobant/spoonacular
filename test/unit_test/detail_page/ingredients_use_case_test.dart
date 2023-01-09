import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/data/model/ingredients/ingredients_list_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/ingredients_use_case.dart';
import '../../utils/mock_data_test.dart';
import 'ingredients_use_case_test.mocks.dart';

@GenerateMocks([
  RecipesRepository,
])
void main() {
  late UseCaseInterface ingredientsUseCase;
  late RecipesRepository recipesRepository;
  late DataState<IngredientsListEntity> dataStateSuccess;
  late DataState<IngredientsListEntity> dataStateEmpty;
  late DataState<IngredientsListEntity> dataStateFailed;
  late IngredientsListModel ingredientsListModel;

  setUp(() {
    recipesRepository = MockRecipesRepository();
    Get.replace(recipesRepository);
    ingredientsUseCase = IngredientsUseCase();
    ingredientsListModel = IngredientsListModel.fromJson(
      ingredientsListModelJsonSuccess,
    );
    dataStateSuccess = DataSuccess(
      ingredientsListModel,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Ingredients use case test', () {
    test(
      'getIngredients() should get the status success',
      () async {
        when(recipesRepository.getIngredients(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        final response = await ingredientsUseCase(id: 000000)
            as DataState<IngredientsListEntity>;
        verify(recipesRepository.getIngredients(id: 000000)).called(1);
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
      'getIngredients() should get the status empty',
      () async {
        when(recipesRepository.getIngredients(id: 000000))
            .thenAnswer((_) async => dataStateEmpty);
        final response = await ingredientsUseCase(id: 000000)
            as DataState<IngredientsListEntity>;
        verify(recipesRepository.getIngredients(id: 000000)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'getIngredients() should get the status failed',
      () async {
        when(recipesRepository.getIngredients(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        final response = await ingredientsUseCase(id: 000000)
            as DataState<IngredientsListEntity>;
        verify(recipesRepository.getIngredients(id: 000000)).called(1);
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
