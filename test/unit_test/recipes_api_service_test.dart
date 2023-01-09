import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/model/recipes/recipes_list_model.dart';
import '../utils/mock_data_test.dart';
import 'recipes_api_service_test.mocks.dart';

@GenerateMocks([
  dio.Dio,
])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late RecipesApiService recipesApiService;
  late dio.Dio dioApiService;
  late Map<String, dynamic> headers;

  void getEnv() async {
    await dotenv.load(fileName: 'assets/env/.env');
    dioApiService = MockDio();
    Get.replace(dioApiService);
    recipesApiService = RecipesApiService();
    recipesApiService.dioApiService = dioApiService;
  }

  setUp(() {
    getEnv();
  });

  group('Recipes repository test', () {
    test(
      'getRecipesRandom() should get the status success',
      () async {
        headers = {
          'x-api-key': dotenv.env['API_KEY'],
        };
        when(
          dioApiService.get(
            //'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
            'random',
            queryParameters: {
              'apiKey': headers['x-api-key'],
              'number': 3,
            },
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: recipesListModelJsonSuccess,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getRecipesRandom();
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).called(1);
        expect(
          response.data,
          RecipesListModel.fromJson(
            recipesListModelJsonSuccess,
          ),
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getRecipesRandom() should get the status empty',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: recipesListModelJsonEmpty,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getRecipesRandom();
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getRecipesRandom() should get the status failed',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: errorModelJsonFailed,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
            ),
            statusCode: HttpStatus.notFound,
          ),
        );
        final response = await recipesApiService.getRecipesRandom();
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading recipes random 404',
        );
      },
    );

    test(
      'getRecipesRandom() should generate a exception',
      () async {
        dio.DioError? error;
        final exception = dio.DioError(
          requestOptions: dio.RequestOptions(
            path:
                'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        );
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).thenThrow(exception);
        try {
          await recipesApiService.getRecipesRandom();
        } on dio.DioError catch (e) {
          error = e;
        }
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).called(1);
        assert(error != null);
        expect(
          error?.requestOptions,
          exception.requestOptions,
        );
      },
    );
  });

  group('Nutrition Facts repository test', () {
    test(
      'getNutritionFacts() should get the status success',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: nutritionFactsSuccess,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getNutritionFacts(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          nutritionFactsSuccess,
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getNutritionFacts() should get the status failed',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: errorModelJsonFailed,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.notFound,
          ),
        );
        final response = await recipesApiService.getNutritionFacts(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading recipes random 404',
        );
      },
    );

    test(
      'getNutritionFacts() should generate a exception',
      () async {
        dio.DioError? error;
        final exception = dio.DioError(
          requestOptions: dio.RequestOptions(
            path:
                'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        );
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenThrow(exception);
        try {
          await recipesApiService.getNutritionFacts(id: 000000);
        } on dio.DioError catch (e) {
          error = e;
        }
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/641166/nutritionLabel?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        assert(error != null);
        expect(
          error?.requestOptions,
          exception.requestOptions,
        );
      },
    );
  });

  group('Ingredients repository test', () {
    test(
      'getIngredients() should get the status success',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: ingredientsListModelJsonSuccess,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getIngredients(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          RecipesListModel.fromJson(
            ingredientsListModelJsonSuccess,
          ),
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getIngredients() should get the status empty',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: ingredientsListModelJsonEmpty,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getIngredients(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getIngredients() should get the status failed',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: errorModelJsonFailed,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.notFound,
          ),
        );
        final response = await recipesApiService.getIngredients(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading recipes random 404',
        );
      },
    );

    test(
      'getIngredients() should generate a exception',
      () async {
        dio.DioError? error;
        final exception = dio.DioError(
          requestOptions: dio.RequestOptions(
            path:
                'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        );
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenThrow(exception);
        try {
          await recipesApiService.getIngredients(id: 000000);
        } on dio.DioError catch (e) {
          error = e;
        }
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/1003464/ingredientWidget.json?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        assert(error != null);
        expect(
          error?.requestOptions,
          exception.requestOptions,
        );
      },
    );
  });

  group('Similar Recipes repository test', () {
    test(
      'getSimilarRecipes() should get the status success',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: similarRecipesModelJsonSuccess,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getSimilarRecipes(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          RecipesListModel.fromJson(
            similarRecipesModelJsonSuccess,
          ),
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getSimilarRecipes() should get the status empty',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: similarRecipesModelJsonEmpty,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getSimilarRecipes(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getSimilarRecipes() should get the status failed',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: errorModelJsonFailed,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.notFound,
          ),
        );
        final response = await recipesApiService.getSimilarRecipes(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading recipes random 404',
        );
      },
    );

    test(
      'getSimilarRecipes() should generate a exception',
      () async {
        dio.DioError? error;
        final exception = dio.DioError(
          requestOptions: dio.RequestOptions(
            path:
                'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        );
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenThrow(exception);
        try {
          await recipesApiService.getSimilarRecipes(id: 000000);
        } on dio.DioError catch (e) {
          error = e;
        }
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/715538/similar?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        assert(error != null);
        expect(
          error?.requestOptions,
          exception.requestOptions,
        );
      },
    );
  });

  group('Recipe Id repository test', () {
    test(
      'getRecipeId() should get the status success',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: recipeModelJsonSuccess,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.ok,
          ),
        );
        final response = await recipesApiService.getRecipeId(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          RecipesListModel.fromJson(
            recipeModelJsonSuccess,
          ),
        );
        expect(
          response.error,
          null,
        );
      },
    );

    test(
      'getRecipeId() should get the status failed',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: errorModelJsonFailed,
            requestOptions: dio.RequestOptions(
              path:
                  'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
            ),
            statusCode: HttpStatus.notFound,
          ),
        );
        final response = await recipesApiService.getRecipeId(id: 000000);
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading recipes random 404',
        );
      },
    );

    test(
      'getRecipeId() should generate a exception',
      () async {
        dio.DioError? error;
        final exception = dio.DioError(
          requestOptions: dio.RequestOptions(
            path:
                'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        );
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).thenThrow(exception);
        try {
          await recipesApiService.getRecipeId(id: 000000);
        } on dio.DioError catch (e) {
          error = e;
        }
        verify(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/716429/information?apiKey=6add5cb5264c4077a6540c34ca241c8b',
          ),
        ).called(1);
        assert(error != null);
        expect(
          error?.requestOptions,
          exception.requestOptions,
        );
      },
    );
  });
}
