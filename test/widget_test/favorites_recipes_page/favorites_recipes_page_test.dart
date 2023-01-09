import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';
import 'package:spoonacular/src/presentation/view/favorites_recipes_page.dart';
import 'package:spoonacular/src/presentation/widget/favorites_recipes_app_bar.dart';
import 'favorites_recipes_page_test.mocks.dart';

@GenerateMocks([
  GetStorageLocal,
])
void main() {
  late GetStorageLocal getStorageLocal;
  late Map<String, String> favoritesRecipes;

  setUp(() {
    getStorageLocal = MockGetStorageLocal();
    favoritesRecipes = {
      'title': 'https://spoonacular.com/recipeImages/1043339-556x370.jpg'
    };
  });

  testWidgets(
      'FavoritesRecipesPage() should display the page with favorites recipes',
      (WidgetTester tester) async {
    when(getStorageLocal.readGetStorageLocal()).thenAnswer(
      (_) => favoritesRecipes,
    );
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavoritesRecipesPage(
              storage: getStorageLocal,
            ),
          ),
        ),
      ),
    );
    expect(
      find.descendant(
        of: find.byType(Scaffold),
        matching: find.byType(FavoritesRecipesAppBar),
      ),
      findsOneWidget,
    );
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
  });
}
