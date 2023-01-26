import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/data/model/recipes/recipes_list_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipes_use_case.dart';
import '../../utils/mock_data.dart';
import 'recipes_use_case_test.mocks.dart';

@GenerateMocks([
  RecipesRepository,
])
void main() {
  late UseCaseInterface recipesUseCase;
  late RecipesRepository recipesRepository;
  late DataState<RecipesListModel> dataStateSuccess;
  late DataState<RecipesListModel> dataStateEmpty;
  late DataState<RecipesListModel> dataStateFailed;
  late RecipesListModel recipesListModel;

  setUp(() {
    recipesRepository = MockRecipesRepository();
    Get.replace(recipesRepository);
    recipesUseCase = RecipesUseCase();
    recipesListModel = RecipesListModel.fromJson(
      recipesListModelJsonSuccess,
    );
    dataStateSuccess = DataSuccess(
      recipesListModel,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Recipes use case test', () {
    test(
      'getRecipesRandom() should get the status success',
      () async {
        when(recipesRepository.getRecipesRandom())
            .thenAnswer((_) async => dataStateSuccess);
        final response = await recipesUseCase() as DataState<RecipesListEntity>;
        verify(recipesRepository.getRecipesRandom()).called(1);
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
      'getRecipesRandom() should get the status empty',
      () async {
        when(recipesRepository.getRecipesRandom())
            .thenAnswer((_) async => dataStateEmpty);
        final response = await recipesUseCase() as DataState<RecipesListEntity>;
        verify(recipesRepository.getRecipesRandom()).called(1);
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
      'getRecipesRandom() should get the status failed',
      () async {
        when(recipesRepository.getRecipesRandom())
            .thenAnswer((_) async => dataStateFailed);
        final response = await recipesUseCase() as DataState<RecipesListEntity>;
        verify(recipesRepository.getRecipesRandom()).called(1);
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
