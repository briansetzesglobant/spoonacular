import 'package:get_storage/get_storage.dart';

class GetStorageLocal {
  GetStorageLocal._privateConstructor();

  static const String textFavoritesRecipes = 'favoritesRecipes';

  static final GetStorage _storage = GetStorage();

  static final GetStorageLocal instance = GetStorageLocal._privateConstructor();

  void writeGetStorageLocal(Map<String, String> favoritesRecipes) {
    _storage.write(textFavoritesRecipes, favoritesRecipes);
  }

  Map<String, String> readGetStorageLocal() {
    return _storage.read(
          textFavoritesRecipes,
        ) ??
        {};
  }
}
