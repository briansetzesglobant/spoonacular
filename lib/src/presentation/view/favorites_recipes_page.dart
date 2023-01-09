import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';
import 'package:spoonacular/src/presentation/widget/favorites_recipes_app_bar.dart';

class FavoritesRecipesPage extends StatefulWidget {
  const FavoritesRecipesPage({
    required this.storage,
  });

  static const double textFontSize = 40.0;
  static const double sizeBoxImageUrl = 500.0;
  static const int gridViewCrossAxisCount = 3;

  final GetStorageLocal storage;

  @override
  State<FavoritesRecipesPage> createState() => _FavoritesRecipesPageState();
}

class _FavoritesRecipesPageState extends State<FavoritesRecipesPage> {
  @override
  void initState() {
    super.initState();
    storageData = widget.storage.readGetStorageLocal();
  }

  late Map<String, String> storageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavoritesRecipesAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: NumbersConstants.paddingTopLarge,
        ),
        child: GridView.builder(
          itemCount: storageData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: FavoritesRecipesPage.gridViewCrossAxisCount,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: NumbersConstants.paddingBottomXMedium,
                  ),
                  child: SizedBox(
                    width: FavoritesRecipesPage.sizeBoxImageUrl,
                    height: FavoritesRecipesPage.sizeBoxImageUrl,
                    child: CachedNetworkImage(
                      imageUrl: storageData.values.elementAt(index),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (
                        context,
                        url,
                      ) =>
                          Center(
                        child: SizedBox(
                          child: Lottie.asset(
                            AssetsConstants.lottieLoadingUtensils,
                          ),
                        ),
                      ),
                      errorWidget: (
                        context,
                        url,
                        error,
                      ) =>
                          Center(
                        child: Container(
                          color: Colors.grey,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Lottie.asset(
                            AssetsConstants.lottieOopsErrorNew,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  storageData.keys.elementAt(index),
                  style: const TextStyle(
                    fontSize: FavoritesRecipesPage.textFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
