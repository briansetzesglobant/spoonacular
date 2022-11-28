import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/model/recipes_list_model.dart';
import '../utils/mock_data_test.dart';
import 'recipes_api_service_test.mocks.dart';

@GenerateMocks([
  dio.Dio,
])
void main() {
  late RecipesApiService recipesApiService;
  late dio.Dio dioApiService;
  late Map<String, dynamic> dataSuccess;
  late Map<String, dynamic> dataEmpty;
  late Map<String, dynamic> dataFailed;

  setUp(() {
    dioApiService = MockDio();
    Get.replace(dioApiService);
    recipesApiService = RecipesApiService();
    recipesApiService.dioApiService = dioApiService;
    dataSuccess = recipesListModelJsonSuccess;
    dataEmpty = recipesListModelJsonEmpty;
    dataFailed = recipesListModelJsonFailed;
  });

  group('Recipes repository test', () {
    test(
      'getRecipesRandom() should get the status success',
      () async {
        when(
          dioApiService.get(
            'https://api.spoonacular.com/recipes/random?apiKey=6add5cb5264c4077a6540c34ca241c8b&number=3',
          ),
        ).thenAnswer(
          (_) async => dio.Response(
            data: dataSuccess,
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
          RecipesListModel.fromJson(dataSuccess),
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
            data: dataEmpty,
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
            data: dataFailed,
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
}
