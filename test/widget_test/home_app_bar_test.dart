import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spoonacular/src/presentation/widget/home_app_bar.dart';

void main() {
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
    expect(find.byType(Image), findsNWidgets(2));
    expect(find.byType(AutoSizeText), findsOneWidget);
  });
}
