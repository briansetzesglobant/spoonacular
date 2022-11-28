import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/presentation/view/splash_screen.dart';

void main() {
  testWidgets('SplashScreen() should display the splash screen',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashScreen(),
        ),
      );
    });
    expect(
      find.descendant(
        of: find.byType(Scaffold),
        matching: find.byType(SafeArea),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(Center),
        matching: find.byType(SingleChildScrollView),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(Column),
        matching: find.byType(SizedBox),
      ),
      findsOneWidget,
    );
    expect(find.byType(LottieBuilder), findsOneWidget);
  });
}
