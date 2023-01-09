import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/model/recipes/recipe_model.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipe_id_use_case.dart';
import 'package:spoonacular/src/presentation/controller/recipe_id_controller.dart';
import '../../utils/mock_data_test.dart';
import 'recipe_id_controller_test.mocks.dart';

@GenerateMocks([
  RecipeIdUseCase,
])
void main() {
  late RecipeIdController recipeIdController;
  late RecipeIdUseCase recipeIdUseCase;
  late DataState<RecipeEntity> dataStateSuccess;
  late DataState<RecipeEntity> dataStateFailed;
  late RecipeModel recipeModel;

  setUp(() {
    recipeIdUseCase = MockRecipeIdUseCase();
    recipeIdController = RecipeIdController(
      recipeIdUseCase: recipeIdUseCase,
    );
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

  group('Recipe Id controller test', () {
    test(
      'getRecipeId() should get the status success',
      () async {
        when(recipeIdUseCase(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        recipeIdController.getRecipeId(id: 000000);
        verify(recipeIdUseCase()).called(1);
      },
    );

    test(
      'getRecipeId() should get the status failed',
      () async {
        when(recipeIdUseCase(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        recipeIdController.getRecipeId(id: 000000);
        verify(recipeIdUseCase()).called(1);
      },
    );
  });
}
