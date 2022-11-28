import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/domain/entity/recipes_list_entity.dart';

abstract class RepositoryInterface {
  Future<DataState<RecipesListEntity>> getRecipesRandom();
}
