import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/presentation/widget/home_app_bar.dart';
import '../../utils/mock_navigator_observer.dart';

void main() {
  late NavigatorObserver mockObserver;

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  testWidgets('HomeAppBar() should display the home app bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HomeAppBar(),
        ),
      ),
    );
    expect(find.text('Spoonacular'), findsOneWidget);
    expect(find.text('SEARCH RECIPES'), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(3));
    /*final key = find.byType(InkWell);
    tester.tap(key);
    verify(
      mockObserver.navigator
          ?.pushReplacementNamed(RoutesConstants.favoritesRoute),
    ).called(1);*/
  });
}
