import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/data/model/similar_recipes/similar_recipes_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/similar_recipes_use_case.dart';
import '../../utils/mock_data_test.dart';
import 'similar_recipes_use_case_test.mocks.dart';

@GenerateMocks([
  RecipesRepository,
])
void main() {
  late UseCaseInterface similarRecipesUseCase;
  late RecipesRepository recipesRepository;
  late DataState<List<SimilarRecipesEntity>> dataStateSuccess;
  late DataState<List<SimilarRecipesEntity>> dataStateEmpty;
  late DataState<List<SimilarRecipesEntity>> dataStateFailed;
  late List<SimilarRecipesModel> similarRecipesListModel;

  setUp(() {
    recipesRepository = MockRecipesRepository();
    Get.replace(recipesRepository);
    similarRecipesUseCase = SimilarRecipesUseCase();
    similarRecipesListModel = [
      SimilarRecipesModel.fromJson(
        similarRecipesModelJsonSuccess,
      )
    ];
    dataStateSuccess = DataSuccess(
      similarRecipesListModel,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Similar Recipes use case test', () {
    test(
      'getSimilarRecipes() should get the status success',
      () async {
        when(recipesRepository.getSimilarRecipes(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        final response = await similarRecipesUseCase(id: 000000)
            as DataState<List<SimilarRecipesEntity>>;
        verify(recipesRepository.getSimilarRecipes(id: 000000)).called(1);
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
      'getSimilarRecipes() should get the status empty',
      () async {
        when(recipesRepository.getSimilarRecipes(id: 000000))
            .thenAnswer((_) async => dataStateEmpty);
        final response = await similarRecipesUseCase(id: 000000)
            as DataState<List<SimilarRecipesEntity>>;
        verify(recipesRepository.getSimilarRecipes(id: 000000)).called(1);
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
      'getSimilarRecipes() should get the status failed',
      () async {
        when(recipesRepository.getSimilarRecipes(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        final response = await similarRecipesUseCase(id: 000000)
            as DataState<List<SimilarRecipesEntity>>;
        verify(recipesRepository.getSimilarRecipes(id: 000000)).called(1);
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
