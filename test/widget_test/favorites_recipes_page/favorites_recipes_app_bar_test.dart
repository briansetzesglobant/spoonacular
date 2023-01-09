import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/presentation/widget/favorites_recipes_app_bar.dart';
import '../../utils/mock_navigator_observer.dart';

void main() {
  late NavigatorObserver mockObserver;

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  testWidgets('FavoritesRecipesAppBar() should display the detail app bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FavoritesRecipesAppBar(),
        ),
      ),
    );
    expect(find.text('Favorites Recipes'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    /*final key = find.byType(InkWell);
    tester.tap(key);
    verify(
      mockObserver.navigator?.pushReplacementNamed(RoutesConstants.homeRoute),
    ).called(1);*/
  });
}
