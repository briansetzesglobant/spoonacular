import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/model/ingredients/ingredients_list_model.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/ingredients_use_case.dart';
import 'package:spoonacular/src/presentation/controller/ingredients_controller.dart';
import '../../utils/mock_data_test.dart';
import 'ingredients_controller_test.mocks.dart';

@GenerateMocks([
  IngredientsUseCase,
])
void main() {
  late IngredientsController ingredientsController;
  late IngredientsUseCase ingredientsUseCase;
  late DataState<IngredientsListEntity> dataStateSuccess;
  late DataState<IngredientsListEntity> dataStateEmpty;
  late DataState<IngredientsListEntity> dataStateFailed;
  late IngredientsListModel ingredientsListModel;

  setUp(() {
    ingredientsUseCase = MockIngredientsUseCase();
    ingredientsController = IngredientsController(
      ingredientsUseCase: ingredientsUseCase,
    );
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

  group('Ingredients controller test', () {
    test(
      'getIngredients() should get the status success',
      () async {
        when(ingredientsUseCase(id: 000000))
            .thenAnswer((_) async => dataStateSuccess);
        ingredientsController.getIngredients(id: 000000);
        verify(ingredientsUseCase()).called(1);
      },
    );

    test(
      'getIngredients() should get the status empty',
      () async {
        when(ingredientsUseCase(id: 000000))
            .thenAnswer((_) async => dataStateEmpty);
        ingredientsController.getIngredients(id: 000000);
        verify(ingredientsUseCase()).called(1);
      },
    );

    test(
      'getIngredients() should get the status failed',
      () async {
        when(ingredientsUseCase(id: 000000))
            .thenAnswer((_) async => dataStateFailed);
        ingredientsController.getIngredients(id: 000000);
        verify(ingredientsUseCase()).called(1);
      },
    );
  });
}
