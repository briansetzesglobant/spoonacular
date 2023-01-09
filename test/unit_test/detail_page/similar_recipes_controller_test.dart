import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/model/similar_recipes/similar_recipes_model.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/similar_recipes_use_case.dart';
import 'package:spoonacular/src/presentation/controller/similar_recipes_controller.dart';
import '../../utils/mock_data_test.dart';
import 'similar_recipes_controller_test.mocks.dart';

@GenerateMocks([
  SimilarRecipesUseCase,
])
void main() {
  late SimilarRecipesController similarRecipesController;
  late SimilarRecipesUseCase similarRecipesUseCase;
  late DataState<List<SimilarRecipesEntity>> dataStateSuccess;
  late DataState<List<SimilarRecipesEntity>> dataStateEmpty;
  late DataState<List<SimilarRecipesEntity>> dataStateFailed;
  late List<SimilarRecipesModel> similarRecipesListModel;

  setUp(() {
    similarRecipesUseCase = MockSimilarRecipesUseCase();
    similarRecipesController = SimilarRecipesController(
      similarRecipesUseCase: similarRecipesUseCase,
    );
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

  group('Similar Recipes controller test', () {
    test(
      'getSimilarRecipes() should get the status success',
      () async {
        when(similarRecipesUseCase(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        similarRecipesController.getSimilarRecipes(id: 000000);
        verify(similarRecipesUseCase()).called(1);
      },
    );

    test(
      'getSimilarRecipes() should get the status empty',
      () async {
        when(similarRecipesUseCase(id: 000000))
            .thenAnswer((_) async => dataStateEmpty);
        similarRecipesController.getSimilarRecipes(id: 000000);
        verify(similarRecipesUseCase()).called(1);
      },
    );

    test(
      'getSimilarRecipes() should get the status failed',
      () async {
        when(similarRecipesUseCase(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        similarRecipesController.getSimilarRecipes(id: 000000);
        verify(similarRecipesUseCase()).called(1);
      },
    );
  });
}
