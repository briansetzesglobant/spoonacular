import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/model/recipes_list_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/repository/repository_interface.dart';
import '../utils/mock_data_test.dart';
import 'recipes_repository_test.mocks.dart';

@GenerateMocks([
  RecipesApiService,
])
void main() {
  late RepositoryInterface recipesRepository;
  late RecipesApiService recipesApiService;
  late DataState<RecipesListModel> dataStateSuccess;
  late DataState<RecipesListModel> dataStateEmpty;
  late DataState<RecipesListModel> dataStateFailed;

  setUp(() {
    recipesApiService = MockRecipesApiService();
    Get.replace(recipesApiService);
    recipesRepository = RecipesRepository();
    final RecipesListModel recipesListModel = RecipesListModel.fromJson(
      recipesListModelJsonSuccess,
    );
    dataStateSuccess = DataSuccess(recipesListModel);
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed('error');
  });

  group('Recipes repository test', () {
    test(
      'getRecipesRandom() should get the status success',
      () async {
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => dataStateSuccess);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
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
        when(recipesApiService.getRecipesRandom())
            .thenAnswer((_) async => dataStateEmpty);
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
            .thenAnswer((_) async => dataStateFailed);
        final response = await recipesRepository.getRecipesRandom();
        verify(recipesApiService.getRecipesRandom()).called(1);
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
