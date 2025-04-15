import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/model/recipes/recipes_list_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipes_list_entity.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';
import '../utils/mock_data.dart';
import 'recipes_repository_test.mocks.dart';

@GenerateMocks([
  RecipesApiService,
])
void main() {
  late RepositoryInterface recipesRepository;
  late RecipesApiService recipesApiService;
  late DataState<RecipesListEntity> recipesDataStateSuccess;
  late DataState<RecipesListEntity> recipesDataStateEmpty;
  late DataState<RecipesListEntity> recipesDataStateFailed;
  late RecipesListModel recipesListModel;

  setUp(() {
    recipesApiService = MockRecipesApiService();
    Get.replace(recipesApiService);
    recipesRepository = RecipesRepository();
    recipesListModel = RecipesListModel.fromJson(
      recipesListModelJsonSuccess,
    );
    recipesDataStateSuccess = DataSuccess(
      recipesListModel,
    );
    recipesDataStateEmpty = const DataEmpty();
    recipesDataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Recipes repository test', () {
    test(
      'getRecipesRandom() should get the status success',
      () async {
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => recipesDataStateSuccess);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
        expect(
          response.data,
          recipesDataStateSuccess.data,
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
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => recipesDataStateEmpty);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
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
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => recipesDataStateFailed);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          recipesDataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });
}
