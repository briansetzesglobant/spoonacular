import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';
import 'package:spoonacular/src/presentation/widget/detail_app_bar.dart';
import '../../utils/mock_navigator_observer.dart';
import 'detail_app_bar_test.mocks.dart';

@GenerateMocks([
  GetStorageLocal,
])
void main() {
  late GetStorageLocal getStorageLocal;
  late NavigatorObserver mockObserver;
  late Map<String, String> favoritesRecipes;

  setUp(() {
    getStorageLocal = MockGetStorageLocal();
    mockObserver = MockNavigatorObserver();
    favoritesRecipes = {
      'title': 'https://spoonacular.com/recipeImages/1043339-556x370.jpg'
    };
  });

  testWidgets('DetailAppBar() should display the detail app bar',
      (WidgetTester tester) async {
    when(getStorageLocal.readGetStorageLocal()).thenAnswer(
      (_) => favoritesRecipes,
    );
    when(getStorageLocal.writeGetStorageLocal(favoritesRecipes))
        .thenAnswer((_) => true);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DetailAppBar(
            title: 'title',
            aggregateLikes: 1,
            image: 'https://spoonacular.com/recipeImages/1043339-556x370.jpg',
            storage: getStorageLocal,
          ),
        ),
      ),
    );
    expect(find.text('title'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(3));
    final key2 = find.byKey(const Key('ink-well-2'));
    await tester.tap(key2);
    await tester.pumpAndSettle();
    /*final key1 = find.byKey(const Key('ink-well-1'));
    await tester.tap(key1);
    await tester.pumpAndSettle();
    verify(
      mockObserver.navigator?.pushReplacementNamed(RoutesConstants.homeRoute),
    ).called(1);*/
  });
}
