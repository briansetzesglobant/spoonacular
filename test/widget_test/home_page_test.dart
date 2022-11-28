import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:spoonacular/src/core/resource/data_state.dart';
import 'package:spoonacular/src/data/model/recipes_list_model.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipes_use_case.dart';
import 'package:spoonacular/src/presentation/controller/recipes_controller.dart';
import 'package:spoonacular/src/presentation/view/home_page.dart';
import 'package:spoonacular/src/presentation/widget/home_app_bar.dart';
import '../utils/mock_data_test.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  RecipesUseCase,
])
void main() {
  late RecipesController recipesController;
  late RecipesUseCase recipesUseCase;
  late DataState<RecipesListModel> dataStateSuccess;
  late DataState<RecipesListModel> dataStateEmpty;
  late DataState<RecipesListModel> dataStateFailed;

  setUp(() {
    recipesUseCase = MockRecipesUseCase();
    Get.replace(recipesUseCase);
    recipesController = RecipesController();
    Get.replace(recipesController);
    final RecipesListModel recipesListModel = RecipesListModel.fromJson(
      recipesListModelJsonSuccess,
    );
    dataStateSuccess = DataSuccess(recipesListModel);
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed('error');
  });

  group('Home page test', () {
    testWidgets('HomePage() should display the success page',
        (WidgetTester tester) async {
      when(recipesUseCase()).thenAnswer((_) async => dataStateSuccess);
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            const MaterialApp(
              home: HomePage(),
            ),
          ),
        );
      });
      expect(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(HomeAppBar),
        ),
        findsOneWidget,
      );
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('NO RECIPES FOUND'), findsNothing);
      expect(find.byType(LottieBuilder), findsNothing);
      //tester.tap(find.byType(InkWell));
      //await tester.pump();
      //expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('HomePage() should display the empty page',
        (WidgetTester tester) async {
      when(recipesUseCase()).thenAnswer((_) async => dataStateEmpty);
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: HomePage(),
              ),
            ),
          ),
        );
      });
      expect(find.text('NO RECIPES FOUND'), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsNothing);
      expect(find.byType(LottieBuilder), findsNothing);
    });

    testWidgets('HomePage() should display the error page',
        (WidgetTester tester) async {
      when(recipesUseCase()).thenAnswer((_) async => dataStateFailed);
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: HomePage(),
              ),
            ),
          ),
        );
      });
      expect(find.byType(LottieBuilder), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsNothing);
      expect(find.text('NO RECIPES FOUND'), findsNothing);
    });
  });
}
