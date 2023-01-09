import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  DetailAppBar({
    required this.title,
    required this.aggregateLikes,
    required this.image,
    required this.storage,
  });

  static const double imageSize = 100.0;
  static const double imageSpoonacularSize = 50.0;
  static const double textTitleFontSize = 20.0;
  static const double textAggregateLikesFontSizeFirst = 50.0;
  static const double textAggregateLikesFontSizeSecond = 40.0;
  static const double constraintsMaxWidth = 600.0;
  static const double preferredSizeHeight = 70.0;

  final String title;
  final int aggregateLikes;
  final String image;
  final Map<String, String> favoritesRecipes = {};
  final GetStorageLocal storage;

  @override
  Size get preferredSize => const Size.fromHeight(
        preferredSizeHeight,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ColoredBox(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.only(
              left: NumbersConstants.paddingLeftBig,
              right: NumbersConstants.paddingRightLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: NumbersConstants.paddingRightXSmall,
                  ),
                  child: InkWell(
                    key: const Key('ink-well-1'),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                        RoutesConstants.homeRoute,
                      );
                    },
                    child: const Image(
                      image: AssetImage(
                        AssetsConstants.imageSpoonacular,
                      ),
                      width: imageSpoonacularSize,
                      height: imageSpoonacularSize,
                    ),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: textTitleFontSize,
                      fontFamily: StringsConstants.textFontFamily,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: NumbersConstants.paddingTopXXSmall,
                      bottom: NumbersConstants.paddingBottomMedium,
                    ),
                    child: InkWell(
                      key: const Key('ink-well-2'),
                      onTap: () {
                        favoritesRecipes.addAll(
                          storage.readGetStorageLocal(),
                        );
                        favoritesRecipes[title] = image;
                        storage.writeGetStorageLocal(favoritesRecipes);
                      },
                      child: const Image(
                        image: AssetImage(
                          AssetsConstants.imageILikeIt,
                        ),
                        width: imageSize,
                        height: imageSize,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: NumbersConstants.paddingTopXXSmall,
                            bottom: NumbersConstants.paddingBottomMedium,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image: AssetImage(
                                  AssetsConstants.imageLikeIcon,
                                ),
                                width: imageSize,
                                height: imageSize,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: NumbersConstants.paddingLeftXBig,
                                ),
                                child: Text(
                                  '$aggregateLikes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: constraints.maxWidth >
                                            constraintsMaxWidth
                                        ? textAggregateLikesFontSizeFirst
                                        : textAggregateLikesFontSizeSecond,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
