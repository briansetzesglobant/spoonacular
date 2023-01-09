import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/core/use_case/use_case_interface.dart';
import 'package:spoonacular/src/data/model/recipes/recipe_model.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipe_id_use_case.dart';
import '../../utils/mock_data_test.dart';
import 'recipe_id_use_case_test.mocks.dart';

@GenerateMocks([
  RecipesRepository,
])
void main() {
  late UseCaseInterface recipeIdUseCase;
  late RecipesRepository recipesRepository;
  late DataState<RecipeEntity> dataStateSuccess;
  late DataState<RecipeEntity> dataStateFailed;
  late RecipeModel recipeModel;

  setUp(() {
    recipesRepository = MockRecipesRepository();
    Get.replace(recipesRepository);
    recipeIdUseCase = RecipeIdUseCase();
    recipeModel = RecipeModel.fromJson(
      recipeModelJsonSuccess,
    );
    dataStateSuccess = DataSuccess(
      recipeModel,
    );
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Recipe Id use case test', () {
    test(
      'getRecipeId() should get the status success',
      () async {
        when(recipesRepository.getRecipeId(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        final response =
            await recipeIdUseCase(id: 000000) as DataState<RecipeEntity>;
        verify(recipesRepository.getRecipeId(id: 000000)).called(1);
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
      'getRecipeId() should get the status failed',
      () async {
        when(recipesRepository.getRecipeId(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        final response =
            await recipeIdUseCase(id: 000000) as DataState<RecipeEntity>;
        verify(recipesRepository.getRecipeId(id: 000000)).called(1);
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
