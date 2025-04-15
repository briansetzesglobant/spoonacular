import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:spoonacular/src/core/util/api_service_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/use_case/implementation/ingredients_use_case.dart';
import 'package:spoonacular/src/domain/use_case/implementation/nutrition_facts_use_case.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipe_id_use_case.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipes_use_case.dart';
import 'package:spoonacular/src/domain/use_case/implementation/similar_recipes_use_case.dart';
import 'package:spoonacular/src/presentation/controller/ingredients_controller.dart';
import 'package:spoonacular/src/presentation/controller/nutrition_facts_controller.dart';
import 'package:spoonacular/src/presentation/controller/recipe_id_controller.dart';
import 'package:spoonacular/src/presentation/controller/recipes_controller.dart';
import 'package:spoonacular/src/presentation/controller/similar_recipes_controller.dart';

class Di {
  void injectDependencies() {
    Get.put(
      Dio(
        BaseOptions(
          baseUrl: ApiServiceConstants.uri,
        ),
      ),
      permanent: true,
    );

    Get.put(
      RecipesApiService(),
      permanent: true,
    );
    Get.put(
      RecipesRepository(),
      permanent: true,
    );
    Get.lazyPut(
      () => RecipesController(
        recipesUseCase: RecipesUseCase(),
      ),
    );
    Get.lazyPut(
      () => NutritionFactsController(
        nutritionFactsUseCase: NutritionFactsUseCase(),
      ),
      tag: StringsConstants.textNutritionFactsController,
    );
    Get.lazyPut(
      () => IngredientsController(
        ingredientsUseCase: IngredientsUseCase(),
      ),
      tag: StringsConstants.textIngredientsController,
    );
    Get.lazyPut(
      () => SimilarRecipesController(
        similarRecipesUseCase: SimilarRecipesUseCase(),
      ),
      tag: StringsConstants.textSimilarRecipesController,
    );
    Get.lazyPut(
      () => RecipeIdController(
        recipeIdUseCase: RecipeIdUseCase(),
      ),
    );
  }
}
